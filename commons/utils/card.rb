require "colorize"

module ClinUtils
  def create_card(_content, found_board)
    name_list = get_name_list found_board
    return if name_list.nil?

    found_list = @store.find_list_by_name found_board, name_list
    card = print_form_card
    next_id = found_board.card_next_id
    new_card = Card.new(card)
    @store.append_card found_list, new_card
    @store.save_card_last_id found_board, next_id
  end

  def update_card(id, found_board)
    return puts("You need an ID".red) if id.zero?

    found_card = @store.find_card found_board, id
    return puts("ID Not found".red) if found_card.nil?

    name_list = get_name_list found_board
    card_data = print_form_card
    @store.update_card found_card, card_data
    found_list = @store.find_list_by_name found_board, name_list
    @store.delete_card found_board, id
    @store.append_card found_list, found_card
    @store.persist_json
  end

  def get_name_list(board)
    name_list = ""
    while name_list.empty?
      name_list = print_list_names board
      return puts("You need create an list".red) if name_list.nil?

      puts("You need an name list".red) if name_list.empty?
    end
    name_list
  end

  def delete_card(id, found_board)
    @store.delete_card found_board, id
  end
end
