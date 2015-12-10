# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).

=begin

DEFINE class 'Controller'
	
	DEFINE function 'initialize'
		CALL 'TerminalView' function 'get_input'

DEFINE class 'TerminalView'
	
	DEFINE function 'get_input'
		RETURN user input

DEFINE class 'TodoList'
	CREATE array 'tasks_todo'

	DEFINE function 'add_new_task' which has one parameter: 'task'
		ADD 'task' to 'tasks_todo'
	
	DEFINE function 'tasks_todo'
		RETURN 'tasks_todo'

	DEFINE function 'generate_task_from_csv'
		CREATE array 'csv_tasks'
		CREATE array 'list_of_tasks'
		ITERATE over 'csv_tasks'
			CREATE new 'TodoListTask' called 'task'
				PASS row from 'csv_tasks'
			ADD 'task' to 'list_of_tasks'
		RETURN 'list_of_tasks'

DEFINE class 'TodoListTask'
	CREATE string 'task_descrip'
	CREATE boolean 'is_complete'

	DEFINE function 'is_complete?'
		RETURN is_complete

=end
require 'csv'
require 'pry'

class TodoList

	def add_new_task
	end

	def tasks_todo
		if @tasks_todo
			return @tasks_todo
		else
			@tasks_todo = CSV.read('todo.csv').flatten
		end
	end

end

binding.pry

puts "done!"