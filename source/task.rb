class Task
attr_reader :item, :status

def initialize(args={})
  @item = args.fetch(:item)
  @status = args.fetch(:status)
end

end
