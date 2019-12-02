# class Transaction
#
#   attr_reader :id, :merchant_id, :tag_id, :trans_time, :amount
#
#   def initialize(info)
#     @id = info['id'].to_i() if info['id']
#     @merchant_id = info['merchant_id'].to_i()
#     @tag_id = info['tag_id'].to_i()
#     @trans_time = info['trans_time']
#     @amount = info['amount'].to_i()
#   end
#
#   def save()
#     sql = 'INSERT INTO transactions (merchant_id, tag_id, trans_time, amount)
#            VALUES ($1, $2, $3, $4) RETURNING id;'
#     values = [@merchant_id, @tag_id, @trans_time, @amount]
#     result = SqlRunner.run(sql, values)
#     @id = result[0]['id'].to_i()
#   end
#
#
#
# end