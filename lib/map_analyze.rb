class PrintMap
    def initialize(title,sections,document)
        @title = title
        @sections = sections
        @document = document
    end


    def fill_document(output_formatter)
        @document << output_formatter.print_header
        @document << output_formatter.print_title @title
        @sections.each do |section|
            @document << output_formatter.print_section section
            @document << output_formatter.print_section_details section 
        end
        @document
    end
end


class AnalyzeMap
    def initialize(export_file)
        @file = file
    end

    def analyze

    end

    def get_title
    end

    def get_sections
    end

end


f = File.open(ARGV[0])

a = AnalyzeMap.new(f)

