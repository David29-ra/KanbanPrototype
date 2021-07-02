class Board
  attr_reader :id, :name, :description, :lists

  def initialize(name:, description:, lists: [], id: nil)
    @id = id
    @name = name
    @description = description
    @lists = lists
  end
end
