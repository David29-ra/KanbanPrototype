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

  def delete_board(id)
    @boards.delete_if { |board| board.id == id }
    persist_json
  end

  def persist_json
    File.write(@filename, @boards.to_json)
  end
end
