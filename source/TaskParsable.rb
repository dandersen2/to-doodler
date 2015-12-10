
# module taskParsable
#  def self.parse_file_to_tasks(file)
#     # Convert CSV file to list of tasks by line
#       #For each line in file, make new task instance, add to @tasks as string
#     if self.task_file
#       CSV.foreach(file) do |row|
#         self.tasks << Task.new(row.join(' ')) # Use #join in case of in-line comma
#       end
#     end
#   end
# end
