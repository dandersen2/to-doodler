class TerminalView

	def display_list(list)
		puts list
	end

	def show_delete_message(name)
		puts "You deleted #{name} from the TODO list."
	end

	def show_add_message(name)
		puts "You added #{name} to the TODO list."
	end

	def show_complete_message(name)
		puts "You completed the #{name} task on the TODO list."
	end

	def send_error_message
		puts "Please enter one of the following commands:\nlist\nadd\ndelete\ncomplete"
	end

	def get_input
		ARGV
	end

end