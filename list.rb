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

   def delete(donetask)
    self.to_dos.delete_if { |task| task.to_do == donetask }
    save
   end

   def add(args = {})
    self.to_dos << Task.new(args)
    save
   end

   def done(task)

   end
   def delete_first_task
    self.to_dos.shift
    save
   end

   def save
    CSV.open("source/todo.csv", "wb") do |csv|
      self.to_dos.each do |task|
        csv << [task.to_do]
      end
    end
   end

end

list = List.new('source/todo.csv')
list.add_list
list.delete("Move with Lil to the black mountain hills of Dakota")
binding.pry
p list

