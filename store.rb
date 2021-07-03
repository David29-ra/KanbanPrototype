require "json"
require_relative "board"
require_relative "modules/prompter"
require_relative "modules/store_module"

class Store
  attr_reader :boards

  include BoardOptions
  include ListOptions
  include CardOptions
  include ItemOptions

  def initialize(filename)
    @filename = filename
    @boards = load_boards
  end

  def persist_json
    File.write(@filename, @boards.to_json) # Coment to prove, this acction is not ended
  end
end
