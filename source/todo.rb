# What classes do you need?
#Todo, #List Parser


# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).

require 'pry'
require 'csv'

# require 'date'

class ToDo
  attr_reader :file
  #attr_writer :task

  def initialize(file)
    @file = file
    @task_has = {}
     #@task_array = []
  end

  def parse_list
   CSV.foreach(self.file) do |row|
      row.each do |task|
        num = 0
        @task_hash[num+1] = task
      #@task_array << task
      end
    end
  @task_hash
  end

  def add_task
    @task_array.push(Task.new.task.join)
    #p @task_array
  end

  # def delete_task
  #   task_to_delete = ARGV
  #   @task_array.delete(task_to_delete)
  # end


  def print_list
    puts @task_hash
  end
end

class Task
  attr_reader :task
  def initialize
    @task = ARGV
  end

  def print
    @task = self.task.join
  end

end


sample_list = ToDo.new("todo.csv")
sample_list.parse_list
sample_list.print_list



binding.pry

