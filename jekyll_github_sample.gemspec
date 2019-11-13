# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'jekyll_github_sample/version'

Gem::Specification.new do |s|
  s.name        = 'jekyll_github_sample'
  s.version     = JekyllGithubSample::VERSION
  s.license     = 'MIT'
  s.authors     = ['Ben Willis']
  s.email       = ['benjamin.willis@gmail.com']
  s.homepage    = 'https://github.com/bwillis/jekyll-github-sample'
  s.summary     = %q{Include a sample of a Github repo file.}
  s.description = %q{Easily reference and include a Github repo file in your post.}

  s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = `git ls-files -- {spec}/*`.split('\n')
  s.require_paths = ['lib']

  s.add_dependency 'activesupport', '>= 4.0', '< 7.0'
  s.add_dependency 'jekyll',        '>= 3.0', '< 5.0'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'

end
