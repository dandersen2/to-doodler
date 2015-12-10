# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).
require 'csv'
require 'byebug'
require_relative 'ListParser'
require_relative 'List'
require_relative 'controller'
require_relative 'PrinttoCSV'

include ListParser
include PrinttoCSV

option = ARGV[0]
task = ARGV[1..-1].join(" ")


Controller.new( {option: option, task: task } )



