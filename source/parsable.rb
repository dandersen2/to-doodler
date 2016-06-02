require 'pry'
require 'csv'
require 'date'
require_relative 'task'
require_relative 'task_list'

module Parsable

  def csv_parser(file)
    task_array = []
    CSV.foreach(file).each_slice(2) do |row|
      if row[1] == nil
        row[1] = ["all"]
      end
      task_array << Task.new( {task_id: row[0][0], completed: row[0][1], content: row[0][2], created_at: DateTime.strptime(row[0][3], '%Y-%m-%dT%H:%M:%S%z'), completed_at: DateTime.strptime(row[0][4], '%Y-%m-%dT%H:%M:%S%z'), :tags => row[1]})
    end
      task_array
  end

  def csv_write(new_list, output_file)
    CSV.open(output_file, "wb") do |csv|
      new_list.each_with_index do |task_object, i|
        task_array = []
        task_array << i + 1
        task_array << task_object.completed
        task_array << task_object.content
        task_array << task_object.created_at
        task_array << task_object.completed_at
        csv << task_array
        csv << task_object.tags
      end
    end
  end

end
