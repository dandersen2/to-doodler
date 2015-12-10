require 'csv'
require 'pry'

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
    CSV.open('todo.csv', 'w+') do |csv|
      file_as_array.each do |row_to_convert_for_csv|
        csv << row_to_convert_for_csv
      end
    end
  end

  def add_to_list(number = -1, string)
    file_as_array.insert(number, [string]).to_a
    save_changes
  end

  def delete_from_list(number)
    unless number >= 1 && number <= file_as_array.length
    raise ArgumentError.new("Only numbers present on the list may be used.")
    end
    file_as_array.delete_at(number - 1)
    save_changes
  end

  def complete(number)
    unless number >= 1 && number <= file_as_array.length
    raise ArgumentError.new("Only numbers present on the list may be used.")
    p"congratulations on completing your task: #{file_as_array.flatten[number - 1].to_s}."
    delete_from_list(number)
    save_changes
  end

end