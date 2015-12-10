module CsvReadable

	def update_tasks_in_csv(args)
		path = args.fetch(:path, '')
		list_items = args.fetch(:list_items, [])
		CSV.open(path, 'w') do |csv|
			list_items.each do |item|
				csv << [item.descrip]
			end
		end
	end

	def generate_task_from_csv(path)
		list_items = []
		line_num = 0
		CSV.foreach(path) do |task|
			line_num += 1
			list_items << TodoListTask.new(descrip: task.join, num: line_num)
		end
		list_items
	end

end