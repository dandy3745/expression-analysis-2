##
#conda activate trinity

matrix=osbcat2.isoform.counts.matrix

run_DE_analysis.pl \
	--matrix $matrix \
	--method DESeq2 \
	--samples_file samples.txt
