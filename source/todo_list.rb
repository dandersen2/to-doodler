require_relative 'todo_list_task'
require_relative 'csv_readable'
require 'csv'
require 'pry'

class TodoList
	include CsvReadable

	attr_reader :path

	def initialize(args)
		@path = args.fetch(:path, 'new_list.csv')
		@is_ordered = args.fetch(:is_ordered, true)
		@is_complete = false
	end

	def is_ordered?
		return @is_ordered
	end

	def is_complete?
		self.tasks_todo.each do |task|
			return false if task.is_complete == false
		end
	end

	def to_s
		list_of_tasks = self.tasks_todo.map do |task|
			if task.is_complete?
				complete_tag = "X"
			else
				complete_tag = " "
			end
			"#{task.num}. [#{complete_tag}] #{task.descrip}\n"
		end
		list_of_tasks.join
	end

	def add_new_task(task_args)
		task_num = self.tasks_todo.length + 1
		self.tasks_todo << TodoListTask.new(task_args)
		update_tasks_in_csv(path: self.path, list_items: self.tasks_todo)
		tasks_todo.last.descrip
	end

	def delete_task(task_num)
		if task_num > 0 && task_num <= self.tasks_todo.length
			self.tasks_todo.delete_at(task_num - 1)
		end
		update_tasks_in_csv(path: self.path, list_items: self.tasks_todo)
		tasks_todo.last.descrip
	end

	def complete_task(task_num)
		if task_num > 0 && task_num <= self.tasks_todo.length
			self.tasks_todo[task_num - 1].complete_task
		end
		tasks_todo.last.descrip
	end

	def tasks_todo
		if @tasks_todo
			return @tasks_todo
		else
			@tasks_todo = generate_task_from_csv(self.path)
		end
	end

end