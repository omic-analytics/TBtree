# TBtree
pang gawa ng puno ng pag-uugnay (relationship tree) ng iba't ibang lahi ng mycobacterium tuberculosis \
ito ay pang illumina paired-end reads lang

## Paano gamitin?
* STEP 0: clone repository \
``` https://github.com/wewantsaul/TBtree.git ``` \
pero kung meron na, wag na. kung meron na, punta ka sa loob: \
```cd TBtree```
* STEP 1: activate nextflow environment \
``` conda activate nextflow-env ```
* STEP2: type mo lang to \
``` nextflow main.nf --reads <path/to/reads> --out_dir <name/of/directory>```
  * <path/to/reads>: pinaglalagyan ng hilaw na basa 
  * <name/of/directory>: pangalan ng karpeta (folder) - dito mapupunta lahat ng dokumento ng pagsasaliksik
* STEP3: kopyahin sa lokal mong kompyuter ang resultang karpeta 
  * hanapin ang 06_iqtree sa loob ng karpeta 
  * pagkabukas, hanapin ang file na mayroong ```*.treefile``` na format 
  * hilain at ihulog (drag and drop) [dito](https://itol.embl.de/upload.cgi)

