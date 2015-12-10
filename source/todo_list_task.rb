class TodoListTask
	attr_reader :num, :is_complete

	def initialize(args)
		@descrip = args.fetch(:descrip, '')
		@num = args.fetch(:num, 0)
		if @descrip.include?('[X]')
			@is_complete = false
		else
			@is_complete = true
		end
	end

	def descrip
		if self.is_complete?
			complete_tag = "X"
		else
			complete_tag = " "
		end
		"#{self.num}. [#{complete_tag}] #{@descrip}\n"
	end

	def is_complete?
		self.is_complete
	end

	def complete_task
		@is_complete = true
	end

end