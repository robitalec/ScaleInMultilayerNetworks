
# Introduction

<!-- ### Landscape spatial scale -->

Our understandings of ecological pattern and process are directly linked
to the scale at which they are observed.<sup>1,2</sup> Animals and
landscapes are influenced across scales by higher level processes, such
as climate and productivity,<sup>3</sup> and lower level processes, such
as species interactions and resource availability.<sup>4,5</sup> The
effect of scale has been explicity considered in ecology including in
species distribution,<sup>6</sup> habitat selection<sup>7</sup> and food
webs.<sup>8</sup> Scale can be considered for all measured
quantities<sup>9</sup> including spatial and temporal variables as well
as domain specific variables such as sociality.

<!-- observational scales of landscapes do not necessarily correspond to the "scale of effect" of species-landscape relationships, or the scale at which there is the strongest relationship [@jackson2015]-->

<!-- the scales that influence animals and the patterns of their landscapes may be disjoint [@chave2013].  -->

<!-- observers bias their perspective when selecting a scale,often unknowingly or without considering the implications [@allen2015].  -->

<!-- Spatial scale is a central consideration in the way we understand landscape ecology and animal space use.  -->

<!-- ### Social proximity scale  -->

Sociality, defined simply as the degree of shared space use among
conspecifics,<sup>10</sup> exists across scales. For example, grooming
and mating relationships requires close proximity between conspecifics
and occurs over brief time periods whereas home range overlap occurs
over larger spatial and temporal scales. Shared space is a requirement
for social interaction, however, it remains unclear whether spatial
proximity scales predictably with social interactions.<sup>11,12</sup>
Social scale can be defined as the type of relationship
observed<sup>12</sup> and these relationships can be explicitly defined
and measured in social network analyses.<sup>13</sup>

<!-- ### Regular networks
* SNA significant outcomes
-->

Rooted in mathematical graph theory, animal social networks measures the
relationships of individuals and organization of animal social
systems.<sup><span class="citeproc-not-found" data-reference-id="Wey2008">**???**</span>,14,15</sup>
Social network analyses provide insight into mating behaviours, species
interactions, and community structures.

Network theory and social network analysis allows one to scale across
dyads, groups, etc from pairwise interactions to social units, networks
etc<sup>14</sup>

infer process from large scale pattern<sup>14</sup>

Structure of social networks affects evolutionary processes, population
dynamics,<sup>16</sup>

<!-- ### Multilayer networks
used across disciplines
-->

Multilayer networks explicitly consider social systems across temporal,
spatial and social contexts.<sup>17</sup> They are made up of multiple
layers, each representing relationships, individuals, spatial areas or
temporal windows.<sup>18,19</sup>
<!--GENERALLY INTERESTING Recently used in animal behaviour studies, multilayer networks have the potential to better characterize complex social systems [@silk2018a; @finn2019].-->

For multilayer social networks, three types of scale are relevant:
spatial, temporal and social scale.

<!-- ### Case study 
deer
fogo caribou
-->

We will use two case studies to explore the sensitivity of multilayer
network measures across scales. One, using an island population of
caribou (*Rangifer tarandus*)

integrating networks across scales explore sensitivity of network
measures to scale

Despite the interplay between social networks and how animals use space,
there remains an important biological and methodological gap in our
understanding of how an animals perception of spatial scale, e.g., grain
and extent,

We will simulate animal movement data coupled with emergent social
networks on increasingly heterogenous landscapes across spatial scales.

-----

Furthermore, we review specific examples of spatially explicit data
types to include in multilayer networks and explore the relevant nuances
of these data. Our simulations will highlight the need to carefully
select scales for measuring spatial processes and appropriately weight
layers and edges representing different types of data. Effective
integration of spatial processes, including biologically meaningful
scales, into animal social networks is an emerging area of research. Our
contribution will incorporate landscape ecology theory as a way to link
different scales of social and spatial processes in a multilayer
network. Based on social network and landscape ecology theory as well as
our simulations we demonstrate potential for interconnectedness among
individual animals and the landscapes they occupy.

-----

potential for interconnectedness among individual animals and the
landscapes they occupy.

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
locations (as in spatial networks).<sup>20</sup>

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

perception of scale

What is scale

in LE lit, how has scale been investigated

Elements of scale relevant to animal social systems, animal movement
data, landcover data

Grain is this, extent is this

How might scale influence results

What kinds of spatial scale are there

# References

<div id="refs" class="references">

<div id="ref-levin1992problem">

**1** Levin, S. A. Ecology 73, 1943–1967 (1992)

</div>

<div id="ref-allen2015">

**2** Allen, T. F. H. *et al.* (Columbia University Press, 2015)

</div>

<div id="ref-field2009">

**3** Field, R. *et al.* Journal of Biogeography 36, 132–147 (2009)

</div>

<div id="ref-legendre1993">

**4** Legendre, P. Ecology 74, 1659–1673 (1993)

</div>

<div id="ref-chave2013">

**5** Chave, J. Ecology Letters 16, 4–16 (2013)

</div>

<div id="ref-elith2009">

**6** Elith, J. *et al.* Annual Review of Ecology, Evolution, and
Systematics 40, 677–697 (2009)

</div>

<div id="ref-mayor2007">

**7** Mayor, S. J. *et al.* Ecology 88, 1634–1640 (2007)

</div>

<div id="ref-sugihara1989b">

**8** Sugihara, G. *et al.* Science, New Series 245, 48–52 (1989)

</div>

<div id="ref-schneider2009">

**9** Schneider, D. C. (Academic Press, 2009)

</div>

<div id="ref-tinbergen1951">

**10** Tinbergen, N. (1951)

</div>

<div id="ref-castles2014a">

**11** Castles, M. *et al.* Animal Behaviour 96, 59–67 (2014)

</div>

<div id="ref-farine2015a">

**12** Farine, D. Animal Behaviour 104, e1–e5 (2015)

</div>

<div id="ref-farine2015b">

**13** Farine, D. R. *et al.* Journal of Animal Ecology 84, 1144–1163
(2015)

</div>

<div id="ref-krause2009">

**14** Krause, J. *et al.* Behavioral Ecology and Sociobiology 63,
967–973 (2009)

</div>

<div id="ref-croft2008">

**15** Croft, D. P. *et al.* (Princeton University Press, 2008)

</div>

<div id="ref-kurvers2014">

**16** Kurvers, R. H. J. M. *et al.* Trends in Ecology & Evolution 29,
326–335 (2014)

</div>

<div id="ref-pilosof2017a">

**17** Pilosof, S. *et al.* Nature Ecology & Evolution 1, (2017)

</div>

<div id="ref-kivela2014">

**18** Kivela, M. *et al.* Journal of Complex Networks 2, 203–271 (2014)

</div>

<div id="ref-porter2018a">

**19** Porter, M. A. Notices of the American Mathematical Society 65, 1
(2018)

</div>

<div id="ref-finn2019">

**20** Finn, K. R. *et al.* Animal Behaviour 149, 7–22 (2019)

</div>

</div>
