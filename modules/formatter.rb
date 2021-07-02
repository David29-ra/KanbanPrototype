require "terminal-table"

module Formatter
  def welcome_message
    puts ("#" * 36).center(85)
    puts ("##{' ' * 6}Welcome to CLIn Boards#{' ' * 6}#").center(85)
    puts ("#" * 36).center(85)
  end

  def print_boards
    print_content("CLI Boards", %w[ID Name Description List(#cards)], @boards) do |bo|
      [bo.id, bo.name, bo.description, bo.lists[0].name] # Check list(#cards)
    end
  end

  def print_list_card(l_item)
    print_content(l_item.name, %w[ID Title Members Labels Due\ Date Checklist], l_item.cards) do |card|
      checklist_all = card.checklist.length
      checklist_completed = card.checklist.select { |cl| cl[:completed] }.length
      checklist_format = "#{checklist_completed}/#{checklist_all}"
      [card.id, card.title, card.members.join(", "), card.labels.join(", "), card.due_date, checklist_format]
    end
  end

  def print_content(title, headings, list, &row_formatter)
    table = Terminal::Table.new
    table.title = title
    table.headings = headings
    table.rows = list.map(&row_formatter)
    puts table
  end

  def show_board_options
    puts "Board options: create | show ID | update ID | delete ID\nexit"
    print ">"
  end
end
