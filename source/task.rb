class Task
attr_reader :item, :status, :number

def initialize(args={})
  @item = args.fetch(:item, nil)
  @status = args.fetch(:status, nil)
  @number = args.fetch(:number, nil)
end

def to_s
  "Number:#{@number} Task: #{@item}, Status: #{@status}"
end

def update_task
  @status = "Completed"
end

end
