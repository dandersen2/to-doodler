require 'csv'
require 'pry'
require_relative 'task'
require_relative 'view'

module CsvParser

  def csv_parse(file)
    tasks = [] # ?I know theres a better way to do this than a temporary variable like this, what is it?
    CSV.foreach(file) do |row|
      tasks << Task.new({content: row[0], task_id: $., completed: false})
      # ?is setting completed to false redundant because it is initialized as false within the Task class?
    end
    tasks
  end

  def csv_write(file)
    new_lines = []
    CSV.open(file, "wb") do |csv|
      new_lines << self.view.printable_list.join("\n")
        csv << new_lines
    #?this function works and re-writes the 'updated_todo.csv' file with every action ('add', 'delete', 'completed', 'list') but clears all the entries when you type 'exit' to quit the app. I'm not sure why, but I realize the run_interface method has gotten very heavy and that's where the problem lies, I think.?
    end
  end

end
