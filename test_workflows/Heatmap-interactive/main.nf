#!usr/bin/env nextflow
nextflow.enable.dsl=2

params.script = '~/Code/nf-cloud/test_workflows/Volcano-interactive/volcano.py'
params.dataPath = "result_ttest.xlsx"
params.output = "~/Code/nf-cloud/results/Volcano-interactive/" 

params.logBaseFC = 2
params.logBaseP = 10
params.thresFC = 2
params.thresP = 0.05

process PlotlyV {
  input:
    val script
    val data
    val output

    val logBaseFC
    val logBaseP
    val thresFC
    val thresP
    
  script:
  """ 
  python ${script} ${data} ${output} ${logBaseFC} ${logBaseP} ${thresFC} ${thresP}
  """
}    

workflow {
  PlotlyV(params.script, params.dataPath, params.output,  params.logBaseFC, params.logBaseP, params.thresFC, params.thresP)  
} 