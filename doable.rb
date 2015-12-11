module Doable
  def add_list #parserwe are not good friends yet CSV
    csv_file = CSV.read(@file)
     csv_file.each do |row |
      row.each do
       |row|
       @each_task = {}
       @each_task[:to_do] = row
       self.to_dos << Task.new(@each_task)
     end
    end
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
      self.to_dos.each do |task|
        csv << [task.to_do]
      end
    end
   end
   #i just started to play with this. I'm going to pass it a hash that will be created out the ARGV
   #every work of the ARGV will be a :to_do => 'drinkwine'
   def add_several_tasks #list_of_todos lives in my runner.rb
    list_of_todos.each do |hash|
       self.to_dos << Task.new(hash)
     end
   end
end
