# I AM JACK's GROWING SENSE OF URGENCY AS HE RUNS OUT OF TIME. FIGHT OR FLIGHT?
require 'pry'
require_relative 'task_parser'
require_relative 'task'
require_relative 'task_list'


# Parse the data in the todo.csv file into ruby todo objects
# parsed_csv = TaskParser.new('todo.csv')

# my_to_do_list = parsed_csv.populate_task_list

# urgent_task = Task.new(task_list)
# p urgent_task

# binding.pry

# p my_to_do_list
# puts urgent_task



# MAKE A NEW LIST!
#create a new empty task list
thursday_task_list = TaskList.new

#print out the empty list to confirm
p thursday_task_list


# MAKE A NEW TASK!
# create a new task ("Walk the dog")
my_new_task = Task.new("Walk the Dog")

# print out my_new_task
p my_new_task

# add  my_new_task to thursday_task_list
thursday_task_list.add(my_new_task)

# print out thursday_task_list
# p thursday_task_list

# create a second task
my_new_task_2 = Task.new("Get a haircut")

# add a second todo to the thursday task_list
thursday_task_list.add(my_new_task_2)

# print out the new list (the objects within it)
p thursday_task_list



