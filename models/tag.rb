require_relative('db/sqlrunner')

class Tag

  attr_reader :id, :name

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @name = info['info']
  end

  def save()
    sql = 'INSERT INTO tags (name) VALUES ($1) RETURNING id;'
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = 'SELECT * FROM tags;'
    tags = SqlRunner.run(sql)
    return tags.map{ |tag| Tag.new(tag) }
  end

  def self.delete_all()
    sql = 'DELETE FROM tags;'
    SqlRunner.run(sql)
  end

end