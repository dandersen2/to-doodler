class Task
  attr_reader :chore
  def initialize(chore)#have some input that we can grab from the csv or if no input given maybe default to argv?
    @chore = chore
  end

end
