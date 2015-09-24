#### odcinek.github.com jekyll source

As awesome as `github-pages` are, they do not support custom jekyll plugins. This is a workaround - generate everything locally, and use git subrepo (/yuck../) to push to https://github.com/odcinek/odcinek.github.com. Hey, it works.

```
git clone --recursive git@github.com:odcinek/jekyll.git
cd jekyll/
bundle install --path=.bundle --clean --binstubs=./sbin
bundle exec jekyll build
git commit -m"Fixed typoe"
git push # pushing source
cd _site/
git commit -m"Fixed typoe"
git push # pushing static
```
