STANFORD_DIRECTORY='stanford-parser-full-2015-01-30'
if [ ! -d "$STANFORD_DIRECTORY" ]; then
  echo "$STANFORD_DIRECTORY does not exist. Downloading."
  wget http://nlp.stanford.edu/software/stanford-parser-full-2015-01-29.zip
  unzip stanford-parser-full-2015-01-29.zip
fi

echo 'Running stanford lexicalized parser on input file.'

java -mx600m -cp "$STANFORD_DIRECTORY/*:" edu.stanford.nlp.parser.lexparser.LexicalizedParser -outputFormat "penn" edu/stanford/nlp/models/lexparser/englishFactored.ser.gz input.txt | awk 'NF{printf "%s ", $0; next} {print ""}' | sed 's/ $//' > stanford-lexicalized-output.txt
