class Task
attr_reader :content, :task_id, :completed
attr_writer :completed

  def initialize(args)  # args is a hash {@content: "fkdnfsd",...}
    @completed = args.fetch(:completed, false)
    @task_id = args.fetch(:task_id, 0)
    @content = args.fetch(:content, "")
  end

  def completed?
    if @completed
      "[X]"
    else
      "[ ]"
    end
  end

end
