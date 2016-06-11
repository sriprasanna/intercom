require "json"

class JsonFileParser
  def parse_line_by_line filepath
    objects = []
    File.open(filepath, "r").each_line do |line|
      objects << JSON.parse(line)
    end
    objects
  end
end
