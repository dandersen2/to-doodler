#require_realtive 'task'
require 'csv'
#require_relative 'task'


# What classes do you need? Task, ToDo, Controller, View

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).

class ToDo
	attr_accessor :list, :task_to_add, :task, :file
	def initialize('todo.csv')
		# @my_todoList = ToDo.new
		@file = 'todo.csv'
		@list = []
		@task_to_add = ''
	end

	def parse_list
		CSV.foreach(@file) do |task_item|
		p	@list << task_item
		end	
	end

	def print_list
		@list.each_with_index do |task_item, index|
			puts (index+1).to_s + ' ' + task_item.join
		end
	end

	# def add_task
	# 	puts "would you like to add a task? Enter add or exit"
	# 	input = gets.chomp
	# 		until input == 'exit'
	# 			if input == 'add'
	# 				puts 'type your task into the command line'
	# 			else
	# 				puts 'I did not understand that command'
	# 				break
	# 			end
	# 		end
	# 		add_task
	# end
end

my_todo = ToDo.new('todo.csv')
p my_todo.print_list




#####################
require_relative 'todo'


class Task 
	def initialize
		#@my_to_do_list = ToDo.new
		puts '***Type \'add\' to add a new task, or \'exit\' to exit.***'
		@input = gets.chomp

	end
	
	def task_info
		#input = gets.chomp
		until @input == 'exit'
			if @input == 'add'
				puts "Type you task in here"
				 @input = gets.chomp
			@my_todo_list.add_task(@input)
			@my_todo_list.print_list
			end
			input = gets.chomp
		end
	end
end

   # @my_todo_list.add_task(task)
   #    @view.show_task(@jessies_todo_list.task_array)

   my_task = Task.new
   my_task.task_info