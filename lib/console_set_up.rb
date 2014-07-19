require_relative 'export_file'

class ConsoleSetUp
  attr_accessor :alien

  CONSOLE_INPUTS = {
    :code_name      => "code name",
    :blood_color    => "blood color",
    :no_of_antennas => "no of antennas",
    :no_of_legs     => "no of legs",
    :home_town      => "home town"
  }

  def initialize
    @alien = {}
  end

  def start_console_work
    puts "**************************************** \n \n"
    puts "press crtl z to exit \n \n"
    puts "Alien Details! \n please enter Alien details \n \n"

    CONSOLE_INPUTS.each do |key, value|
      puts "#{value} :"
      @alien[key] = get_action
      puts
    end

    export
  end

  def export
    puts "how you wanna export deatils, please enter the file type PDF/Text :"
    export_file_format = get_action and
    puts

    until ["pdf", "text"].include? export_file_format.downcase do
      puts "please give a valid export file type as PDF/Text :"
      export_file_format = gets.chomp
    end

    export_file = ExportFile.new(alien)
    export_file.public_send(export_file_format.downcase.to_sym)
    puts "\n your file is saved as #{export_file.export_file_name} \n"
  end

  def launch
    loop do
      ConsoleSetUp.new.start_console_work
      puts "\n \n"
    end
  end

  private

  def get_action
    gets.chomp
  end
end

# START APP

ConsoleSetUp.new.launch




