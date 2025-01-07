BUBS_DIRECTORY='bubs-parser'
if [ ! -d "$BUBS_DIRECTORY" ]; then
  echo "$BUBS_DIRECTORY does not exist. Downloading."
  wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/bubs-parser/bubs-parser-20131221.tgz
  tar zxvf bubs-parser-20131221.tgz
  chmod a+x bubs-parser/parse
fi

cd "$BUBS_DIRECTORY"

echo 'Running BUBS parser on input file.'

./parse -g eng.sm6.gr.gz -fom eng.sm6.fom.gz -beamModel eng.sm6.bcm.gz '../input.txt' | tail -n +3 | head -n -1 > '../bubs-output.txt'
