#### odcinek.github.com jekyll source

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
