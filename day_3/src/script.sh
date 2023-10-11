#!/bin/bash


# we define the input parameters here using the $ and consecutive numbers
# we will call this script like: script.sh my_reference.fasta my_fastq1.fastq my_fastq2.fastq my_results
reference=$1
fastq1=$2
fastq2=$3
output=$4

# script.sh reference.fasta fastq1.fastq fastq2.fastq mutations

# we call the alignment using $reference, $fastq1 and $fastq2
# COMPLETE with the alignment command
<<<<<<< Updated upstream
bwa-mem2 mem $reference ../day_1/data/reads_1.fastq.gz ../day_1/data/reads_2.fastq.gz | \
    samtools view -uS - | \
    samtools sort - > exercise.bam

# we call the variant calling using $reference and $output
# COMPLETE with the variant calling command
=======
bwa-mem2 mem $reference $fastq1 $fastq2 | \
    samtools view -uS - | \
    samtools sort - > $output.bam
# we call the variant calling using $reference and $output
# COMPLETE with the variant calling command
lofreq call  \
    --ref $reference\
    --call-indels \
    <( lofreq indelqual --dindel --ref $reference $output.bam ) | bgzip > $output.vcf.gz

bcftools index $output.vcf.gz
>>>>>>> Stashed changes
