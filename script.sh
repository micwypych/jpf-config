#!/bin/bash
set -e

mkdir jpf
cd jpf

wget https://github.com/micwypych/jpf-artifacts/raw/master/jpf/jpf-core-r32.zip
wget https://github.com/micwypych/jpf-artifacts/raw/master/jpf/jpf-core-r32-src.zip
unzip ./jpf-core-r32.zip
echo 'An' | unzip ./jpf-core-r32-src.zip

SITE_PROPERTIES=./site.properties

echo '# JPF site configuration' > ${SITE_PROPERTIES}
echo -e '\n\n#JPF CORE' >> ${SITE_PROPERTIES}
echo "jpf-core = ${PWD}/jpf-core" >> ${SITE_PROPERTIES}

echo -e '\n\n' >> ${SITE_PROPERTIES}
echo 'extensions=${jpf-core}' >> ${SITE_PROPERTIES}

mkdir ~/.jpf
touch ~/.jpf/site.properties
echo "jpf-core = ${PWD}/jpf-core" > ~/.jpf/site.properties
echo "extensions=\${jpf-core}" >> ~/.jpf/site.properties

./jpf-core/bin/jpf ./jpf-core/src/examples/DiningPhil.jpf
