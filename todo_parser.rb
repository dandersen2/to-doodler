require 'csv'
require 'pry'
class TodoParser
attr_reader :file, :to_dos, :each_task

  def initialize(file)
    @file = file
    @to_dos = []
  end

  def add_list
    csv_file = CSV.read(@file)
     csv_file.each do |row |
      row.each do
       |row|
       @each_task = {}
       @each_task[:to_do] = row
       self.to_dos << @each_task
      end
    end
   end

   def makelist
    todos[] << Task.new
   end


end

