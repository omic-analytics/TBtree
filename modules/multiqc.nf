process multiqc {
	container 'quay.io/biocontainers/multiqc:1.11--pyhdfd78af_0'

	tag "collecting"

	publishDir (
	path: "${params.out_dir}/03_coverage",
	mode: "copy",
	overwrite: "true"
	)

	input:
	file(fastP)
	file(mosdepth)

	output:
	path "*"

	script:
	"""
	multiqc $fastP $mosdepth
	"""

}