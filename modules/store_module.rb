module BoardOptions
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

module ListOptions
  def append_list(board, list)
    board.lists << list
    persist_json
  end

  def find_list_by_name(board, name)
    board.lists.find { |li| li.name == name }
  end

  def find_list(board, list_name)
    board.lists.find { |list| list.name == list_name }
  end

  def delete_list(board, list_name)
    board.lists.delete_if { |list| list.name == list_name }
  end
end

module CardOptions
  def append_card(list, card)
    list.cards << card
    persist_json
  end

  def update_card(board, id, data, name_list)
    found_card = find_card board, id
    found_card.update data
    found_list = find_list_by_name board, name_list
    delete_card board, id
    append_card found_list, found_card
    persist_json
  end

  def delete_card(board, id)
    board.lists.each do |li|
      li.cards.delete_if { |card| card.id == id }
    end
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
end

module ItemOptions
  def append_checkitem(card, data)
    card.checklist << data
    persist_json
  end

  def save_card_last_id(board, next_id)
    board.card_last_id = next_id
    persist_json
  end

  def toggle_check_item(index, card)
    card.checklist[index - 1][:completed] = !card.checklist[index - 1][:completed]
    persist_json
  end

  def delete_check_item(index, card)
    card.checklist.delete_at(index - 1)
    persist_json
  end
end
