require_relative 'todo_list.rb'
require_relative 'terminal_view.rb'

class Controller

	def initialize
		@terminal = TerminalView.new
		parse_input
	end

	def parse_input
		binding.pry
		user_input = @terminal.get_input
		todo_list_args = {command: user_input.shift, params: user_input}
	end

end