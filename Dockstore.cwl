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
    type: String
    inputBinding:
      position: 1 
    type: enum
      name: "Mode"
      symbols: ["index","quant"]

  - id: "#index"
    type: File
    inputBinding:
      position: 2 
      prefix: "-i"

# parameters for kallisto index specifically

  - id: "#kmer-size"
    type: ["null",int]
    inputBinding:
      position: 3 
      prefix: "-k"


# parameters for kallisto quant specifically

  - id: "#output-dir"
    type: string 
    inputBinding:
      position: 2
      prefix: "-k"

outputs:
  - id: "#output"
    type: File
    outputBinding:
      glob:
        engine: cwl:JsonPointer

baseCommand: []

