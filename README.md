# Ruby Todos 1.0 Core Features 
 
##Learning Competencies 

* Create well-defined classes with a single responsibility
* Identify and implement classes based on real world requirements
* Implement clean and flexible interfaces between objects

##Summary 

 This is the first of several iterations towards building a single-user command-line TODO application.  Each iteration will involve adding new commands and features.

From the user's perspective, we want to build something that works like this:

```text
$ ruby todo.rb add Bake a delicious blueberry-glazed cheesecake
$ ruby todo.rb list
$ ruby todo.rb delete <task_id>
$ ruby todo.rb complete <task_id>
```

Your text file (an example is included in this repo) will be simple.  Just task descriptions each on their own line.  Keep in mind that you will eventually have more information included, this is why we want you to use the CSV format.

Example:  

```text  
Bake a delicious blueberry-glazed cheesecake  
Go play miniature golf with Mike Tyson  
Become a World-Class Developer  
```` 

##Releases

###Release 0 : Enumerate the responsibilities

Start by enumerating the responsibilities of your TODO application.  These aren't just the user-facing commands like "add", "delete", etc.  They're also back-end responsibilities like reading and writing from the `todo.csv` file, parsing command-line arguments, and printing the "interface" to the console.

Each responsibility should map to a concrete unit of Ruby code.  For example,

Responsibility                                                                     | Code World
-----------------------------------------------------------------------------------|------------------------------------
Initialize an empty TODO list                                                      | `list = List.new`
Add a task to a TODO list                                                          | `list.add(Task.new("walk the dog"))`
Get all the tasks on a TODO list                                                   | ` tasks = list.tasks`
Delete a particular task from a TODO list                                          | `???`
Complete a particular task on a TODO list                                          | `???`
Parse the command-line arguments and take the appropriate action                   | `???`
Parse the `todo.csv` file and wrap each entry in easier-to-manipulate Ruby objects | `???`


There are other responsibilities.  What are they?

###Release 1 : Translate to Code

Once you have a solid list of responsibilities you can start translating each into code.  Be sure to write comprehensive test code.

####Implement the list command

When you run

```text
$ ruby todo.rb list
```

your application should print out a list of all the TODOs. For example:

```text
$ ruby todo.rb list
1. Bake a delicious blueberry-glazed cheesecake
2. Write up that memo and fax it out
3. Conquer the world
```

You'll have to design and build basic controller and model code to make this work.  For example, how does your program know the user wants to "add" a task to their list?

#### Implement the add command

Requirements:

- A user can add (append) a task to their TODO list

It should work like this

```text
$ ruby todo.rb add Walk the dog
Appended "Walk the dog" to your TODO list...
$
```

#### Implement the delete command

Requirements:

- A user can delete a specific task from their TODO list

It should work like this

```text
$ ruby todo.rb list
1. Bake a delicious blueberry-glazed cheesecake
2. Write up that memo and fax it out
3. Conquer the world

$ ruby todo.rb delete 3
Deleted "Conquer the world" from your TODO list...

$ ruby todo.rb list
1. Bake a delicious blueberry-glazed cheesecake
2. Write up that memo and fax it out

$
```

#### Implement completeness

Requirements:

- A user can complete a specific task from their TODO list
- A completed TODO task will be identified as such when a user uses the `list` command

**Note**: This will require changing the format of `todo.csv` and the code that parses it.

###Release 2 : Human Readable File

Here's the deal:  Google just LOVES your new command line todo app.  And they're ready to buy you out for millions if only you can change the CSV file to a human readable file, so that it can be printed out easily.  They also want the app to be able to handle commas in the task description - something a CSV file doesn't accommodate very easily.

Here's the way the file should be saved:

```text
1. [ ]  Bake a delicious blueberry-glazed cheesecake
2. [X]  Write up that memo and fax it out
3. [ ]  Conquer the world
```

*(the brackets indicate whether the task has been completed or not)*

What factors do you need to take into account to save this data correctly?  How does this change the parsing (besides not being able to use the CSV class)?  

Update your app to accommodate this new feature!

##Optimize Your Learning 

Keep things like the [single responsibility principle](http://en.wikipedia.org/wiki/Single_responsibility_principle) and [separation of concerns](http://en.wikipedia.org/wiki/Separation_of_concerns) in mind as you decide what objects and classes belong in your application.

As you work through the iterations, pay close attention to how *change* impacts your application.  When a new feature is added how many files do you have to change?  How frustrating is it to make those changes?


##Resources
