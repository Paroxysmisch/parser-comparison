BUBS_DIRECTORY='bubs-parser'
if [ ! -d "$BUBS_DIRECTORY" ]; then
  echo "$BUBS_DIRECTORY does not exist. Downloading."
  wget https://www.dropbox.com/s/bppl5o7jwqsu8yt/bubs-parser-20150206.tgz?dl=0
  mv 'bubs-parser-20150206.tgz?dl=0' bubs-parser-20150206.tgz
  tar zxvf bubs-parser-20150206.tgz
  chmod a+x bubs-parser/parse
  unzip stanford-corenlp-4.5.8.zip
fi

cd "$BUBS_DIRECTORY"

echo 'Running BUBS parser on input file.'

./parse -g wsj_l0mm_16_.55_6.gr.gz -fom wsj_l0mm_16_.55_6.lexfom.gz -ccClassifier wsj_cc.mdl.995 '../input.txt' | tail -n +3 | head -n -1 > '../bubs-output.txt'
