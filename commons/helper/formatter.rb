require "terminal-table"
require "colorize"

module Formatter
  def print_boards
    print_content("CLIn Boards".black.on_green, %w[ID Name Description List(#cards)], @boards) do |bo|
      lists_cardnumber = bo.lists.map { |li_c| "#{li_c.name}(#{li_c.cards.size.to_s.red})" }.join(", ")
      [bo.id.to_s.red, bo.name, bo.description, lists_cardnumber]
    end
  end

  def print_list_card(l_item)
    name_list = l_item.name.to_s.black.on_green
    print_content(name_list, %w[ID Title Members Labels Due\ Date Checklist], l_item.cards) do |card|
      checklist_completed = card.checklist.select { |cl| cl[:completed] }.length
      checklist_format = "#{checklist_completed}/#{card.checklist.length}"
      colorize_card card, checklist_format
    end
  end

  def colorize_card(card, checklist_format)
    [
      card.id.to_s.red, card.title, card.members.join(", "),
      card.labels.join(", "), card.due_date, checklist_format.to_s.black.on_green
    ]
  end

  def print_content(title, headings, list, &row_formatter)
    table = Terminal::Table.new
    table.title = title
    table.headings = headings
    table.rows = list.map(&row_formatter)
    puts table
  end
end
