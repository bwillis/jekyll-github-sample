jekyll-github-sample
====================

Add a code sample from a file in a public Github repo.

# Install

Add the github_sample_tag.rb file to your Jekyll project _plugins directory.

# Example

A [write up](https://bwillis.github.io/TBD) on my Jekyll blog including samples referencing this repo's code, meta.

# Usage

github_sample URL_WITH_USERNAME_AND_REPO <START_LINE_NUMBER> <END_LINE_NUMBER>

 * URL_WITH_USERNAME_AND_REPO - the full path to the Github repo file, prefer a file with the commitish in it so it won't change when recompiling occurs
 * START_LINE_NUMBER - (optional) number that is the first line to include (0 based)
 * END_LINE_NUMBER - (optional) number that is the last line, if excluded will read to end of file

```
{% github_sample /bwillis/versioncake/989237901cb873f96df12be48cbf1239be496bd7/Appraisals 0 5 %}
```

And you probably want to highlight your code, so you can wrap it a Jekyll highlight block like so:

```
{% highlight ruby %}
{% github_sample /bwillis/versioncake/989237901cb873f96df12be48cbf1239be496bd7/Appraisals 0 5 %}
{% endhighlight %}
```
