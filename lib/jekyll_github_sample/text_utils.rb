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
  end
end