
# Introduction

<!-- Landscape spatial scale -->

Our understanding of ecological patterns and processes are directly
linked to the scale at which they are observed
(<span class="citeproc-not-found" data-reference-id="levin1992">**???**</span>).

heteroneity of landscapes within seemingly homogeneous patches, exist
lower level processes including species interactions, resource
availability, disease transfer (Legendre 1993)

Animals may be influenced by processes at multiple scales

<!-- observational scales of landscapes do not necessarily correspond to the "scale of effect" of species-landscape relationships, or the scale at which there is the strongest relationship [@jackson2015]-->

the scales that influence animals and the patterns of their landscapes
may be disjoint (Chave 2013). The effects of scale have been explicitly
investigated across many ecological studies including habitat selection
(Mayor et al. 2007), evaluating satellite imagery (Benson and MacKenzie
1995) and of ecology including landscape ecology, movement ecology,
earth observation (Benson and MacKenzie 1995), habitat selection(Mayor
et al. 2007)

<!-- observers bias their perspective when selecting a scale,often unknowingly or without considering the implications [@allen2015].  -->

Scale can be considered for all measured quantities (Schneider 2009)
including spatial and temporal variables as well as domain specific
<!--lead into social-->

<!-- Social proximity scale 
sociality exists 
-->

Social scale is the type of social relationship measured and how this
relationship is defined (Farine 2015). If the greater range of a social
relationship is the entire social system for an organism, a particular
social scale may focus on only a limited type of relationship like
grooming or aggression.

<!-- Regular networks
* SNA significant outcomes
-->

<!-- Multilayer networks
used across disciplines
-->

Multilayer networks explicitly consider social systems across temporal,
spatial and social contexts
(<span class="citeproc-not-found" data-reference-id="pilosof2017a">**???**</span>).
They are made up of multiple layers, each representing relationships,
individuals, spatial areas or temporal windows (Kivela et al. 2014;
<span class="citeproc-not-found" data-reference-id="porter2018a">**???**</span>).
<!--GENERALLY INTERESTING Recently used in animal behaviour studies, multilayer networks have the potential to better characterize complex social systems [@silk2018a; @finn2019].-->

For multilayer social networks, three types of scale are relevant:
spatial, temporal and social scale.

<!-- Case study 
deer
fogo caribou
-->

integrating networks across scales explore sensitivity of network
measures to scale

-----

Spatial scale is a central consideration in the way we understand
landscape ecology and animal space use.

Despite the interplay between social networks and how animals use space,
there remains an important biological and methodological gap in our
understanding of how an animals perception of spatial scale, e.g., grain
and extent,

We will simulate animal movement data coupled with emergent social
networks on increasingly heterogenous landscapes across spatial scales.
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

<div id="ref-benson1995">

Benson, Barbara J., and Mark D. MacKenzie. 1995. “Effects of Sensor
Spatial Resolution on Landscape Structure Parameters.” *Landscape
Ecology* 10 (2): 113–20. <https://doi.org/10.1007/BF00153828>.

</div>

<div id="ref-chave2013">

Chave, Jérôme. 2013. “The Problem of Pattern and Scale in Ecology: What
Have We Learned in 20 Years?” *Ecology Letters* 16 (s1): 4–16.
<https://doi.org/10.1111/ele.12048>.

</div>

<div id="ref-farine2015">

Farine, Damien R. 2015. “Proximity as a Proxy for Interactions: Issues
of Scale in Social Network Analysis.” *Animal Behaviour* 104 (June):
e1–e5. <https://doi.org/10.1016/j.anbehav.2014.11.019>.

</div>

<div id="ref-finn2019">

Finn, Kelly R., Matthew J. Silk, Mason A. Porter, and Noa
Pinter-Wollman. 2019. “The Use of Multilayer Network Analysis in Animal
Behaviour.” *Animal Behaviour* 149 (March): 7–22.
<https://doi.org/10.1016/j.anbehav.2018.12.016>.

</div>

<div id="ref-kivela2014">

Kivela, M., A. Arenas, M. Barthelemy, J. P. Gleeson, Y. Moreno, and M.
A. Porter. 2014. “Multilayer Networks.” *Journal of Complex Networks* 2
(3): 203–71. <https://doi.org/10.1093/comnet/cnu016>.

</div>

<div id="ref-legendre1993">

Legendre, Pierre. 1993. “Spatial Autocorrelation: Trouble or New
Paradigm?” *Ecology* 74 (6): 1659–73. <https://doi.org/10.2307/1939924>.

</div>

<div id="ref-mayor2007">

Mayor, S. J., J. A. Schaefer, D. C. Schneider, and S. P. Mahoney. 2007.
“SPECTRUM OF SELECTION: NEW APPROACHES TO DETECTING THE
SCALE-DEPENDENT RESPONSE TO HABITAT.” *Ecology* 88 (7): 1634–40.
<https://doi.org/10.1890/06-1672.1>.

</div>

<div id="ref-schneider2009">

Schneider, David C. 2009. *Quantitative Ecology: Measurement, Models and
Scaling*. Academic Press.

</div>

</div>
