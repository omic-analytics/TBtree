nextflow.enable.dsl=2


include {fastP} from '../modules/fastP.nf'
include {snippy} from '../modules/snippy.nf'
include {mosdepth} from '../modules/mosdepth.nf'
include {multiqc} from '../modules/multiqc.nf'
include {prokka} from '../modules/prokka.nf'
include {roary} from '../modules/roary.nf'
include {iqtree} from '../modules/iqtree.nf'


workflow TBtree {
	take:
		ch_sample

	main:
		fastP(ch_sample)
		snippy(fastP.out.trimmed, params.ref_genome)
		mosdepth(snippy.out.bam_bai)
		multiqc(mosdepth.out.distribution.collect(), fastP.out.fastP_html.collect())
		prokka(snippy.out.consensus)
		roary(prokka.out.gff.collect())
		iqtree(roary.out.alignment)	
		
}