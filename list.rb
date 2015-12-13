require_relative 'task'
require_relative 'todo_parser'
class List
attr_reader :file, :to_dos, :each_task, :list

  def initialize
    @to_dos = [] 
    add_file_to_list
  end

  def add_file_to_list
    TodoParser.new.to_dos_info.each {|t| self.to_dos << Task.new(t)}
  end

  def delete(donetask)
    self.to_dos.delete_if { |task| task.to_do == donetask }
    save
  end

   def add(args = {})
    self.to_dos << Task.new(args)
    save
   end

   def done(done_task)
      self.to_dos.each do |task|
        if task.to_do == done_task
          task.complete
        end
      end
      save
   end

   def delete_first_task
    self.to_dos.shift
    save
   end

  def save
    CSV.open("source/todo.csv", "wb") do |csv|
      self.to_dos.each { |task| csv << [task.to_do]}
    end
  end

   def to_s
    "Your list for the day is: \n"+ self.to_dos.map {|task| " #{task.check} #{task.to_do} #{task.date_added} \n" }.join("")
   end
end

