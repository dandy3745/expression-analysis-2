##
#conda activate trinity

matrix=osbcat2.isoform.counts.matrix

## correlation plot
#PtR \
#	--matrix $matrix \
#	--min_rowSums 10 \
#	--samples samples.txt \
#	--log2 \
#	--CPM \
#	--sample_cor_matrix

## PCA plot
PtR \
	--matrix $matrix \
	--min_rowSums 10 \
	--samples samples.txt \
	--log2 \
	--CPM \
	--center_rows \
	--prin_comp 3
