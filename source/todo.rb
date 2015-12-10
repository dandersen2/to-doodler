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
require_relative 'task'

# require 'date'

class ToDo
  attr_reader :file
  #attr_writer :task

  def initialize(file)
    @file = file
     @task_array = []
  end

  def parse_list
   CSV.foreach(self.file) do |row|
      row.each do |description|
        #make task obj using description
        #take that obj and pass it to the a self.add_task call
        #done
      @task_array << description = self.add_task#make a task and feed it the description
      end
    end
  end

  def add_task#if you call this in the parse then you probably need inpout, that input would be a task obj that you are adding???
    @task_array.push(Task.new)
    #p @task_array
  end


  def to_s
    p @task_array
  end
end




# class Task
#   attr_reader :task
#   def initialize
#     @task = ARGV
#   end

#   def print
#     @task = self.task.join
#   end

# end



# sample_list = ToDo.new("todo.csv")
# sample_list.parse_list
# sample_list.print_list




