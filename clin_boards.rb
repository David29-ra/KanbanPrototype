require_relative "board"
require_relative "list"
require_relative "card"
require_relative "store"
require_relative "modules/formatter"
require_relative "modules/prompter"

class ClinBoards
  include Formatter
  include Prompter

  def initialize(store = "store.json")
    @store = Store.new(store)
    @boards = @store.boards
  end

  def start
    welcome_message
    action = ""
    until action == "exit"
      print_boards
      action, id = show_board_options
      action_sym = "#{action}_board".to_sym
      return end_message if action == "exit"

      methods.include?(action_sym) ? method(action_sym).call(id) : puts("Invalid option")

    end
  end

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

  def create_list(_id, found_board)
    list_name = list_form
    list = List.new list_name
    @store.append_list found_board, list
  end

  def update_list(name, found_board)
    found_list = @store.find_list_by_name found_board, name
    list_name = list_form
    found_list.update(list_name)
    @store.persist_json
  end

  def delete_list(list_name, found_board)
    # found_list = @store.find_list(found_board, list_name)
    @store.delete_list(found_board, list_name)
  end

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

  def update_card(id, _found_board)
    puts "update_card -> #{id}"
  end

  def delete_card(id, _found_board)
    puts "delete_card -> #{id}"
  end

  def show_checklist(id, found_board)
    found_card = @store.find_card found_board, id
    action = ""
    until action == "back"
      print_checklist_format found_card
      action, index = print_menu_card
      action_sym = "#{action}_check_item".to_sym
      return if action == "back"

      methods.include?(action_sym) ? method(action_sym).call(index, found_card) : puts("Invalid action")
    end
  end

  def add_check_item(_index, found_card)
    data = print_form_checkitem
    @store.append_checkitem found_card, data
  end

  def toggle_check_item(index, found_card)
    @store.toggle_check_item index, found_card
  end

  def delete_check_item(index, found_card)
    @store.delete_check_item index, found_card
  end
end
