require 'csv'
require_relative 'task'
require_relative 'list'
require 'pry'
class Controller

  attr_reader :list, :to_dos
  def initialize
    @list = List.new('source/todo.csv')
    @list.add_list
  end
  def to_s
    #I will write a reader but atking in to account that my list
    is now to_do_list that is type of controller(Belogs to that class)
    to print it it will be something like this
    puts todo_list.list
    similar to the method I have on the class List
  end
end
todo_list = Controller.new
# list.add({to_do: "Eat Sandwhich"})

p Controller

somewhere over here I will do
to_do_list.list(add) it might even be on a method inside my controller
after I add the viewer part
I will grab my to dos to add with an ARGV thing that will give me an array of strings
that array of string I will have to modify with the same format I used for the csv
to ["","",""] becomes an array of hashes with every staring having a key of :to_do so I can feed it in to my method
