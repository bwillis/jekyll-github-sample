jekyll-github-sample
====================

Two Jekyll Liquid tags to display a code sample from a file in a public Github repo and provide a reference to it.

# Install

- First add the gem to your `Gemfile`
```
gem 'jekyll_github_sample'
```
- `bundle` to install the gem
- Add the gem to your Jekyll `_config.yml`

```
gems: [jekyll_github_sample]
```
- Startup or relaunch Jekyll

# Live Examples

A [write up](https://bwillis.github.io/2014/05/28/include-github-repo-code-in-jekyll/) on my Jekyll blog including samples referencing this repo's code, meta.

# github_sample Usage
```
{% github_sample URL_WITH_USERNAME_REPO_AND_FILE <START_LINE_NUMBER> <END_LINE_NUMBER> %}
```

 * URL_WITH_USERNAME_REPO_AND_FILE - the relative path to the Github repo file, prefer a file with the commitish in it so it won't change when recompiling occurs. A url to this README would be: `bwillis/jekyll-github-sample/blob/a3bc9e82412d364aa76e9308ab53ff2bddaa2faf/README.md`
 * START_LINE_NUMBER - (optional) number that is the first line to include (0 based)
 * END_LINE_NUMBER - (optional) number that is the last line to include, if excluded will read to end of file

One can also specify the lines to include based on markings in the file itself.
This is done by invoking

```
{% github_sample URL_WITH_USERNAME_REPO_AND_FILE tag:TAG_NAME %}
```

and placing the strings `[START TAG_NAME]` and `[END TAG_NAME]` anywhere in the lines immediately before and after the content you wish to include.


# github_sample_ref Usage
```
{% github_sample_ref URL_WITH_USERNAME_REPO_AND_FILE %}
```

 * URL_WITH_USERNAME_REPO_AND_FILE - the relative path to the Github repo file, prefer a file with the commitish in it so it won't change when recompiling occurs. A url to this README would be: `bwillis/jekyll-github-sample/blob/a3bc9e82412d364aa76e9308ab53ff2bddaa2faf/README.md`

# Example Usage

This is how you would display, reference and highlight code in your Jekyll post.

```
{% github_sample_ref /bwillis/versioncake/989237901cb873f96df12be48cbf1239be496bd7/Appraisals %}
{% highlight ruby %}
{% github_sample /bwillis/versioncake/989237901cb873f96df12be48cbf1239be496bd7/Appraisals 0 5 %}
{% endhighlight %}
```

# Thanks!

Thanks to all those who have helped make this really awesome:

* [heedfull](https://github.com/heedfull)
* [robertwb](https://github.com/robertwb)

# License
Jekyll Github Sample is released under the MIT license: www.opensource.org/licenses/MIT
