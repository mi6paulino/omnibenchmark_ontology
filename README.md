# Design problems

We can retrieve params but not their names because we use plans and not composite plans (see the parametermap at https://swissdatasciencecenter.github.io/renku-ontology/webvowl/index.html#)

```
PREFIX schema: <http://schema.org/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX prov: <http://www.w3.org/ns/prov#>
PREFIX renku: <https://swissdatasciencecenter.github.io/renku-ontology#>

SELECT DISTINCT ?asoc ?argument ?gen ?plan ?act ?kw ?ended ?inputfile ?outputfile WHERE {

  # get the generation for the activity, and descend into
  # the keywords to identify the project that generated it
  ?gen prov:activity ?act .
  ?entity prov:qualifiedGeneration ?gen .
  ?files prov:entity ?entity .
  ?dataset schema:hasPart ?files .
  ?dataset schema:keywords ?kw .

  ?act a prov:Activity .
  ?act prov:qualifiedAssociation ?asoc.
  ?asoc prov:hadPlan ?plan .
  ?plan renku:hasInputs ?input .
  ?input schema:defaultValue ?inputfile .

  # handy heuristic: we do not care about src/*
  FILTER (strstarts(str(?inputfile), 'data/')) .

  ?plan renku:hasOutputs ?output .
  ?output schema:defaultValue ?outputfile .
  # get the ending time to sort the entities chronologically
  ?act prov:endedAtTime ?ended .

  ?plan renku:hasArguments ?args .
  ?args schema:defaultValue ?argument .

} limit 10
```


# Resources

API queries https://github.com/SwissDataScienceCenter/renku-graph/tree/51f4425c8f3abaa09fef6dab74013baf7ceafedb/knowledge-graph

# Thoughts

We can use renku/omb federated queries, but our metadata cannot only align to renku - due to their active updating (i.e. slugs) and design choices, which don't necessarily match ours.

requirements

https://docs.google.com/spreadsheets/d/1bH4hsf8JDUkoUxzoq_iX3kV00RaTIkKTCMXwgoDFK2w/edit#gid=0
