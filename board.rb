require_relative "list"

class Board
  attr_reader :name, :description, :lists, :id
  attr_accessor :card_last_id

  @id_sequence = 0
  @last_id_card = 0

  def initialize(name:, description:, lists: [], id: nil, card_last_id: nil)
    @id = id || self.class.next_id
    self.class.sequence = @id
    @name = name
    @description = description
    @lists = lists.map { |list_item| List.new list_item }
    @card_last_id = card_last_id || self.class.card_id
    self.class.sequence_card_id = @card_last_id
  end

  def update(data)
    @name = data[:name] unless data[:name].empty?
    @description = data[:description] unless data[:description].empty?
  end

  def self.sequence=(id)
    @id_sequence = id
  end

  def self.sequence_card_id=(id)
    @last_id_card = id
  end

  def self.card_id
    @last_id_card += 1
  end

  def self.next_id
    @id_sequence += 1
  end

  def to_json(*_args)
    { id: @id, name: @name, description: @description, lists: lists, card_last_id: card_last_id }.to_json
  end
end
