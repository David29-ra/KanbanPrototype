require "colorize"

module StoreHelper
  def append_checkitem(card, data)
    return puts("You need to add a task".red) if data[:title].empty?

    card.checklist << data
    persist_json
  end

  def save_card_last_id(board, next_id)
    board.card_last_id = next_id
    persist_json
  end

  def toggle_check_item(index, card)
    current_id = card.checklist[index - 1]
    return puts("Invalid ID") if current_id.nil?

    current_id[:completed] = !current_id[:completed]
    persist_json
  end

  def delete_check_item(index, card)
    card.checklist.delete_at(index - 1)
    persist_json
  end
end
