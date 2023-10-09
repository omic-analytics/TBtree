nextflow.enable.dsl=2

include {TBtree} from './workflows/mainWorkflow.nf'

workflow {

	Channel
		.fromFilePairs("${params.reads}/*{,.trimmed}_{R1,R2,1,2}{,_001}.{fastq,fq}{,.gz}", flat:true)
		.ifEmpty{error "Cannot find any reads matching: ${params.reads}"}
		.set{ch_sample}

	main:
		
		TBtree(ch_sample)

}
