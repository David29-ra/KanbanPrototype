require_relative "card"

class List
  attr_reader :name, :cards, :id

  @id_sequence = 0

  def initialize(name:, cards: [], id: nil)
    @id = id || self.class.next_id
    self.class.sequence = @id
    @name = name
    @cards = cards.map { |card| Card.new card }
  end

  def to_json(*_args)
    { id: @id, name: @name, cards: @cards }.to_json
  end

  def update(data)
    @name = data[:name] unless data[:name].empty?
  end

  def self.sequence=(id)
    @id_sequence = id
  end

  def self.next_id
    @id_sequence += 1
  end
end
