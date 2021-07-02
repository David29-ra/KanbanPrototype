require "terminal-table"

module Formatter
  def welcome_message
    puts "#" * 36
    puts "##{' ' * 6}Welcome to CLIn Boards#{' ' * 6}#"
    puts "#" * 36
  end

  def print_boards
    print_content("CLI Boards", %w[ID Name Description List(#cards)], @boards) do |bo|
      [bo.id, bo.name, bo.description, bo.lists[0][:name]] # Check list(#cards)
    end
  end

  def print_content(title, headings, list, &row_formatter)
    table = Terminal::Table.new
    table.title = title
    table.headings = headings
    table.rows = list.map(&row_formatter)
    puts table
  end
end
