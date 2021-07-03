module StoreHelper
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
