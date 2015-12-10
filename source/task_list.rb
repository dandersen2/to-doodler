require_relative 'utilities'
require_relative 'task'

class TaskList
  include Utilities
  attr_reader :list

  def initialize
    @list = parse_tasks_from_file
  end

  def add(task_info)
    list << Task.new(task: task_info)
    save_tasks_to_file(list)
  end

  def delete(id)
    list.delete_if { |task| task.id == id }
    save_tasks_to_file(list)
  end

end
