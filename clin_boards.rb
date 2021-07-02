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
      case action
      when "create"
        create_board
      when "show"
        show_board id
      when "update"
        update_board id
      when "delete"
        delete_board id
      when "exit"
        puts "Goodbye!"
      else puts "Invalid option"
      end
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
      puts letter_id
      action = "show_#{action}" if action == "checklist"
      action_sym = action.gsub("-", "_").to_sym

      return if action == "back"

      methods.include?(action_sym) ? method(action_sym).call(letter_id, found_board) : puts("Invalid action")

    end
  end

  def create_board
    board_data = board_form
    board = Board.new(board_data)
    @store.append_board board
  end

  def create_list(_id, found_board)
    list_name = list_form
    list = List.new list_name
    @store.append_list found_board, list
  end

  def update_list(id, _found_board)
    puts "update_list -> #{id}"
  end

  def delete_list(list_name, found_board)
    # found_list = @store.find_list(found_board, list_name)
    @store.delete_list(found_board, list_name)
  end

  def create_card(_content, found_board)
    # name_list = print_list_names found_board
    # found_list = @store.find_list_by_name found_board, name_list
    # card = print_form_card
    # new_card = Card.new(card)
    # pp new_card
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
