require 'CSV'

module Utilities

  # def list
  #     @list ||= parse_tasks_objects_from_file(file)
  # end

  def parse_tasks_objects_from_file
    CSV.read('todo.csv').map.with_index do |row, index|
    Task.new(id: index+1, task: row.join)
    end
  end

  def write_new_task_to_file(task_info)
    CSV.open("todo.csv", "ab") do |csv|
    csv << [task_info]
    end
  end

  def delete_task_from_file(id)
    CSV.open('todo.csv', 'a').map.with_index do |row, index|
    row.delete_if {index + 1 == id}
    end
  end
end

