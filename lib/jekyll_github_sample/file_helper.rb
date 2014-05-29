module JekyllGithubSample
  class FileHelper

    GITHUB_RAW_URI = 'https://raw.githubusercontent.com/'
    GITHUB_URI     = 'https://github.com/'
    WEB_URI_PART = 'blob'

    attr_reader :filename, :user, :project_name

    def initialize(path)
      @path = path
      parts = @path.split('/').delete_if { |e| e.empty? }
      if parts.include? WEB_URI_PART
        @user, @project_name, @blob, @commitish_or_branch = parts[0..3]
        @filename = File.join(parts[4..-1])
      else
        @user, @project_name, @commitish_or_branch = parts[0..2]
        @filename = File.join(parts[3..-1])
      end
    end

    def user_uri
      File.join(GITHUB_URI, @user)
    end

    def web_uri
      File.join(GITHUB_URI, @user, @project_name, WEB_URI_PART, @commitish_or_branch, @filename)
    end

    def raw_uri
      File.join(GITHUB_RAW_URI, @user, @project_name, @commitish_or_branch, @filename)
    end
  end
end