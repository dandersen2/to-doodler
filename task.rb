class Task
  attr_reader :to_do, :date_added
  attr_accessor :completed

  RANDOM_EVIL = ["steal lunch", "give a tourist wrong directions", "evil laugh", "kill kittens"]

  def initialize(args = {})
    @to_do = args[:to_do] || RANDOM_EVIL.sample
    @completed = false
    @date_added = Time.now
  end

  def complete
    self.completed = true
  end

  def check
    completed ? "[X]" : "[ ]"
  end
end

