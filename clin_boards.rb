require_relative "store"
require_relative "models/board"
require_relative "models/list"
require_relative "models/card"
require_relative "commons/helper/formatter"
require_relative "commons/helper/prompter"
require_relative "commons/utils/board"
require_relative "commons/utils/list"
require_relative "commons/utils/card"
require_relative "commons/utils/item"

class ClinBoards
  include Formatter
  include Prompter
  include ClinUtils

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
