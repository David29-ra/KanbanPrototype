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
    print_boards
    show_board_options
    action = ""
    until action == "exit"
      action = gets.chomp

      case action
      when "create"
        create_board
      when "show"
        puts "show"
      when "update"
        puts "update"
      when "delete"
        puts "delete"
      when "exit"
        puts "Goodbye!"
      else puts "Invalid option"
      end
    end
  end

  def create_board
    board_data = board_form
    board = Board.new(board_data)
    puts board # delete later
    # @store.append_board board # to be used later
  end
end
