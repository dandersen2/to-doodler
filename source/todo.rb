# What classes do you need?
- An empty list
  - An add task, to be added to the list
    - A completed task, to replace one on the list
    - An updated task, to replace one on the list
#Intro Ideas
# Create a default "task" that has all properties of a task, then addtask completetask and updatetask inherit and add to it



# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).
