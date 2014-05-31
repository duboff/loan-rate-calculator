require 'csv'

class CSVProcessor
  attr_accessor :path

  def input
    CSV.read(path, converters: :numeric)
  end

  def output
    input[1..-1]
  end
end
