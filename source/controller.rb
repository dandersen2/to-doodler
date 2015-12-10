require_relative 'todo_list.rb'
require_relative 'terminal_view.rb'


class Controller
	attr_reader :rockys_list

	def initialize
		@rockys_list = TodoList.new(path: 'todo.csv')
		@terminal = TerminalView.new
		update_list(parse_input)
	end

	def parse_input
		user_input = @terminal.get_input
		todo_list_args = {command: user_input.shift, params: user_input.join(" ")}
	end

	def display_list
		@terminal.display_list(self.rockys_list)
	end

	def add_new_task(user_params)
		new_task_num = @rockys_list.tasks_todo.length + 1
		@rockys_list.add_new_task(descrip: user_params, num: new_task_num)
	end

	def delete_task(user_params)
		@rockys_list.delete_task(user_params.to_i)
	end

	def complete_task(user_params)
		@rockys_list.complete_task(user_params.to_i)
	end

	def send_error_message
		@terminal.send_error_message
	end

	def update_list(args)
		user_command = args.fetch(:command, 'list')
		user_params = args.fetch(:params, '')
		if user_command == 'list'
			self.display_list
		elsif user_command == 'add'
			self.add_new_task(user_params)
			task_descrip = ''
			@terminal.show_add_message(task_descrip)
		elsif user_command == 'delete'
			task_descrip = @rockys_list.tasks_todo[user_params.to_i - 1].descrip
			self.delete_task(user_params)
			@terminal.show_delete_message(task_descrip)
		elsif user_command == 'complete'
			task_descrip = @rockys_list.tasks_todo[user_params.to_i - 1].descrip
			self.complete_task(user_params)
			@terminal.show_complete_message(task_descrip)
		else
			self.send_error_message
		end
	end

end