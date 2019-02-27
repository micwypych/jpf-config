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


wget https://github.com/micwypych/jpf-artifacts/raw/master/jpf/jpf-ltl.zip
unzip ./jpf-ltl.zip
mv ./michelelombardi-jpf-ltl-08e687c362de ./jpf-ltl
chmod u+x ./jpf-ltl/bin/jpf

echo -e '\n\n#JPF LTL EXTENSION' >> ${SITE_PROPERTIES}
echo "jpf-ltl = ${PWD}/jpf-ltl" >> ${SITE_PROPERTIES}

wget https://github.com/micwypych/jpf-artifacts/raw/master/jpf/jpf-aprop-r58.zip
wget https://github.com/micwypych/jpf-artifacts/raw/master/jpf/jpf-aprop-r58-src.zip
unzip ./jpf-aprop-r58.zip
echo 'An' | unzip ./jpf-aprop-r58-src.zip

echo -e '\n\n#JPF JAVA ANNOTAION EXTENSION' >> ${SITE_PROPERTIES}
echo "jpf-aprop = ${PWD}/jpf-aprop" >> ${SITE_PROPERTIES}

echo -e '\n\n'
echo 'extensions=${jpf-core},${jpf-ltl},${jpf-aprop}' >> ${SITE_PROPERTIES}

./jpf-core/bin/jpf ./jpf-core/src/examples/DiningPhil.jpf

