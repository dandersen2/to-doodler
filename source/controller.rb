
require_relative 'todo'



class Controller
	attr_accessor :todo, :input, :add_task, :my_todo, :list, :file
	def initialize(file)
		@my_todo = ToDo.new(file)
		run_interface
	end

	def run_interface
		@my_todo.parse_list
		@my_todo.print_list
		get_input
	end

	def get_input
		puts "Enter a task or type \'quit\' to quit"
		input = gets.chomp
		until input == 'quit'
			@my_todo.add_task(input)
			puts "Enter a task or type \'quit\' to quit"
			input = gets.chomp
		end
	end
end

my_controller = Controller.new("todo.csv")
my_controller