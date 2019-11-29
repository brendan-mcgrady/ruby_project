require_relative('db/sqlrunner')

class Tag

  attr_reader :id, :name

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @name = info['info']
  end

end
