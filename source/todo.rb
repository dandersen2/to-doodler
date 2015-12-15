require 'csv'


class ToDo
	attr_accessor :file, :list
	def initialize(file)
		@file = file
		@list = []
	end

	def parse_list
		CSV.foreach(@file) do |task_item|
			@list << task_item.join
		end
	end

	def print_list
		@list.each_with_index do |task, index|
			puts (index+1).to_s + ' ' + task
		end
	end

	def add_task(input)
		@list << input
		save_task(input)
	end

	def save_task(input)
		CSV.open(@file, "a") do |csv|
			csv << input.split(' ')
		end
		print_list
	end
	
end



