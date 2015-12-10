class Task
attr_reader :item, :status

def initialize(args={})
  @item = args.fetch(:item, nil)
  @status = args.fetch(:status, nil)
end

end
