require 'csv'
require 'pry'
require_relative 'list'
require_relative 'task'


class ListParser
attr_reader :csv_file

  def initialize(csv_file)
    @csv_file = csv_file
  end

def list
  if @list
    return @list
  else
    @list = list_parser
  end
end

# private

def list_parser
  read_csv = CSV.read(@csv_file,:headers=>true, :header_converters=>:symbol)
  # binding.pry
  read_csv.map{|row| Task.new(row.to_hash)}
  # binding.pry
end

end



p tasks = ListParser.new("/Users/apprentice/Desktop/ruby-todos-1-0-core-features-challenge/source/todo.csv")
p tasks.list_parser
