class Board
  attr_reader :name, :description, :lists, :id

  @id_sequence = 0

  def initialize(name:, description:, lists: [], id: nil)
    @id = id || self.class.next_id
    self.class.sequence = @id if id
    @name = name
    @description = description
    @lists = lists
  end

  def self.sequence=(id)
    @id_sequence = id
  end

  def self.next_id
    @id_sequence += 1
  end
end
