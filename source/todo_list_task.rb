class TodoListTask
	attr_accessor :is_complete

	def initialize(args)
		@task_descrip = args.fetch(:descrip, '')
		@is_complete = false
	end

	def is_complete?
		self.is_complete
	end

end