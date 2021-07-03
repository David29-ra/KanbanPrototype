module ClinHelpers
  def create_card(_content, found_board)
    name_list = print_list_names found_board
    return if name_list.nil?

    found_list = @store.find_list_by_name found_board, name_list
    card = print_form_card
    next_id = found_board.card_last_id
    new_card = Card.new(card)
    @store.append_card found_list, new_card
    @store.save_card_last_id found_board, next_id
  end

  def update_card(id, found_board)
    name_list = print_list_names found_board
    card_data = print_form_card
    @store.update_card found_board, id, card_data, name_list
  end

  def delete_card(id, found_board)
    @store.delete_card found_board, id
  end
end
