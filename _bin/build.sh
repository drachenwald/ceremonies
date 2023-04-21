echo -n 'commit: ' >> _data/meta.yaml
echo $CF_PAGES_COMMIT_SHA >> _data/meta.yaml
echo -n 'buildtime: "' >> _data/meta.yaml
echo -n `date --rfc-3339="seconds"` >> _data/meta.yaml
echo '"' >> _data/meta.yaml

bundle exec jekyll build
node _bin/pdf.js
node _bin/pdf-largeprint.js
