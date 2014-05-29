module JekyllGithubSample
  class ReferenceTag < CodeTag

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
end

Liquid::Template.register_tag('github_sample_ref', JekyllGithubSample::ReferenceTag)