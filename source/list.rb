require 'csv'
require_relative 'Task'
class List
  attr_reader :file, :task_array

  def initialize(file)
    @file = file
    @task_array = []
    # @task_hash = {}
  end

  def parse_csv
    CSV.foreach(@file) do |row|
      @task_array << Task.new(row[0])
      # binding.pry
    end
  end
  def save_csv
    CSV.open(@file, 'wb') do |csv_object|
    @task_array.each do |row_array|
    csv_object << row_array
    end
    end
  end
  def add_task(new_task)
    @task_array << new_task
  end

  def remove_task(index)
    @task_array.delete_at(index)
  end
end
  # def update_task(index, new_content)
  #   # p "Updated #{@task_array[index]} to #{new_string}"
  #  current_task = @task_array[index]
  #  current_task.update(new_content)
  # end



#   def list_to_hash
#     @task_hash = {"one" => @task_array[0],
#     "two" => @task_array[1],
#     "three" => @task_array[2],
#     "four" => @task_array[3],
#     "five" => @task_array[4],
#     "six" => @task_array[5],
#     "seven" => @task_array[6],
#     "eight" => @task_array[7],
#     "nine" => @task_array[8],
#     "ten" => @task_array[9],
#     "eleven" => @task_array[10],
#     "twelve" => @task_array[11],
#     "thirteen" => @task_array[12]}
#   end
# end


