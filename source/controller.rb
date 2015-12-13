require_relative 'todo_file_parser'
require_relative 'view'

class Controller

  attr_accessor :list

  def initialize(list, view)
    @list = list
    @view = view
    @index = (ARGV[1].to_i - 1)
    @list_array = list.todo_list_array
  end

  def user_action
    case ARGV[0]
    when "list"
      generate_todo_list
    when "add"
      @view.add_item(ARGV[1..-1].join(" "))
      add_todo_item
      generate_todo_list
    when "delete"
      @view.delete_item(@list_array[@index][0])
      delete_todo_item
      generate_todo_list
    when "complete" || "completed"
      @view.complete_message(@list_array[@index][0].split(' ')[1..-1].join(' '))
      complete_todo_item
      generate_todo_list
    else
      @view.no_input
    end
  end

  def generate_todo_list
    @list.generate_task.each_with_index{|task, index| @view.display_list(task.join(" "), index + 1)}
  end

  def add_todo_item
    CSV.open('todo.csv', 'a') {|csv| csv << [[]] + ARGV[1..-1]}
  end

  def delete_todo_item
    revised_list = @list_array - @list_array.delete_at(@index)
    CSV.open('todo.csv', 'w') {|csv| revised_list.each {|task| csv << task}}
  end

  def complete_todo_item
    completed_array = []
    completed = @list_array[@index]
    completed_array << "\u2713 " + completed[0].split(' ')[1..-1].join(' ')
    delete_todo_item
    CSV.open('todo.csv', 'a') {|csv| csv << completed_array}
  end

end
