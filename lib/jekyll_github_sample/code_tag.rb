require 'cgi'
require 'open-uri'
require 'active_support'
require 'liquid'

module JekyllGithubSample
  class CodeTag < ::Liquid::Tag

    include TextUtils

    def initialize(tag_name, params, tokens)
      github_file_path, @line_start, @line_end = params.split
      @github_file                             = FileHelper.new(github_file_path)
      super
    end

    def render(context)
      all_lines = cache.fetch(@github_file.raw_uri) do
        open(@github_file.raw_uri).readlines
      end
      if @line_start.respond_to?(:match) and tag_match = @line_start.match(/^tag:(.*)/)
        lines     = extract_tagged_lines(all_lines, tag_match[1])
      else
        @line_start, @line_end = determine_line_numbers(@line_start, @line_end)
        lines     = all_lines[@line_start..@line_end]
      end
      lines     = remove_common_indentation(lines)
      lines.join
    end

    private

    def cache
      @@cache ||= ActiveSupport::Cache::MemoryStore.new
    end

    def determine_line_numbers(first, last)
      if first.nil? && last.nil?
        first = 0
        last  = -1
      elsif last.nil?
        last = first
      end

      [first.to_i, last.to_i]
    end
  end
end

Liquid::Template.register_tag('github_sample', JekyllGithubSample::CodeTag)
