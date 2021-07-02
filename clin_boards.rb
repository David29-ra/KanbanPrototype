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
    action = ""
    until action == "exit"
      action = gets.chomp

      case action
      when "create"
        puts "create"
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
end
