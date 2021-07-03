require "json"
require_relative "models/board"
require_relative "commons/helper/prompter"
require_relative "controllers/board"
require_relative "controllers/list"
require_relative "controllers/card"
require_relative "controllers/item"

class Store
  attr_reader :boards

  include StoreController

  def initialize(filename = "store.json")
    @filename = "db/#{filename}"
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
