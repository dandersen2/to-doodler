require 'csv'
class List
  attr_reader :file, :task_array

  def initialize(file)
    @file = file
    @task_array = []
  end

  def add_tasks
    CSV.foreach(@file, ) do |row|
      @task_array << Task.new(row[0])
      # binding.pry
    end
    p @task_array
  end

  def remove_task(index)
     p "Deleted Task #{@task_array[index]}"
    @task_array.delete_at(index)
  end

  def update_task(index)
    # p "Updated #{@task_array[index]} to #{new_string}"
   current_task = @task_array[index] #call task.update_task at this index
   current_task.update
  end

  def to_s
    "Your list is currently #{@task_array}!"
  end
end
x = List.new("todo.csv")
p x.add_tasks
