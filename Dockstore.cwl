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
    type: string 
    inputBinding:
      position: 2 
      prefix: "-i"

  - id: "#fasta"
    type: File 
    inputBinding:
      position: 3 


# parameters for kallisto index specifically

  - id: "#kmer-size"
    type: ["null",int]
    inputBinding:
      position: 4 
      prefix: "-k"


# parameters for kallisto quant specifically

outputs:
  - id: "#index"
    type: File
    outputBinding:
      glob:
        engine: cwl:JsonPointer
        script: /job/index_name

baseCommand: []

