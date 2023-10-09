process iqtree {
	container 'quay.io/biocontainers/iqtree:2.1.4_beta--hdcc8f71_0'

	tag "constructing ML tree"

	publishDir (
	path: "${params.out_dir}/06_iqtree",
	mode: "copy",
	overwrite: "true"
	)

	input:
	file(roary_aln)

	output:
	path "*"

	script:
	"""
	cat $roary_aln > allseq.aln
	iqtree -T AUTO \
	-s allseq.aln \
	-m GTR+G \
	-bb 1000
	"""

}
