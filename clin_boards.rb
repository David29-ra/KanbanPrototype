require_relative "board"
require_relative "list"
require_relative "card"
require_relative "store"
require_relative "modules/formatter"
require_relative "modules/prompter"
require_relative "modules/helper2/board"
require_relative "modules/helper2/list"
require_relative "modules/helper2/card"
require_relative "modules/helper2/item"

class ClinBoards
  include Formatter
  include Prompter
  include ClinHelpers

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
end
