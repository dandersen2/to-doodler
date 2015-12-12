require 'csv'
require_relative 'task'

module CsvParser

  def csv_parse(file)
    tasks = [] # I know theres a better way to do this than a temporary variable like this, what is it?
    # counter = 1
    CSV.foreach(file) do |row|
      tasks << Task.new({content: row[0], task_id: $.})
      # p row
      # tasks << Task.new({content: row[0],task_id: counter})
      # counter += 1
    end

    tasks
  end


end
