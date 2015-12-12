require 'csv'
require_relative 'task'

module CsvParser

  def csv_parse(file)
    tasks = [] # I know theres a better way to do this than a temporary variable like this, what is it?
    CSV.foreach(file) do |row|
      tasks << Task.new({content: row[0], task_id: $., completed: false})
      # is setting completed to false redundant because it is initialized as false within the Task class?
    end
    tasks
  end

end
