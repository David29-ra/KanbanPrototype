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
        show_board 1
      when "update"
        update_board(1)
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

  def update_board(id)
    board_data = board_form
    @store.update_board id, board_data
  end

  def show_board(id)
    found_board = @store.find_board id
    found_board.lists.each { |li| print_list_card li }
  end

  def create_board
    board_data = board_form
    board = Board.new(board_data)
    puts board # delete later
    # @store.append_board board # to be used later
  end
end
