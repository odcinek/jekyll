### odcinek.github.com jekyll source

As awesome as `github-pages` are, they do not support custom jekyll plugins. Here is a workaround - generate everything locally, and use git subrepo (_yuck.._) to push static bits to [odcinek/odcinek.github.com](https://github.com/odcinek/odcinek.github.com). Hey, it works.

#### Setup
```bash
git clone --recursive git@github.com:odcinek/jekyll.git
cd jekyll/
bundle install --path=.bundle --clean --binstubs=./sbin
```

#### Pushing words
```bash
bundle exec jekyll build
git commit -m"Fixed typoe"
git add . && git push # pushing raw jekyll source
cd _site/
git add . && git commit -m"Fixed typoe"
git push # pushing statically generated content
```
