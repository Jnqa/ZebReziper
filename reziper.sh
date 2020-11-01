sudo apt update && sudo apt-get install unzip -y zip;
unzip $1 -d rezip;
find . -name "*.debug" -exec rm {} \;
find . -name "*.sym" -exec mv {} *.so;
find . -name '*.sym' -exec sh -c 'mv "$0" "${0%.sym}.so"' {} \;
cd rezip &&  zip -9 -r $1 * && mv $1 ../$1 && rm -r ../rezip;
echo 'Reziped!'