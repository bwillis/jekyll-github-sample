require 'cgi'
require 'open-uri'
require 'active_support'

module AStudyInCode
  module Liquid

    class GithubSampleTag < ::Liquid::Tag

      INDEN_REGEX = /^\s+/

      def initialize(tag_name, params, tokens)
        github_file_path, @line_start, @line_end = params.split
        @github_file = GithubFileUri.new(github_file_path)
        @line_start, @line_end = determine_line_numbers(@line_start, @line_end)
        super
      end

      def render(context)
        all_lines = cache.fetch(@github_file.raw_uri) do
          open(@github_file.raw_uri).readlines
        end
        lines = all_lines[@line_start..@line_end]
        lines = remove_common_indentation(lines)
        lines.join
      end

      private

      def cache
        @@cache ||= ActiveSupport::Cache::MemoryStore.new
      end

      def determine_line_numbers(first, last)
        if first.nil? && last.nil?
          first = 0
          last = -1
        elsif last.nil?
          last = first
        end

        [first.to_i, last.to_i]
      end

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

    class GithubReferenceTag < GithubSampleTag

      def render(context)
        <<MARKUP.strip
<div class="github-sample-reference">
  <div class="author-info">
    <a href="#{@github_file.web_uri}">This Github Sample</a> is by <a href="#{@github_file.user_uri}">#{@github_file.user}</a>
  </div>
  <div class="meta-info">
    #{@github_file.filename} <a href="#{@github_file.web_uri}">view</a> <a href="#{@github_file.raw_uri}">raw</a>
  </div>
</div>
MARKUP
      end
    end

    class GithubFileUri
      GITHUB_RAW_URI = 'https://raw.githubusercontent.com/'
      GITHUB_URI = 'https://github.com/'

      attr_reader :filename, :user, :project_name

      def initialize(path)
        @path = path
        parts = @path.split('/').delete_if { |e| e.empty? }
        if parts.length == 5
          @user, @project_name, @blob, @commitish_or_branch, @filename = parts
        elsif parts.length == 4
          @user, @project_name, @commitish_or_branch, @filename = parts
        else
          raise 'Invalid or not understood Github url.'
        end
      end

      def user_uri
        File.join(GITHUB_URI, @user)
      end

      def web_uri
        File.join(GITHUB_URI, @user, @project_name, 'blob', @commitish_or_branch, @filename)
      end

      def raw_uri
        File.join(GITHUB_RAW_URI, @user, @project_name, @commitish_or_branch, @filename)
      end
    end
  end
end

Liquid::Template.register_tag('github_sample',     AStudyInCode::Liquid::GithubSampleTag)
Liquid::Template.register_tag('github_sample_ref', AStudyInCode::Liquid::GithubReferenceTag)