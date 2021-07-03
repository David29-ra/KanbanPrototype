module StoreController
  def append_card(list, card)
    list.cards << card
    persist_json
  end

  def update_card(card, data)
    card.update data
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
