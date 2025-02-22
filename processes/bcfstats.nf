// Define the `BCFSTATS` process that performs vcf statistics
process BCFSTATS {
    container = 'staphb/bcftools:latest'
    tag "$sid"
    publishDir "${params.outdir}/${workflow.start.format('yyyy-MM-dd_HH-mm-ss')}_${workflow.runName}/BCFSTATS"

//    cache "lenient" 
//    debug true
    errorStrategy 'ignore'
	
    input:
    tuple val(sid), path(vcf)

    output:
    path "${sid}.bcfstats",      emit: bcfstats
    
    script:
    """
    bcftools stats $vcf > "${sid}.bcfstats"
    """
}