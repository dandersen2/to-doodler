class User

  def initialize(args = {})
    @username = args.fetch(:username, "John Doe")
    @password = args.fetch(:password, "12345")
    # @list_id   ???
  end




end
