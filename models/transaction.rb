class Transaction

  attr_reader :id
  attr_accessor :merchant_id, :tag_id, :trans_time, :amount

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @merchant_id = info['merchant_id'].to_i()
    @tag_id = info['tag_id'].to_i()
    @trans_time = info['trans_time']
    @amount = info['amount'].to_i()
  end

  def save()
    sql = 'INSERT INTO transactions (merchant_id, tag_id, trans_time, amount)
           VALUES ($1, $2, $3, $4) RETURNING id;'
    values = [@merchant_id, @tag_id, @trans_time, @amount]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = 'SELECT * FROM transactions;'
    transactions = SqlRunner.run(sql)
    return transactions.map{ |transaction| Transaction.new(transaction) }
  end

  def self.find()
    sql = 'SELECT * FROM transactions WHERE id = $1;'
    values = [id]
    found_transaction = SqlRunner.run(sql, values)
    return Transaction.new(found_transaction.first())
  end

  def tag()
    sql = 'SELECT * FROM tags WHERE id = $1'
    values = [@tag_id]
    results = SqlRunner.run(sql, values)
    return Tag.new(results.first)
  end

  def merchant()
    sql = 'SELECT * FROM merchants WHERE id = $1'
    values = [@merchant_id]
    result = SqlRunner.run(sql, values)
    return Merchant.new(result.first)
  end

  def self.delete_all()
    sql = 'DELETE FROM transactions;'
    SqlRunner.run(sql)
  end

  # def self.total()
  #   sql = 'SELECT SUM(amount) FROM transactions;'
  #   result = SqlRunner.run(sql)
  #   return result.to_i()
  # end

end
