The problem and promise of scale in multilayer networks
================
Alec L. Robitaille, Quinn M.R. Webber, Julie W. Turner, Eric Vander Wal

## Abstract

Scale remains a seminal concept in ecology. Spatial scale, for instance,
has become a central consideration in the way we understand landscape
ecology and animal space use. Multilayer networks promise the
integration of monolayer animal social networks with the complexity and
importance of animal movement and space use in heterogenous landscapes.
Despite the complex interplay between social networks and how animals
use space, there remains an important biological and methodological gap
in our understanding of an animals perception of spatial scale, e.g.,
grain and extent, can affect multilayer network dynamics. Here, we test
how multilayer network metrics (e.g., versatility, multi-degree,
similarity) are sensitive to variation in an animals perception of
scale. We will simulate animal movement data coupled with emergent
social networks on increasingly heterogenous landscapes across spatial
scales. Furthermore, we review specific examples of spatially explicit
data types to include in multilayer networks and explore the relevant
nuances of these data. *Our simulations will highlight the need to
carefully select scales for measuring spatial processes and
appropriately weight layers and edges representing different types of
data.* Effective integration of spatial processes, including
biologically meaningful scales, within the context of animal social
networks is an emerging area of research; our contribution will uniquely
incorporate landscape ecology theory as a way to link different scales
of social and spatial processes in a multilayer network. Based on social
network and landscape ecology theory as well as our simulations we
demonstrate potential for interconnectedness among individual animals
and the landscapes they occupy.

## Introduction

Our understandings of ecological pattern and process are directly linked
to the scale at which they are observed (Levin 1992; Allen et al 2015).
Animals and landscapes are influenced across scales by higher level
processes, such as climate and productivity (Field et al 2009) and lower
level processes, such as species interactions and resource availability
(Legendre 1993; Chave 2013). The effect of scale in ecology has been
explored through species distributions (Elith et al 2009) habitat
selection (Mayor et al 2007) and food webs (Sugihara et al 1989). Scale
can be considered for all types of measured quantities9 including
spatial and temporal variables, as well as behavioural variables
including sociality.

Sociality exists across scales (Whitehead 2008). For example, grooming
and mating relationships requires close proximity between conspecifics
and occur over brief time periods (e.g. Carter et al. 2015), whereas
social association represents shared space use by members of the same
social group (Franks et al. 2010). Further, home range overlap among
individuals is a coarse scale of sociality, where individuals share
space over larger spatial and temporal scales (e.g. Piza-Roca et
al. 2018). Shared space is a requirement for most types of social
interactions, however, it remains unclear whether coarser scales of
sociality, including social association and home range overlap, vary
predictably with social interaction (Castles et al. 2014; Farine 2015).
Social scale can be defined as the type of relationship observed (Farine
2015) and these relationships can be explicitly defined and measured in
social network analyses (Farine et al. 2015).

Animal social network analysis are a well-developed tool used to measure
the relationships of individuals and organization of social systems
(Krause et al 2009; Wey et al. 2008; Croft et al. 2008). Social network
analyses provide insight into interspecific interactions and the
structure of social communities and social network properties can
influences population dynamics and evolutionary processes
(Pinter-Wollman et al. 2014; Kurvers et al. 2014). Nevertheless, despite
the power of traditional social network analysis, it typically considers
a single scale of sociality in a given network, drastically simplifying
the complexity of animal social systems (Finn et al. 2019).

Unlike traditional social networks, multilayer networks explicitly
consider social systems across contexts, including scale-dependent
contexts (Pilosof et al. 2017). Multilayer networks are made up of
multiple layers, each representing different classes of individuals
(e.g. male or female), types of behaviours (e.g. grooming or mating),
spatial areas (e.g. local or regional), or temporal windows (e.g. daily
or seasonal) (Kivela et al 2014; Porter 2018). Multilayer networks are
relatively novel to describing animal behaviour studies (Finn et
al. 2019; Silk et al. 2018), although they have been used to describe
multidimensional human social systems, complex transportation networks,
and the complete neural network of an organism (Silk et al. 2018). The
role of scale within a multilayer social network context remains
unexplored, but provides a unique opportunity to develop novel
understanding of variation in the temporal or spatial scales associated
with social systems. Here, we discuss and integrate variation in
temporal and spatial scales within a multilayer network framework. We
borrow from behavioural, landscape, and spatial ecology to build a
conceptual and analytical framework for scale-dependent multilayer
networks and we apply this framework seasonally variable social system
case study of caribou (Rangifer tarandus) in Newfoundland, Canada
(Peignier et al. 2019). We use this case study to address two principal
questions associated with scale-dependent multilayer networks. First, to
what degree does the spatial scale of landscapes, temporal windows of
analysis, and social scale of relationships, influence our ability to
interpret complex social systems? Second, can variation in spatial,
temporal, and social scale improve predictions associated with seasonal
differences in resource availability and social association. We conclude
with perspectives for further development and application of scale in
multilayer networks by discussing the problem and promise of scale from
the perspective of social systems (Castles et al. 2014; Farine 2015) and
landscape ecology (Schneider 2009).

