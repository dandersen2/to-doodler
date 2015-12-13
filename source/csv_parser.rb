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
    # printable_list = [["hello"], ["my"], ["name"], ["is"], ["Dan"]]
    # view.printable_list
    # puts prepry
    # binding.pry
    # puts postpry
    CSV.open(file, "wb") do |csv|
      # new_lines = self.view.printable_list.join("\n")
      # p new_lines
      #   csv << new_lines
      csv << self.view.printable_list # THIS WORKS!!!!!!

      # self.view.printable_list.each { |line|  csv << line }
      # view.printable_list.each do |line|
    end
  end

end
