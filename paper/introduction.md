The problem and promise of scale in multilayer networks
================
Alec Robitaille, Quinn M.R. Webber, Julie Turner and Eric Vander Wal
– 2019-09-12

  - [Introduction](#introduction)
  - [Multilayer Networks](#multilayer-networks)
  - [Scale](#scale)
  - [Box 1: Types of spatial
    variables](#box-1-types-of-spatial-variables)
      - [Measuring association](#measuring-association)
      - [Spatial context](#spatial-context)
  - [References](#references)

# Introduction

*Animal social systems are complex and multifaceted*

Social network analysis is a tool for

Animal social systems are complex and multifaceted

traditionally, animal social systems are measured using direct
observation, telemetry or pit tags interactions, e.g. grooming,
aggression, etc, between individuals are quantified by simplified
measures and often lacking any indication of the spatial context of the
interaction

recently the multilayer has been used to

along with spatial variables, comes a large history of landscape ecology
exploring and evaluating sensitivity to scale

here we’ll use simulations to evaluate the impact of scale on social and
spatial variables to better understand it’s impact, implications in ML
networks

# Multilayer Networks

Multilayer networks combine network layers with interlayer edges

Two main types of multilayer networks exist: multiplex networks and
interconnected networks. Layers in multiplex networks consist of the
same entities with each layer representing either a different type of
interaction (as in multirelational networks) or a different time point
or window (as in temporal networks). Layers in interconnected networks
consist of the same or different entities with layers representing
different subsystems (as in networks of networks), different types of
entities (as in intercontextual networks), or different spatial
locations (as in spatial networks) (Finn et al. 2019).

Of these, we have identified multirelational networks, networks of
networks, intercontextual networks and spatial networks as likely to
have spatial and scale considerations

Layers in multilayer networks can be Animal social systems are

What is a network

How does a ML network build on that

Which can include spatial variables

Multifaceted nature of animal social systems many variables having a
spatial component including landcover and habitat type fix rate and

spatial variables defined by

# Scale

What is scale

in LE lit, how has scale been investigated

Elements of scale relevant to animal social systems, animal movement
data, landcover data

Grain is this, extent is this

How might scale influence results

What kinds of spatial scale are there

# Box 1: Types of spatial variables

Multilayer networks can incorporate spatial variables to define edges
between nodes and to characterize the spatial context of network layers.
Edges connect different entities in the same layer or across layers as
well as to the same entities across layers. The spatial context of a
network layer is defined here as the landscape elements, generally
abiotic, that an animal social system exists within. Depending on the
type, a multilayer network may include one or both of these types of
spatial variables to better understand the complex connections between
social systems and the landscapes they

The main types of spatial data that can be included in multilayer
networks are georeferenced biologging data and *landscape scale data. *
Georeferenced biologging data, including radio-frequency identification
tags, radiotelemetry, and Global Positioning System (GPS) devices,
provide an alternative to time and labour intensive direct observations
of individuals and their interactions (Krause, Wilson, and Croft 2011)

Land cover, land use

Edges between nodes can define individual’s associations, preda

  - how associations are measured: e.g. spatsoc
  - how relocations are categorized: e.g. landcover

Multilayer networks incoroprate spatial variables in two ways:

1.  for determining association between individuals in a social system
2.  for characterizing the spatial context of social systems

## Measuring association

For example, association between individuals can be determined using
georeferenced biologging devices such as radio‐frequency identification
tags, radiotelemetry, and global positioning system (GPS) devices.

Proximity based social networks (PBSNs) are association networks based
on close proximity between individuals (Spiegel et al. 2016).

Biologging with GPS allows for simultaneous spatiotemporal sampling of
multiple individuals in a group or population

## Spatial context

The spatial context of social systems can be defined as all

what is the spatial context of an animal social system

explicit spatial locations habitat patches landscape/habitat
connectivity social variable + home range overlap = opportunity to
interact

# References

<div id="refs" class="references">

<div id="ref-finn2019">

Finn, Kelly R., Matthew J. Silk, Mason A. Porter, and Noa
Pinter-Wollman. 2019. “The Use of Multilayer Network Analysis in Animal
Behaviour.” *Animal Behaviour* 149 (March): 7–22.
<https://doi.org/10.1016/j.anbehav.2018.12.016>.

</div>

<div id="ref-krause2011">

Krause, Jens, Alexander D. M. Wilson, and Darren P. Croft. 2011. “New
Technology Facilitates the Study of Social Networks.” *Trends in Ecology
& Evolution* 26 (1): 5–6. <https://doi.org/10.1016/j.tree.2010.10.004>.

</div>

<div id="ref-spiegel2016">

Spiegel, Orr, Stephan T. Leu, Andrew Sih, and C. Michael Bull. 2016.
“Socially Interacting or Indifferent Neighbours? Randomization of
Movement Paths to Tease Apart Social Preference and Spatial
Constraints.” *Methods in Ecology and Evolution* 7 (8): 971–79.
<https://doi.org/10.1111/2041-210X.12553>.

</div>

</div>
