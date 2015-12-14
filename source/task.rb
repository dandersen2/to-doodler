class Task
attr_reader :content, :task_id
attr_accessor :completed

  def initialize(args)
    @task_id = args.fetch(:task_id, 0)
    @completed = args.fetch(:completed, false)
    @content = args.fetch(:content, "")
  end

  def completed?
    @completed
  end

  # def completed?
  #   if @completed
  #     "[X]"
  #   else
  #     "[ ]"
  #   end
  # end

end
