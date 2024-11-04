##
#conda activate fastp

## for loop
for i in *_1.fastq.gz
do
	prefix=$(basename $i _1.fastq.gz)
	fastp -i "$prefix"_1.fastq.gz -I "$prefix"_2.fastq.gz -o "$prefix"_1.fastp.fq.gz -O "$prefix"_2.fastp.fq.gz --thread 16 --html "$prefix"_fastp.html --json "$prefix"_fastp.json 2> "$prefix"_fastp.err
done

## each data
#fastp -i $1_f1.fq.gz -I $1_r2.fq.gz -o $1_f1_fastp.fq.gz -O $1_r2_fastp.fq.gz --thread 16 --html $1_fastp.html --json $1_fastp.json 2> $1_fastp.err
#rm -f $1_f1.fq.gz $1_r2.fq.gz
