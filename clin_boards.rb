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
    action = ""
    until action == "exit"
      action = gets.chomp

      case action
      when "create"
        puts "create"
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
    pp found_board
  end
end
