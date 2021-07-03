module StoreHelper
  def update_board(id, data)
    found = find_board id
    found.update data
    persist_json
  end

  def delete_board(id)
    @boards.delete_if { |board| board.id == id }
    persist_json
  end

  def find_board(id)
    @boards.find { |board| board.id == id }
  end

  def append_board(board)
    @boards << board
    persist_json
  end
end
