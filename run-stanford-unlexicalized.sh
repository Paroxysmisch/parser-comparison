STANFORD_DIRECTORY='stanford-parser-full-2015-01-30'
if [ ! -d "$STANFORD_DIRECTORY" ]; then
  echo "$STANFORD_DIRECTORY does not exist. Downloading."
  wget http://nlp.stanford.edu/software/stanford-parser-full-2015-01-29.zip
  unzip stanford-parser-full-2015-01-29.zip
fi

echo 'Running stanford unlexicalized parser on input file.'

java -mx150m -cp "$STANFORD_DIRECTORY/*:" edu.stanford.nlp.parser.lexparser.LexicalizedParser -outputFormat "penn" edu/stanford/nlp/models/lexparser/englishPCFG.ser.gz input.txt | awk 'NF{printf "%s ", $0; next} {print ""}' | sed 's/ $//' > stanford-unlexicalized-output.txt
