require 'csv'


class Parser
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def parse_it
    CSV.read(@file)
  end


end


# TESTER CODE
x = Parser.new("todo.csv")
p x.parse_it

