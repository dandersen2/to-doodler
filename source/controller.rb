require_relative 'List'

class View

  def display(output)
    puts output
  end

end




class Controller

  def initialize(args)
    @view = View.new
    @list = List.new
    execute_function( args[:option], args[:task] )
  end

  def execute_function(option, task)
    case option
    when "list"
      @view.display(@list.to_s)
      @list.write_to_file
    when "add"
      @list.add(task)
      @view.display("Appended \"#{task}\" to your TODO list...")
      @list.write_to_file
    when "delete"
      deleted_task = @list.list[task.to_i - 1].task
      @list.delete(task.to_i)
      @view.display("Deleted \"#{deleted_task}\" from your TODO list...")
      @list.write_to_file
    when "complete"
      completed_task = @list.list[task.to_i - 1].task
      @list.complete(task.to_i)
      @view.display("Completed \"#{completed_task}\" from your TODO list...")
      @list.write_to_file
    end
  end

end

