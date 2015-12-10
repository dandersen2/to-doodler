class Task
attr_reader :item, :status

def initialize(args={})
  @item = args.fetch(:item, nil)
  @status = args.fetch(:status, nil)
  @number = args.fetch(:number, nil)
end

def to_s
  "Number:#{@number} Task: #{@item}, Status: #{@status}"
end

end
