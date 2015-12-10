
require 'pry'
class Task
  attr_reader :complete, :name
  def initialize(name)
    @name = name
    @complete = false
  end
  def im_done
    @complete = true
  end
  def update(new_content)
    @name= new_content
  end
end
