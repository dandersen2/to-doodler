require 'csv'
require_relative 'Task'
class List
  attr_reader :file, :task_array

  def initialize(file)
    @file = file
    @task_array = []
  end

  def add_tasks
    CSV.foreach(@file) do |row|
      @task_array << Task.new(row[0])
      # binding.pry
    end
  end

  def remove_task(index)
     p "Deleted Task #{@task_array[index]}"
    @task_array.delete_at(index)
  end

  # def update_task(index, new_content)
  #   # p "Updated #{@task_array[index]} to #{new_string}"
  #  current_task = @task_array[index]
  #  current_task.update(new_content)
  # end

  def to_s
    "Your list is currently #{@task_array}!"
  end
end


