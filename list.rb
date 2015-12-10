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