## Scale in multilayer networks: a case study

### Caribou socioecology

Here, we use caribou (Rangifer tarandus) as a case study to develop
scale-dependent multilayer networks based on temporal (seasonal),
spatial (habitat type), and social (visual and auditory perception).
Caribou are gregarious ungulates with fission-fusion dynamics
(Lesmerises et al. 2018) that display temporal (Peignier et al. 2019)
and spatial (Webber et al. unpublished data) variation in social
networks. In winter, caribou dig holes in the snow, termed craters to
access forage (Bergerud 1974). As a result, caribou tend to occupy and
re-use craters once they are established. The average area of craters
dug by caribou in Newfoundland was 0.41 m2 (SD = 0.48; Mayor et
al. 2009) and crater density, which varies based on snow condition,
depth, and local caribou density, can range from 366–1980 craters/ha
(Bergerud 1974). There is therefore considerably less access to forage
than when the landscape is snow-free. Importantly, craters exist on the
landscape at multiple scales: the carter scale (a single crater), the
feeding area scale (multiple craters in close proximity), and the winter
range scale (all craters within an individual’s range) (Mayor et
al. 2009). The distribution of craters on the landscape is therefore
heterogeneous and access to vegetation in winter is highly variable
among individual caribou.

### Caribou location data

We used GPS location data collected from Fogo Island caribou in winter
2018 (1 January – 16 March). Adult female caribou were immobilized and
fitted with global positioning system (GPS) collars (Lotek Wireless
Inc., Newmarket, ON, Canada, GPS4400M collars, 1,250 g) as described by
Schaefer and Mahoney (2013). Collars were programmed to collect location
fixes every 2 hours. Prior to analyses, we subset GPS fixes into a
discrete removed all erroneous and outlier GPS fixes following
Bjørneraas et al. (2010). We did not collar all female caribou in the
herd, however, we assumed that our sample of collared animals was
random. Although associations between collared and uncollared animals
were unrecorded, we assumed that our networks (see below) were unbiased
representations of the relative degree of social association among all
caribou.

### Landscape data and habitat classification

### Social network analysis

We used R package spatsoc (Robitaille et al. 2019) in *R version* (R
CITATION) to generate proximity-based social networks (PBSN) from GPS
telemetry data. We generated social networks for each herd in each
season based on proximity of GPS fixes for individual caribou: we
assumed association between two individuals if simultaneous GPS fixes
(i.e., recorded within 5 minutes of each other) were within 50 m of one
another (Lesmerises et al. 2018). We represented individuals in our
networks by nodes and associations between individuals were represented
by edges.

We applied the ‘chain rule’, where each discrete spatiotemporal GPS fix
was buffered by 50 m and we considered individuals in the same group if
50 m buffers for two or more individuals were contiguous, even if some
individuals within the buffer were not within 50 m of one another. Group
assignment based on the chain rule has commonly been applied to
gregarious mammals, including caribou (Peignier et al. 2019; Lesmerises
et al. 2018). We weighted edges of social networks by the strength of
association between dyads of caribou using the simple ratio index (SRI,
Cairns and Schwager 1987):

\[ SRI = \frac{x}{x + y_{AB} + y_{A} + y_{B}} \]

where x is the number of fixes where individuals A and B were within 50
m of each other, yA is the number of fixes from individual A when
individual B did not have a simultaneous fix, yB is the number of fixes
from individual B when individual A did not have a simultaneous fix, and
yAB is the number of simultaneous fixes from individuals A and B that
were separated by \>50 m (Farine & Whitehead 2015). Social groups were
designated if two or more individuals occurred within 50 m of one
another at any given time point. We generated social networks with the
igraph package in R, version 1.2.2 (Csárdi & Nepusz 2006). For each
network, we calculated graph strength, defined as the sum of the edge
weights for each individual in each network. We considered graph
strength generated from PBSNs as an index of sociality (i.e., social
strength).

## Scale in multilayer networks in practice: case study results