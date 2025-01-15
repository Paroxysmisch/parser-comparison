if [ ! -f "stanford-unlexicalized-output.txt" ] || [ ! -f "stanford-lexicalized-output.txt" ] || [ ! -f "bubs-output.txt" ]; then 
  echo "Run all the parsers first to generate output.";
fi

python3 berkeley-parser-analyser/berkeley_parse_analyser/classify_english.py gold-fixed.txt stanford-unlexicalized-output.txt berkeley-parser-analyser-outputs/stanford-unlexicalized
python3 berkeley-parser-analyser/berkeley_parse_analyser/classify_english.py gold-fixed.txt stanford-lexicalized-output.txt berkeley-parser-analyser-outputs/stanford-lexicalized
python3 berkeley-parser-analyser/berkeley_parse_analyser/classify_english.py gold-fixed.txt bubs-output.txt berkeley-parser-analyser-outputs/bubs

