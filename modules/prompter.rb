module Prompter
  def board_form
    print "Name: "
    name = gets.chomp
    print "Description: "
    description = gets.chomp
    { name: name, description: description }
  end

  def print_menu_list
    puts "List options: create-list | update-list LISTNAME | delete-list LISTNAME"
    puts "Card options: create-card | checklist ID | update-card ID | delete-card ID\nback"
    print "> "
    action, letter_id = gets.chomp.split
    regex = /[a-zA-Z]/
    return [action, letter_id] if letter_id&.match?(regex)

    [action, letter_id.to_i]
  end

  def welcome_message
    puts "#" * 36
    puts "##{' ' * 6}Welcome to CLIn Boards#{' ' * 6}#"
    puts "#" * 36
  end

  def show_board_options
    puts "Board options: create | show ID | update ID | delete ID\nexit"
    print ">"
    action, id = gets.chomp.split # ["show", "1"]
    [action, id.to_i]
  end

  def list_form
    print "Name: "
    name = gets.chomp.strip
    { name: name }
  end

  def print_checklist_format(card)
    puts "Card: #{card.title}"
    card.checklist.each_with_index do |task, index|
      puts "[#{task[:completed] ? 'x' : ' '}] #{index + 1}. #{task[:title]}"
    end
    puts "-------------------------------------"
  end

  def print_menu_card
    puts "Checklist options: add | toggle INDEX | delete INDEX\nback"
    print "> "
    action, index = gets.chomp.split
    [action, index.to_i]
  end

  def print_form_checkitem
    print "Title: "
    title = gets.chomp.strip
    { title: title, completed: false }
  end
end
