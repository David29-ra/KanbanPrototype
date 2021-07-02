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
end
