require_relative 'task'

class List
attr_reader :file, :to_dos, :each_task

  def initialize
    @to_dos = []
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
    TaskCSVParser.save(self.to_dos)
   end

   def to_s
    "Your list for the day is: \n"+ self.to_dos.map {|task| " #{task.check} #{task.to_do} #{task.date_added} \n" }.join("")
   end
end
