module StoreHelper
  def append_list(board, list)
    board.lists << list
    persist_json
  end

  def find_list_by_name(board, name)
    board.lists.find { |li| li.name == name }
  end

  def find_list(board, list_name)
    board.lists.find { |list| list.name == list_name }
  end

  def delete_list(board, list_name)
    board.lists.delete_if { |list| list.name == list_name }
  end
end
