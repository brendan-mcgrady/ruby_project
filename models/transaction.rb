class Transaction

  attr_reader :id, :merchant_id, :tag_id, :trans_timestamp, :amount

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @merchant_id = info['merchant_id'].to_i()
    @tag_id = info['tag_id'].to_i()
    @trans_timestamp = info['trans_timestamp']
    @amount = info['amount'].to_i()
  end

  def save()
    sql = 'INSERT INTO transactions (merchant_id, tag_id, trans_timestamp, amount)
           VALUES ($1, $2, CURRENT_TIMESTAMP, $3) RETURNING id;'
    values = [@merchant_id, @tag_id, @amount]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end



end
