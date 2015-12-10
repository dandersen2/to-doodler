class TodoListTask
	attr_reader :num, :is_complete

	def initialize(args)
		@descrip = args.fetch(:descrip, '')
		@num = args.fetch(:num, 0)
		@is_complete = false
	end

	def descrip
		@descrip
	end

	def is_complete?
		self.is_complete
	end

	def complete_task
		@is_complete = true
	end

end