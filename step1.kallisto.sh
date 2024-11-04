## Building an index
#kallisto index -i osa1_r7.gene_models.repr.cdna.idx osa1_r7.gene_models.repr.cdna.fa.gz

## Quantification
#for i in *_1.fastp.fq.gz
#do
#	prefix=$(basename $i _1.fastp.fq.gz)
#	kallisto quant -i osa1_r7.gene_models.repr.cdna.idx -o ${prefix} -b 100 --threads 18 ${prefix}_1.fastp.fq.gz ${prefix}_2.fastp.fq.gz 2> ${prefix}_kallisto.err
#done

## Building a matrix
/mnt/e/bin/abundance_estimates_to_matrix.pl --est_method kallisto --gene_trans_map none --cross_sample_norm none --out_prefix osbcat2 --name_sample_by_basedir --quant_files quant_file 
