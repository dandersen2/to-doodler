
require 'csv'
# require 'date'

class ListParser
  attr_reader  :tasks, :file

  def initialize(file = nil)
    @file = file
    @tasks = tasks
  end

  def add_task
    if @tasks
      return @tasks
  end



  def parse
    CSV.foreach(self.file) do |row|
      p row
    end
  end

#   def print_list
#     p list_array
#   end
 end

 sample_list = ListParser.new("todo.csv")
 sample_list.parse


