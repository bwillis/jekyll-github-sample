module JekyllGithubSample
  module TextUtils

    INDEN_REGEX = /^\s+/

    def remove_common_indentation(lines)
      leading_spaces = []
      lines.each do |line|
        next if line.length == 1
        if indentation_match = line.match(INDEN_REGEX)
          leading_spaces << indentation_match[0].length
        else
          leading_spaces << 0
        end
      end

      lines.collect do |line|
        line.length == 1 ? line : line[leading_spaces.min..-1]
      end
    end

    def extract_tagged_lines(lines, tag)
      start_tag = "[START #{tag}]"
      end_tag = "[END #{tag}]"
      tagged_lines = []
      in_tagged_content = false
      lines.each do |line|
        if in_tagged_content
          if line.include? end_tag
            in_tagged_content = false
          else
            tagged_lines << line
          end
        else
          in_tagged_content = line.include? start_tag
        end
      end
      tagged_lines
    end
  end
end