# Purpose

This is an ontology to annotate omnibenchmark runs.

We provide three components:
- the ontology formalization (turtle)
- an example knowledgebase (turtle) with a simplified setup:
  - one data module
  - two filtering modules
  - one method module
- some SPARQL queries

# Design philosophy

- Keep it deliverable-centric (file-centric), because bioinformatics workflows typically are.
- Reduce overlaps to renku's ontology but allow overlaps; we can add federated queries and/or merge graphs by matching literals (i.e. plan ids or activity ids).
- Make use of gitLFS / S3 buckets identifiers, to streamline dataset retrieval.
- Make use of module names and file names, to perhaps switch to command-line workflows at some point.
- Keep versions/epochs explicit.

# Why

(Sept 2023) We can retrieve parameters from renku's triples but not their names because we use plans and not composite plans. The relevant named key:value tuples are named `parametermaps` at https://swissdatasciencecenter.github.io/renku-ontology/webvowl/index.html .

# Resources

- [API queries](https://github.com/SwissDataScienceCenter/renku-graph/tree/51f4425c8f3abaa09fef6dab74013baf7ceafedb/knowledge-graph)

# Requirements

- [Specs](https://docs.google.com/spreadsheets/d/1bH4hsf8JDUkoUxzoq_iX3kV00RaTIkKTCMXwgoDFK2w/edit#gid=0)

# To remember

- Missing git hook/populate the endpoint on push
- To be linked to the container/codebase tagging/branching system
