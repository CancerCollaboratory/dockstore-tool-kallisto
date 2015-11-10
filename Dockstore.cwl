#!/usr/bin/env cwl-runner

class: CommandLineTool

description: |
  Usage:   Available at https://pachterlab.github.io/kallisto/manual.html

dct:creator:
  "@id": "http://orcid.org/orcid.org/0000-0002-6130-1021"
  foaf:name: Denis Yuen
  foaf:mbox: "mailto:help@cancercollaboratory.org"

requirements:
  - class: ExpressionEngineRequirement
    id: "#node-engine"
    requirements:
    - class: DockerRequirement
      dockerPull: commonworkflowlanguage/nodejs-engine
    engineCommand: cwlNodeEngine.js
  - class: DockerRequirement
    dockerPull: quay.io/collaboratory/dockstore-tool-kallisto

inputs:

# common parameters

  - id: "#mode"
    inputBinding:
      position: 1 
    type: 
      type: enum
      name: "mode"
      symbols: ["index","quant"]

  - id: "#index_name"
    type: ["null",string] 
    inputBinding:
      position: 2 
      prefix: "-i"

  - id: "#output_files"
    type:  
      - type: array
        items: string 

# parameters for kallisto index specifically

  - id: "#kmer-size"
    type: ["null",int]
    inputBinding:
      position: 10 
      prefix: "-k"

  - id: "#fasta"
    type: ["null",File] 
    inputBinding:
      position: 20  

# parameters for kallisto quant specifically

  - id: "#quant_output_name"
    type: ["null",string] 
    inputBinding:
      position: 50 
      prefix: "-o"

  - id: "#index_input"
    type: ["null",File] 
    inputBinding:
      position: 20  
      prefix: "-i"

  - id: "#fastq"
    type:  
      - "null"
      - type: array
        items: File
    inputBinding:
      position: 60  


outputs:
  - id: "#output"
    type: File
    outputBinding:
      glob:
        engine: cwl:JsonPointer
        script: /job/output_files

baseCommand: []

