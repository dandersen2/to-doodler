require 'pry'
require_relative 'utilities'
require_relative 'task'

class TaskList
  include Utilities
  attr_reader :list

  def initialize
    @list = parse_tasks_objects_from_file('todo.csv')
  end

  def add(task_info)
    list << Task.new(task: task_info)
    write_new_task_to_file(task_info)
  end

  def delete_by_id(id)
    list.delete_if { |task| task.id == id }
  end

end



# test = TaskList.new
# p test.list

# p test.add(id: 14, task: "Listen to The Beatles")
# p test.delete_by_id(14)

