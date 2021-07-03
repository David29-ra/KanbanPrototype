require "colorize"

module ClinUtils
  def add_check_item(_index, found_card)
    data = print_form_checkitem
    return puts("You need to add a task".red) if data[:title].empty?

    @store.append_checkitem found_card, data
  end

  def toggle_check_item(index, found_card)
    return puts("You need to enter ID".red) if index.zero?

    current_id = found_card.checklist[index - 1]
    return puts("Invalid ID") if current_id.nil?

    @store.toggle_check_item current_id
  end

  def delete_check_item(index, found_card)
    @store.delete_check_item index, found_card
  end
end
