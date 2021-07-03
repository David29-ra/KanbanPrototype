module ClinHelpers
  def add_check_item(_index, found_card)
    data = print_form_checkitem
    @store.append_checkitem found_card, data
  end

  def toggle_check_item(index, found_card)
    return puts("You need to enter ID") if index.zero?

    @store.toggle_check_item index, found_card
  end

  def delete_check_item(index, found_card)
    @store.delete_check_item index, found_card
  end
end
