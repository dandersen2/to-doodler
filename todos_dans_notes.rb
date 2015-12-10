
User story:
$ ruby todo.rb add Bake a delicious blueberry-glazed cheesecake
$ ruby todo.rb list
$ ruby todo.rb delete <task_id>
$ ruby todo.rb complete <task_id>


Example ToDos:
Bake a delicious blueberry-glazed cheesecake
Go play miniature golf with Mike Tyson
Become a World-Class Developer


Responsibility                               Code World

Initialize an empty TODO list                list = List.new
Add a task to a TODO list                    list.add(Task.new("walk the dog"))
Get all the tasks on a TODO list             tasks = list.tasks
Delete a particular task from a TODO list    ???
Complete a particular task on a TODO list    ???
Parse the command-line arguments and take the appropriate action  ???
Parse the todo.csv file and wrap each entry in easier-to-manipulate Ruby objects  ???

HOW IT WORKS!:
______________________________________________________
$ ruby todo.rb list
1. Bake a delicious blueberry-glazed cheesecake
2. Write up that memo and fax it out
3. Conquer the world

$ ruby todo.rb delete 3
Deleted "Conquer the world" from your TODO list...

$ ruby todo.rb list
1. Bake a delicious blueberry-glazed cheesecake
2. Write up that memo and fax it out
_______________________________________________


Example functionality:
$ ruby todo.rb add Walk the dog
--> Appended "Walk the dog" to your TODO list...
$

$ ruby todo.rb(list)
--> Displays the whole todo list

use an ARGV as the argument to add todos to your list or create a new todo

$ ruby todo.rb(add_to_do) "Go to grocery store and buy apples after work"
--> should take the todo string as the ARGV, pass it into todo.rb, which creates a new todo object and passes it into the task_list.rb

ruby todo.rb.list
--> brings up the current list in the file


Debugging Notes:
_______________________________________________
Each line in the todo.csv is making an array of 13 todo objects
And to
