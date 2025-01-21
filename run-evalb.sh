if [ ! -f "stanford-unlexicalized-output.txt" ] || [ ! -f "stanford-lexicalized-output.txt" ] || [ ! -f "bubs-output.txt" ]; then 
  echo "Run all the parsers first to generate output.";
fi

PRM_FILE=EVALB/sample/sample.prm
echo "Stanford U-PCFG:" > evalb-output.txt
./EVALB/bin/evalb -p EVALB/sample/sample.prm gold-fixed.txt stanford-unlexicalized-output.txt >> evalb-output.txt

echo $"\nStanford L-PCFG:" >> evalb-output.txt
./EVALB/bin/evalb -p $PRM_FILE gold-fixed.txt stanford-lexicalized-output.txt >> evalb-output.txt

echo $"\nBUBS:" >> evalb-output.txt
./EVALB/bin/evalb -p $PRM_FILE gold-fixed.txt bubs-output.txt >> evalb-output.txt
