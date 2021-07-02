require "json"
require_relative "board"

class Store
  attr_reader :boards

  def initialize(filename)
    @filename = filename
    @boards = load_boards
  end

  def load_boards
    JSON.parse(File.read(@filename), { symbolize_names: true }).map do |board|
      Board.new(board)
    end
  end
end
