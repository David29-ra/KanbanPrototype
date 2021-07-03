require "colorize"

module ClinUtils
  def delete_board(id)
    return puts("Invalid ID".red) if id.zero?

    @store.delete_board id
  end

  def update_board(id)
    return puts("Invalid ID".red) if id.zero?

    found_board = @store.find_board id
    return puts("Invalid ID".red) if found_board.nil?

    board_data = board_form
    @store.update_board board_data, found_board
  end

  def show_board(id)
    found_board = @store.find_board id
    return puts("Invalid ID".red) if found_board.nil?

    action = ""
    until action == "back"
      action, letter_id = print_list_and_menu found_board
      action = "show_#{action}" if action == "checklist"
      action_sym = action.gsub("-", "_").to_sym

      return if action == "back"

      methods.include?(action_sym) ? method(action_sym).call(letter_id, found_board) : puts("Invalid action".red)
    end
  end

  def print_list_and_menu(board)
    board.lists.each { |li| print_list_card li }
    print_menu_list
  end

  def create_board(_id)
    board_data = board_form
    board = Board.new(board_data)
    @store.append_board board
  end
end
