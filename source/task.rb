class Task
  attr_accessor :string_task, :fillblank
  attr_writer :completed

  def initialize(string_task)
    @string_task = string_task
    @completed = false
  end

  def completed?
    @completed
  end

  def fillblank
    if @completed == true
      'X'
    else
      ' '
    end
  end

end
