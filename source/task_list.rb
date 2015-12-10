require_relative 'task_parser'

class TaskList
  attr_reader :list

  def initialize
    @list = TaskParser.new('todo.csv').list
  end

  def add(task_info)
    list << Task.new(task_info)
  end

  def delete_by_id(id)
    list.delete_if { |task| task.task_id == id }
  end

end

# test = TaskList.new
# p test.list
# p test.add(task_id: 14, task: "Listen to The Beatles")
# p test.delete_by_id(14)

