require 'csv'
require_relative 'task'
require_relative 'doable'
require 'pry'

class List
  include Doable
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

   def to_s
    self.to_dos.each do |task|
      p task.to_do + " #{task.completed}"
    end
   end

end

list = List.new('source/todo.csv')
list.add_list

list.add({to_do: "Eat Sandwhich"})
# list.delete("Lose Lil to Danny")
list.add

#NEED THIS.. changes false to true on the status
list.done("Lose Lil to Danny")


puts list
binding.pry
# list.delete("Move with Lil to the black mountain hills of Dakota")
puts list









