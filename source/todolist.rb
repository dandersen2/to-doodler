require 'csv'

class ToDoList
  attr_reader :file, :file_as_array

  def initialize(file)
    @file = file
    @file_as_array = []
  end

  def read
    CSV.foreach('todo.csv') do |row|
      file_as_array.push(row)
    end
    file_as_array
  end

  def save_changes
    CSV.open('updated_copy.csv', 'w+') do |csv|
      csv_str = file_as_array.inject([]) { |csv, row| csv << CSV.generate_line(row)}
    end
  end
end