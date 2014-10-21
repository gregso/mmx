class PrintMap
    def initialize(title,sections,document)
        @title = title
        @sections = sections
        @document = document
    end


    def fill_document(output_formatter)
        @document << output_formatter.print_header
        @document << (output_formatter.print_title @title)
        @sections.each do |section|
          @document << (output_formatter.print_section section)
          @document << (output_formatter.print_section_details section)
        end
        @document
    end
end


class AnalyzeMap
    attr_reader :lines

    def initialize(input_file)
        @file = input_file
    end

    def read_lines
      @lines = Array.new
      File.readlines(@file).each do |line|
        lines << line if line_not_empty(line)
      end
    end


    def get_title
      @lines[0] if (not @lines.nil?) and @lines[0].size >= 1
    end

    def get_sections(section_names)
      @lines.each do |line|
        section_names.each do |section_name|
          if line =~ /section_name/

            @sections[section_name] 
          end
        end
      end
    end

    private
    def line_not_empty(line)
      return line.size > 2
    end
end

section_names = ["INFORMATION","GOALS","REQUIREMENTS","SCHEDULE","ACTUAL PROGRESS","RISK"]

puts ARGV[0]

f = File.open(ARGV[0])

a = AnalyzeMap.new(f)
a.read_lines

puts a.lines


puts "Title: " + a.get_title

