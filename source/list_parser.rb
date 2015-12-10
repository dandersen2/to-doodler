require 'csv'
require 'pry'
require_relative 'list'
require_relative 'task'


class ListParser
attr_reader :csv_file

  def initialize (csv_file)
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
  read_csv.map{|row| Task.new(row.to_hash)}
end

end

to_do = ListParser.new("/Users/apprentice/Desktop/ruby-todos-1-0-core-features-challenge/source/todo.csv")
to_do.list_parser

