echo -n 'commit: ' >> _data/meta.yaml
echo $GITHUB_SHA >> _data/meta.yaml
echo -n 'buildtime: "' >> _data/meta.yaml
echo -n `date --rfc-3339="seconds"` >> _data/meta.yaml
echo '"' >> _data/meta.yaml

JEKYLL_ENV=production bundle exec jekyll build -d public
node _bin/pdf.js
node _bin/pdf-largeprint.js

apt-get update && apt-get install pandoc librsvg
pandoc -f html -t docx -o print/ceremonies.docx print/index.html
