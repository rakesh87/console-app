require 'prawn'

class ExportFile
  attr_reader :alien
  attr_accessor :export_file_name

  def initialize(alien)
    @alien = alien
  end

  def pdf
    Prawn::Document.generate(generate_export_file_name("pdf")) do |pdf|
      alien.each do |key, value|
        pdf.text "#{key} : #{value} \n"
      end
    end
  end

  def text
    File.open(generate_export_file_name("text"), "a+") do |f|
      alien.each do |key, value|
        f << "#{key} : #{value} \n"
      end
    end
  end

  def generate_export_file_name(file_type)
    create_directory
    @export_file_name = "data/#{alien[:code_name]}_#{Time.now.to_s}.#{file_type}"
  end

  def create_directory
    Dir.mkdir("data") unless Dir.exist? "data"
  end

  # def foobar

  # end

# example of alien object {:code_name=>"rimjhim", :blood_color=>"r", :no_of_antennas=>"3", :no_of_legs=>"6", :home_town=> "zoooma"}
end
