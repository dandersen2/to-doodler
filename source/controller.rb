require_relative 'todo_file_parser'
require_relative 'view'

class Controller

  attr_accessor :list

  def initialize(list, view)
    @list = list #as an array
    @view = view
  end

  def user_action
    case ARGV[0]
    when "list"
      generate_todo_list
    when "add"
      @view.add_item(ARGV[1..-1])
      add_todo_item
      generate_todo_list
    when "delete"
      index = (ARGV[1].to_i - 1)
      @view.delete_item(@list[index])
      delete_todo_item
      generate_todo_list
    else
      @view.no_input
    end
  end

  def generate_todo_list
    @list.each_with_index{|task, index| @view.display_list(task, index + 1)}
  end

  def add_todo_item
    @list << ARGV[1..-1].join(" ")
  end

  def delete_todo_item
    index = (ARGV[1].to_i - 1)
    @list.delete_at(index)
  end

end
