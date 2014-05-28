require 'cgi'
require 'open-uri'
require 'active_support'

module AStudyInCode
  module Liquid
    class GithubSampleTag < ::Liquid::Tag

      GITHUB_RAW_URI = 'https://raw.githubusercontent.com/'

      def initialize(tag_name, params, tokens)
        @github_file_path, @line_start, @line_end = params.split
        @line_start, @line_end = determine_line_numbers(@line_start, @line_end)
        super
      end

      def render(context)
        uri = File.join(GITHUB_RAW_URI, @github_file_path)
        lines = cache.fetch(uri) do
          open(uri).readlines
        end
        lines[@line_start..@line_end].join
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
    end
  end
end

Liquid::Template.register_tag('github_sample', AStudyInCode::Liquid::GithubSampleTag)
