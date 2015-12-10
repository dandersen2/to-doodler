require_relative 'task_parser'
require_relative 'task'

class TaskList
  attr_reader :list

  def initialize
    @list = TaskParser.new('todo.csv').list
  end

  def list
    @list
  end

  def add(task_info)
    new_task = Task.new(task_info)
    list << new_task
    new_task.write_task_to_csv
  end

  def delete_by_id(id)
    list.delete_if { |task| task.id == id }
  end

end

# test = TaskList.new
# p test.list
# p test.add(id: 14, task: "Listen to The Beatles")
# p test.delete_by_id(14)

