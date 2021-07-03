require "json"
require_relative "board"
require_relative "modules/prompter"
require_relative "modules/helper/board"
require_relative "modules/helper/list"
require_relative "modules/helper/card"
require_relative "modules/helper/item"

class Store
  attr_reader :boards

  include StoreHelper

  def initialize(filename = "store.json")
    @filename = filename
    @boards = load_boards
  end

  def load_boards
    return json_parse(@filename) if File.exist?(@filename)

    File.write(@filename, [].to_json)
    json_parse(@filename)
  end

  def json_parse(filename)
    JSON.parse(File.read(filename), { symbolize_names: true }).map do |board|
      Board.new(board)
    end
  end

  def persist_json
    File.write(@filename, @boards.to_json) # Coment to prove, this acction is not ended
  end
end
