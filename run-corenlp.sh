CORENLP_DIRECTORY='stanford-corenlp-4.5.8'
if [ ! -d "$CORENLP_DIRECTORY" ]; then
  echo "$CORENLP_DIRECTORY does not exist. Downloading."
  unzip stanford-corenlp-4.5.8.zip
fi

cd "$CORENLP_DIRECTORY"

for file in `find . -name "*.jar"`; do export CLASSPATH="$CLASSPATH:`realpath $file`"; done

echo 'Running corenlp parser on input file.'

java -mx3g edu.stanford.nlp.pipeline.StanfordCoreNLP -outputFormat xml -file '../input.txt' -annotators tokenize,pos,parse -ssplit.eolonly
cp 'input.txt.xml' '../corenlp-output.txt'
