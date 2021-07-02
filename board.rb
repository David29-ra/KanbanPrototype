class Board
  attr_reader :id, :name, :description, :lists

  @id_sequence = 0

  def initialize(name:, description:, lists: [], id: nil)
    @id = id || self.class.next_id
    self.class.sequence = @id
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
