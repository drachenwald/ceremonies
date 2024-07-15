echo -n 'commit: ' >> _data/meta.yaml
echo $GITHUB_SHA >> _data/meta.yaml
echo -n 'buildtime: "' >> _data/meta.yaml
echo -n `date --rfc-3339="seconds"` >> _data/meta.yaml
echo '"' >> _data/meta.yaml

JEKYLL_ENV=production bundle exec jekyll build -d public
node _bin/pdf.js
node _bin/pdf-largeprint.js
