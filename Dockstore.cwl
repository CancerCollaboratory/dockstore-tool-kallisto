#!/usr/bin/env cwl-runner

class: CommandLineTool

dct:creator:
  '@id': http://orcid.org/orcid.org/0000-0002-6130-1021
  foaf:name: Denis Yuen
  foaf:mbox: mailto:help@cancercollaboratory.org
requirements:
- class: DockerRequirement
  dockerPull: quay.io/collaboratory/dockstore-tool-kallisto

cwlVersion: v1.0

inputs:
# common parameters

  quant_output_name:
# parameters for kallisto quant specifically

    type: string?
    inputBinding:
      position: 50
      prefix: -o
  kmer-size:
    type: int?
    inputBinding:
      position: 10
      prefix: -k
  fastq:
    type: File[]?
    inputBinding:
      position: 60


  index_name:
    type: string?
    inputBinding:
      position: 2
      prefix: -i
  mode:
    inputBinding:
      position: 1
    type:
      type: enum
      name: mode
      symbols: [index, quant]
  fasta:
    type: File?
    inputBinding:
      position: 20

  index_input:
    type: File?
    inputBinding:
      position: 20
      prefix: -i
  output_files:
  - string[]
outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.output_files)

baseCommand: []
doc: |
  Usage:   Available at https://pachterlab.github.io/kallisto/manual.html

