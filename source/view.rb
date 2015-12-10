# I AM JACK's EYES. I ALLOW HIM TO SEE. WITHOUT THE OTHER PARTS I DO NOT WORK.

class Viewer
  def display(output)
    puts output
  end

  def get_input
    ARGV[0]
  end

  def display_welcome_message
    display("Hello, Dan. What do you need to get done today?")
  end
end
