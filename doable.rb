module Doable
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
          task.completed
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
      self.to_dos.each do |task|
        csv << [task.to_do]
      end
    end
   end
end
