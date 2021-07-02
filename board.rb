require_relative "list"
require_relative "card"

class Board
  attr_reader :name, :description, :lists, :id

  @id_sequence = 0

  def initialize(name:, description:, lists: [], id: nil)
    @id = id || self.class.next_id
    self.class.sequence = @id
    @name = name
    @description = description
    @lists = lists.map { |list_item| List.new list_item }
  end

  def update(data)
    @name = data[:name] unless data[:name].empty?
    @description = data[:description] unless data[:description].empty?
  end

  def self.sequence=(id)
    @id_sequence = id
  end

  def self.next_id
    @id_sequence += 1
  end

  def to_json(*_args)
    { id: @id, name: @name, description: @description, lists: lists }.to_json
  end
end
