
# Introduction

<!-- ### Landscape spatial scale -->

Our understandings of ecological pattern and process are directly linked
to the scale at which they are observed (Levin 1992). Animals and
landscapes are influenced across scales by higher level processes,
e.g. climate and productivity (Field et al. 2009), and lower level
processes, e.g. species interactions and resource availability (Legendre
1993; Chave 2013). The effect of scale has been explicity considered in
ecology including in species distribution (Elith and Leathwick 2009),
habitat selection (Mayor et al. 2007) and food webs (Sugihara, Schoenly,
and Trombla 1989). Scale can be considered for all measured quantities
(Schneider 2009) including spatial and temporal variables as well as
domain specific variables such as sociality.

<!-- observational scales of landscapes do not necessarily correspond to the "scale of effect" of species-landscape relationships, or the scale at which there is the strongest relationship [@jackson2015]-->

<!-- the scales that influence animals and the patterns of their landscapes may be disjoint [@chave2013].  -->

<!-- observers bias their perspective when selecting a scale,often unknowingly or without considering the implications [@allen2015].  -->

<!-- Spatial scale is a central consideration in the way we understand landscape ecology and animal space use.  -->

<!-- ### Social proximity scale 
sociality exists 
-->

Sociality is important because conspecifics have positive and negative
benefits

Sociality is accompanied by positive and negative effects, and evolves
when the net benefit is greater than the cost (Silk 2007). Positive
effects include protection from predators, mating opportunities, and
resource location and access (Silk 2007). Negative effects include
increased competition, risk of disease transfer and infection (Silk
2007).

Social scale is the type of social relationship measured and how this
relationship is defined (Farine and Whitehead 2015). If the greater
range of a social relationship is the entire social system for an
organism, a particular social scale may focus on only a limited type of
relationship like grooming or aggression.

<!-- ### Regular networks
* SNA significant outcomes
-->

Network theory and social network analysis allows one to scale across
dyads, groups, etc from pairwise interactions to social units, networks
etc(Krause, Lusseau, and James 2009)

infer process from large scale pattern (Krause, Lusseau, and James 2009)

Structure of social networks affects evolutionary processes, population
dynamics, (Kurvers et al. 2014)

<!-- ### Multilayer networks
used across disciplines
-->

Multilayer networks explicitly consider social systems across temporal,
spatial and social contexts (Pilosof et al. 2017). They are made up of
multiple layers, each representing relationships, individuals, spatial
areas or temporal windows (Kivela et al. 2014; Porter 2018).
<!--GENERALLY INTERESTING Recently used in animal behaviour studies, multilayer networks have the potential to better characterize complex social systems [@silk2018a; @finn2019].-->

For multilayer social networks, three types of scale are relevant:
spatial, temporal and social scale.

<!-- ### Case study 
deer
fogo caribou
-->

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

<div id="ref-chave2013">

Chave, Jérôme. 2013. “The Problem of Pattern and Scale in Ecology: What
Have We Learned in 20 Years?” *Ecology Letters* 16 (s1): 4–16.
<https://doi.org/10.1111/ele.12048>.

</div>

<div id="ref-elith2009">

Elith, Jane, and John R. Leathwick. 2009. “Species Distribution Models:
Ecological Explanation and Prediction Across Space and Time.” *Annual
Review of Ecology, Evolution, and Systematics* 40 (1): 677–97.
<https://doi.org/10.1146/annurev.ecolsys.110308.120159>.

</div>

<div id="ref-farine2015">

Farine, D. R., and H. Whitehead. 2015. “Constructing, Conducting and
Interpreting Animal Social Network Analysis.” *Journal of Animal
Ecology* 84 (5): 1144–63. <https://doi.org/10.1111/1365-2656.12418>.

</div>

<div id="ref-field2009">

Field, Richard, Bradford A. Hawkins, Howard V. Cornell, David J. Currie,
J. Alexandre F. Diniz-Filho, Jean-François Guégan, Dawn M. Kaufman, et
al. 2009. “Spatial Species-Richness Gradients Across Scales: A
Meta-Analysis.” *Journal of Biogeography* 36 (1): 132–47.
<https://doi.org/10.1111/j.1365-2699.2008.01963.x>.

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

<div id="ref-krause2009">

Krause, Jens, David Lusseau, and Richard James. 2009. “Animal Social
Networks: An Introduction.” *Behavioral Ecology and Sociobiology* 63
(7): 967–73. <https://doi.org/10.1007/s00265-009-0747-0>.

</div>

<div id="ref-kurvers2014">

Kurvers, Ralf H. J. M., Jens Krause, Darren P. Croft, Alexander D. M.
Wilson, and Max Wolf. 2014. “The Evolutionary and Ecological
Consequences of Animal Social Networks: Emerging Issues.” *Trends in
Ecology & Evolution* 29 (6): 326–35.
<https://doi.org/10.1016/j.tree.2014.04.002>.

</div>

<div id="ref-legendre1993">

Legendre, Pierre. 1993. “Spatial Autocorrelation: Trouble or New
Paradigm?” *Ecology* 74 (6): 1659–73. <https://doi.org/10.2307/1939924>.

</div>

<div id="ref-levin1992problem">

Levin, Simon A. 1992. “The Problem of Pattern and Scale in Ecology: The
Robert H. MacArthur Award Lecture.” *Ecology* 73 (6): 1943–67.

</div>

<div id="ref-mayor2007">

Mayor, S. J., J. A. Schaefer, D. C. Schneider, and S. P. Mahoney. 2007.
“SPECTRUM OF SELECTION: NEW APPROACHES TO DETECTING THE
SCALE-DEPENDENT RESPONSE TO HABITAT.” *Ecology* 88 (7): 1634–40.
<https://doi.org/10.1890/06-1672.1>.

</div>

<div id="ref-pilosof2017a">

Pilosof, Shai, Mason A. Porter, Mercedes Pascual, and Sonia Kéfi. 2017.
“The Multilayer Nature of Ecological Networks.” *Nature Ecology &
Evolution* 1 (4). <https://doi.org/10.1038/s41559-017-0101>.

</div>

<div id="ref-porter2018a">

Porter, Mason A. 2018. “What Is... A Multilayer Network?” *Notices of
the American Mathematical Society* 65 (11): 1.
<https://doi.org/10.1090/noti1746>.

</div>

<div id="ref-schneider2009">

Schneider, David C. 2009. *Quantitative Ecology: Measurement, Models and
Scaling*. Academic Press.

</div>

<div id="ref-silk2007">

Silk, Joan B. 2007. “The Adaptive Value of Sociality in Mammalian
Groups.” *Philosophical Transactions of the Royal Society B: Biological
Sciences* 362 (1480): 539–59. <https://doi.org/10.1098/rstb.2006.1994>.

</div>

<div id="ref-sugihara1989b">

Sugihara, George, Kenneth Schoenly, and Alan Trombla. 1989. “Scale
Invariance in Food Web Properties.” *Science, New Series* 245 (4913,):
48–52.

</div>

</div>
