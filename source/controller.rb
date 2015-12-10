require_relative "list"
require_relative "task"
require_relative "view"

class Controller

  def initialize
    @view = View.new
    @list = List.new
    run_interface
  end

  def run_interface

  end

end
