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



   def to_s
    "Your list for the day is: \n"+ self.to_dos.map {|task| " #{task.check} #{task.to_do} #{task.date_added} \n" }.join("")

   end

end
list = List.new('source/todo.csv')
list.add_list
list.done("evil laugh")
binding.pry
p list









