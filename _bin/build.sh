echo -n 'commit: ' >> _data/meta.yaml
echo $GITHUB_SHA >> _data/meta.yaml
echo -n 'buildtime: "' >> _data/meta.yaml
echo -n `date --rfc-3339="seconds"` >> _data/meta.yaml
echo '"' >> _data/meta.yaml

bundle exec jekyll build
npm install
node _bin/pdf.js
node _bin/pdf-largeprint.js
