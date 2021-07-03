module ClinHelpers
  def delete_board(id)
    @store.delete_board id
  end

  def update_board(id)
    board_data = board_form
    @store.update_board id, board_data
  end

  def show_board(id)
    found_board = @store.find_board id
    action = ""
    until action == "back"
      found_board.lists.each { |li| print_list_card li }
      action, letter_id = print_menu_list
      action = "show_#{action}" if action == "checklist"
      action_sym = action.gsub("-", "_").to_sym

      return if action == "back"

      methods.include?(action_sym) ? method(action_sym).call(letter_id, found_board) : puts("Invalid action")

    end
  end

  def create_board(_id)
    board_data = board_form
    board = Board.new(board_data)
    @store.append_board board
  end
end
