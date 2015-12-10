
module ListParser
  attr_reader :file

  def build_list
    if @list
      return @list
    else
      @list = parse_tasks_from_file
    end
  end

  private
  def parse_tasks_from_file
    list_array = []
    CSV.foreach('todo.csv') do |tasks|
      list_array << Task.new(tasks.join)
    end
    list_array
  end
end

