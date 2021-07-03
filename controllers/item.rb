module StoreController
  def append_checkitem(card, data)
    card.checklist << data
    persist_json
  end

  def save_card_last_id(board, next_id)
    board.card_next_id = next_id
    persist_json
  end

  def toggle_check_item(current_id)
    current_id[:completed] = !current_id[:completed]
    persist_json
  end

  def delete_check_item(index, card)
    card.checklist.delete_at(index - 1)
    persist_json
  end
end
