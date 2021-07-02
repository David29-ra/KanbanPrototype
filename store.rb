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

  def append_list(board, list)
    board.lists << list
    persist_json
  end

  def find_card(board, id)
    found_card = nil
    board.lists.each do |li|
      card_temp = li.cards.find { |card| card.id == id }
      found_card = card_temp if card_temp
    end
    found_card
  end

  def append_checkitem(card, data)
    card.checklist << data
    persist_json
  end

  def toggle_check_item(index, card)
    card.checklist[index - 1][:completed] = !card.checklist[index - 1][:completed]
    persist_json
  end

  # def delete_check_item(index, card)
  # end
end
