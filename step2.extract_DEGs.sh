   dir=DESeq2.229882.dir
matrix=osbcat2.isoform.TPM.not_cross_norm

cd $dir

analyze_diff_expr.pl \
	--matrix ../$matrix \
	-P 0.05 \
	-C 1 \
	--max_genes_clust 18000
