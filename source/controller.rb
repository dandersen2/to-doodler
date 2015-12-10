class View
  attr_reader :function_call

  def initialize(function_call)
    @function_call = function_call
  end

  def display(output)
    puts output
  end
end


class Controller

  def initialize(args_array)
    @view = View.new(args_array)
    @list = List.new
    get_function(args_array)
  end

  def get_function(args_array)
    case args_array[0].downcase
    when "list"
      @view.display(@list.to_s)
    when "add"
      @list.add(args_array[1])
      @view.display("Appended \"#{args_array[1]}\" to your TODO list...")
    when "delete"
     @list.delete(args_array[1].to_i)
     @view.display("Deleted \"#{args_array[1]}\" to your TODO list...")
   when "complete"
     @list.complete(args_array[1].to_i)
   end
 end

end
