process snippy {
	container 'staphb/snippy:4.6.0-SC2'

	tag "assembling $sample"

	publishDir (
	path: "${params.out_dir}",
	mode: 'copy',
	overwrite: 'true'
	)

	input:
	tuple val(sample), path(fastq_1), path(fastq_2)
	path(ref_genome)

	output:
	tuple val(sample), path("02_snippy/*.consensus.fa"), emit: consensus
	tuple val(sample), path("02_snippy/${sample}.vcf"), emit: vcf
	tuple val(sample), path("02_snippy/*.bam"), path("02_snippy/*.bam.bai"), emit: bam_bai
	tuple val(sample), path("02_snippy/*.bam"), emit: bam


	script:
	"""
	snippy \
	--mincov 20 \
	--minfrac 0.9 \
	--basequal 30 \
	--ref $ref_genome \
	--R1 $fastq_1 \
	--R2 $fastq_2 \
	--force --prefix $sample \
	--outdir 02_snippy
	
	"""


}
