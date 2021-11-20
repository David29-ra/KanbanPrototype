require_relative "list"

class Board
  attr_reader :name, :description, :lists, :id
  attr_accessor :card_next_id

  @id_sequence = 0
  @id_card_next = 0

  def initialize(name:, description:, lists: [], id: nil, card_last_id: nil)
    @id = id || self.class.next_id
    self.class.sequence = @id
    @name = name
    @description = description
    @lists = lists.map { |list_item| List.new(**list_item) }
    @card_next_id = card_last_id || self.class.card_id
    self.class.sequence_card_id = @card_next_id
  end

  def update(data)
    @name = data[:name] unless data[:name].empty?
    @description = data[:description] unless data[:description].empty?
  end

  def self.sequence=(id)
    @id_sequence = id
  end

  def self.sequence_card_id=(id)
    @id_card_next = id
  end

  def self.card_id
    @id_card_next += 1
  end

  def self.next_id
    @id_sequence += 1
  end

  def to_json(*_args)
    { id: @id, name: @name, description: @description, lists: lists, card_last_id: card_next_id }.to_json
  end
end
