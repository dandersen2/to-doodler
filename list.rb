require 'csv'
require_relative 'task'
require 'pry'

class List
attr_reader :file, :to_dos, :each_task

  def initialize(file)
    @file = file
    @to_dos = []
  end

  def add_list #parserwe are not good friends yet CSV
    csv_file = CSV.read(@file)
     csv_file.each do |row |
      row.each do
       |row|
       @each_task = {}
       @each_task[:to_do] = row
       self.to_dos << Task.new(@each_task)
     end
    end
   end

   def delete(task)
    self.to_dos.delete_if { |task| task.to_do == task }
    # self.to_dos.delete_if { |hash| hash[:to_do] == task }
   end

   def add(args = {})
    self.to_dos << Task.new(args)
   end

end

list = List.new('source/todo.csv')
list.add_list
binding.pry
p list

