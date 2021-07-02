require "json"
require_relative "board"
require_relative "modules/prompter"

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

  def update_board(id, data)
    found = find_board id
    found.update data
    # persist_json
  end

  def delete_board(id)
    @boards.delete_if { |board| board.id == id }
    # persist_json
  end

  def persist_json
    File.write(@filename, @boards.to_json) # Coment to prove, this acction is not ended
  end

  def find_board(id)
    @boards.find { |board| board.id == id }
  end

  def append_board(board)
    @boards << board
    persist_json
  end

  def find_card(board, id)
    found_card = nil
    board.lists.each do |li|
      card_temp = li.cards.find { |card| card.id == id }
      found_card = card_temp if card_temp
    end
    found_card

  def find_list(board, id)
    puts board, id # delete later
  end

  def delete_list(board_id, list_id)
    found_board = find_board id
    puts found_board
    puts found_board.lists
    # found_board.lists.delete_if( |list| list.id == list_id)
    # persist_json
  end
end
