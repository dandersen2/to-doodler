require 'CSV'

module Utilities

  def parse_tasks_objects_from_file
    CSV.read('todo.csv').map.with_index do |row, index|
    Task.new(id: index+1, task: row.join)
    end
  end

  def save_tasks_to_file(list)
    CSV.open('todo.csv', 'wb') do |row|
      list.each do |task_object|
      row << [task_object.task]
      end
    end
  end
end

