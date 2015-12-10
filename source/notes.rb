
# What classes do you need?

# Classes: List, Task, Contoller, View

# List: Tasks
# Task: Text, Status

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).

#Get all tasks on a to-do list:
#   - Print all task objects available in a list object parsed from the CSV file


# Ruby todo.list = brings up empty to-do list
# Add a task to a to-do list:
#   - get user input from the command line, and
#   - pass that text as an arguement to instantiate a new task object
#   - pass that task object to the to-do list,
#   - add that task to the csv file

# Update the status on a task from "In-Progress" to "Completed" and
#
#       - Change the @status instance variable on a task object to "Completed"
#       - update that row on the csv
# Save all list objects (and their task children objects in a csv file)
# Parse CSV data so that it can easily be accessed when asking for all items on the to-do list
#

# end



