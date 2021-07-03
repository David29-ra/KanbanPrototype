module ClinHelpers
  def show_checklist(id, found_board)
    found_card = @store.find_card found_board, id
    action = ""
    until action == "back"
      print_checklist_format found_card
      action, index = print_menu_card
      action_sym = "#{action}_check_item".to_sym
      return if action == "back"

      methods.include?(action_sym) ? method(action_sym).call(index, found_card) : puts("Invalid action")
    end
  end

  def create_list(_id, found_board)
    list_name = list_form
    list = List.new list_name
    @store.append_list found_board, list
  end

  def update_list(name, found_board)
    found_list = @store.find_list_by_name found_board, name
    list_name = list_form
    found_list.update(list_name)
    @store.persist_json
  end

  def delete_list(list_name, found_board)
    @store.delete_list(found_board, list_name)
  end
end
