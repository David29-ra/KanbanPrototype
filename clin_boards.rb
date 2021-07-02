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
      action, _id = show_board_options
      case action
      when "create"
        create_board
      when "show"
        show_board 1
      when "update"
        puts "update"
      when "delete"
        delete_board(1)
      when "exit"
        puts "Goodbye!"
      else puts "Invalid option"
      end
    end
  end

  def delete_board(id)
    @store.delete_board id
  end

  def show_board(id)
    found_board = @store.find_board id
    found_board.lists.each { |li| print_list_card li }
  end

  def create_board
    board_data = board_form
    board = Board.new(board_data)
    @store.append_board board
  end
end
