require 'csv'
require 'pry'
require_relative 'task'
require_relative 'view'

module CsvParser

  def csv_parse(file)
    # The "$." here in task_id is for grabbing the row number from a csv within the iterator
    # http://stackoverflow.com/questions/12407035/ruby-csv-get-current-line-row-number
    CSV.foreach(file).map do |row|
      Task.new( {content: row[0], task_id: $.})
    end

    # tasks = [] # ?I know theres a better way to do this than a temporary variable like this, what is it?
    # CSV.foreach(file) do |row|
    #   tasks << Task.new({content: row[0], task_id: $., completed: false})
    #   # ?is setting completed to false redundant because it is initialized as false within the Task class?
    # end
    # tasks
  end

  def csv_write(file)
    new_lines = []
    CSV.open(file, "wb") do |csv|
      self.view.printable_list.each do |task_array|
        csv << task_array
      end
      # csv << self.view.printable_list
    # self.view.printable_list.each do |task_array|
    #   CSV.open(file, "wb") do |csv|
    #     csv << task_array
    end
      # new_lines << self.view.printable_list.join("\n")
      # csv << new_lines
      # self.view.printable_list.each do |todo_string|
      #   csv << todo_string


      # new_lines << self.view.printable_list.join("\n")
      #   csv << new_lines
    #?this function works and re-writes the 'updated_todo.csv' file with every action ('add', 'delete', 'completed', 'list') but clears all the entries when you type 'exit' to quit the app. I'm not sure why, but I realize the run_interface method has gotten very heavy and that's where the problem lies, I think.?
    # end
  end

end
