require 'csv'

class TodoParser
attr_reader :file, :to_dos_info, :each_task

  def initialize
    @file = 'source/todo.csv'
    @to_dos_info = []
    add_list
  end

  def add_list #parserwe are not good friends yet CSV
    csv_file = CSV.read(self.file)
    csv_file.map {|row| self.to_dos_info << {:to_do => row[0]}}
  end

end





