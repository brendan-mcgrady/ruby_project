require_relative('../db/sqlrunner')

class Merchant

  attr_reader :id, :name

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @name = info['name']
  end

  def save()
    sql = 'INSERT INTO merchants (name) VALUES ($1) RETURNING id;'
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = 'SELECT * FROM merchants;'
    merchants = SqlRunner.run(sql)
    return merchants.map{ |merchant| Merchant.new(merchant)}
  end

  def delete_all()
    sql = 'DELETE FROM merchants;'
    SqlRunner.run(sql)
  end

end
