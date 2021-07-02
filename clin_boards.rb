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
      action_sym = action.gsub("-", "_").to_sym

      return if action == "back"

      methods.include?(action_sym) ? method(action_sym).call(letter_id) : puts("Invalid action")

    end
  end

  def create_board
    board_data = board_form
    board = Board.new(board_data)
    @store.append_board board
  end

  def create_list(_content)
    puts "create_list"
  end

  def update_list(id)
    puts "update_list -> #{id}"
  end

  def delete_list(id)
    puts "delete_list -> #{id}"
  end

  def create_card(_content)
    puts "create_card"
  end

  def update_card(id)
    puts "update_card -> #{id}"
  end

  def delete_card(id)
    puts "delete_card -> #{id}"
  end
end
