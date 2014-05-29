jekyll-github-sample
====================

Two Jekyll Liquid tags to display a code sample from a file in a public Github repo and provide a reference to it.

# Install

Add the github_sample_tag.rb file to your Jekyll project _plugins directory.

# Live Examples

A [write up](https://bwillis.github.io/2014/05/28/include-github-repo-code-in-jekyll/) on my Jekyll blog including samples referencing this repo's code, meta.

# github_sample Usage
```
github_sample URL_WITH_USERNAME_REPO_AND_FILE <START_LINE_NUMBER> <END_LINE_NUMBER>
```

 * URL_WITH_USERNAME_REPO_AND_FILE - the full path to the Github repo file, prefer a file with the commitish in it so it won't change when recompiling occurs
 * START_LINE_NUMBER - (optional) number that is the first line to include (0 based)
 * END_LINE_NUMBER - (optional) number that is the last line to include, if excluded will read to end of file

# github_reference Usage
```
{% github_sample_ref URL_WITH_USERNAME_REPO_AND_FILE %}
```

 * URL_WITH_USERNAME_REPO_AND_FILE - the full path to the Github repo file, prefer a file with the commitish in it so it won't change when recompiling occurs

# Example Usage

This is how you would display, reference and highlight code in your Jekyll post.

```
{% github_sample_ref /bwillis/versioncake/989237901cb873f96df12be48cbf1239be496bd7/Appraisals %}
{% highlight ruby %}
{% github_sample /bwillis/versioncake/989237901cb873f96df12be48cbf1239be496bd7/Appraisals 0 5 %}
{% endhighlight %}
```
