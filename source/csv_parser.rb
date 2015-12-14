require 'csv'
require 'pry'
require_relative 'task'
require_relative 'view'

module CsvParser

  def csv_parse(file)
    CSV.foreach(file).map do |row|
      Task.new( {content: row[0], task_id: $.})
    end
  end
# The "$." here in task_id gets the row number from a csv
# http://stackoverflow.com/questions/12407035/ruby-csv-get-current-line-row-number
#  CSV: number, completed, content (using headers)
#         1,false, buy bananas
#         2, true, walk sparky
#         etc...
# Use the headers: true when reading/writing to get multiple attributes in CSV

  def csv_write(file)
    new_lines = []
    CSV.open(file, "wb") do |csv|
      self.view.printable_list.each do |task_array|
        csv << task_array
      end
    end
  end
end
