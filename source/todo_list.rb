require_relative 'todo_list_task'
require 'csv'
require 'pry'

class TodoList
	attr_reader :path

	def initialize(args)
		@path = args.fetch(:path, nil)
		@is_ordered = args.fetch(:is_ordered, true)
		@is_complete = false
		create_new_csv_file(@path)
	end

	def create_new_csv_file(file_path)
		CSV.open('file_path', 'w')
	end

	def is_complete?
		self.tasks_todo
		self.tasks_todo.each do |task|
			return false if task.is_complete == false
		end
	end

	def complete_task(task)
		task.is_complete = true
	end

	def add_new_task
	end

	def is_ordered?
		return @is_ordered
	end

	def tasks_todo
		if @tasks_todo
			return @tasks_todo
		else
			generate_task_from_csv
		end
	end

	private

	def generate_task_from_csv
		@tasks_todo = []
		CSV.foreach(self.path) do |task|
			@tasks_todo << TodoListTask.new(descrip: task)
		end
	end

end