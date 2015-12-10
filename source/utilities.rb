require 'CSV'

module Utilities

  # def list
  #     @list ||= parse_tasks_objects_from_file(file)
  # end

  def parse_tasks_objects_from_file(file)
    CSV.read(file).map.with_index do |row, index|
    Task.new(id: index+1, task: row.join)
    end
  end

  def write_new_task_to_file(task_info)
    CSV.open("todo.csv", "ab") do |csv|
    csv << [task_info]
    end
  end

  def delete_task_from_file(task_number)
    CSV.
  end
end

