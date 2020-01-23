The problem and promise of scale in multilayer networks
================
Alec L. Robitaille<sup>1</sup>, Quinn M.R. Webber<sup>2</sup>, Julie W.
Turner<sup>1</sup>, Eric Vander Wal<sup>1,2</sup>

<sup>1</sup>Department of Biology, Memorial University of Newfoundland,
Canada; <sup>2</sup>Cognitive and Behavioural Ecology Interdisciplinary
Program, Memorial University of Newfoundland

## Abstract

Scale remains a seminal concept in ecology. Spatial scale, for instance,
has become a central consideration in the way we understand landscape
ecology and animal space use. Multilayer networks promise the
integration of monolayer animal social networks with the complexity and
importance of animal movement and space use in heterogeneous landscapes.
Despite the complex interplay between social networks and how animals
use space, there remains an important biological and methodological gap
in our understanding of an animal’s perception of spatial scale, e.g.,
grain and extent, can affect multilayer network dynamics. Here, we test
how multilayer network metrics (e.g., versatility, multi-degree,
similarity) are sensitive to variation in an animal’s perception of
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
to the scale at which they are observed (Levin 1992; Allen et al. 2015).
Animals and landscapes are influenced across scales processes as global
as climate and productivity (Field et al. 2009), and species-specific as
trophic interactions and resource availability (Legendre 1993; Chave
2013). The effect of scale in ecology has been explored through species
distribution modelling (Elith et al. 2009), habitat selection (Mayor et
al. 2007), and food webs (Sugihara et al. 1989). Scale can be considered
throughout ecology, including animal behaviour and the social
environment that animals experience.

Sociality exists across scales (Whitehead 2008). For example, grooming
and mating relationships require close proximity between conspecifics
and occur over brief time periods (e.g. Carter et al. 2015), whereas
social association represents shared space use by members of the same
social group (Franks et al. 2010). Further, for social interactions or
associations to occur individuals must share space, and thus have
overlapping home ranges. In the context of the social environment, home
range overlap is a relatively coarse scale of sociality across which
individuals share space over larger spatial and temporal scales
(e.g. Piza-Roca et al. 2018). Although the social environment clearly
scales spatially and temporally, it remains unclear whether coarser
scales of sociality, including social association and home range
overlap, vary predictably with social interaction (Castles et al. 2014;
Farine 2015). Here, we define *social scale* as the type of social
relationship observed that can be explicitly defined and measured in
social network analyses (Farine et al. 2015).

Animal social network analysis is a well-developed tool used to measure
the relationships of individuals and organization of social systems
(Krause et al. 2009; Wey et al. 2008; Croft et al. 2008). Social network
analysis provides insight into intra-specific interactions and the
structure of social communities and social network properties can
influences population dynamics and evolutionary processes
(Pinter-Wollman et al. 2014; Kurvers et al. 2014). Despite the
widespread use and innovation of traditional social network analysis
(Webber & Vander Wal 2019), it typically considers a single scale of
sociality in a given network, drastically simplifying the complexity of
animal social systems (Finn et al. 2019).

Unlike traditional social networks, multilayer networks explicitly
consider social systems across contexts, including scale-dependent
contexts (Pilosof et al. 2017). Multilayer networks are made up of
multiple layers, each representing different classes of individuals
(e.g. male or female), types of behaviours (e.g. grooming, travelling,
or foraging), spatial areas (e.g. local or regional), or temporal
windows (e.g. daily or seasonal) (Kivela et al. 2014; Porter 2018).
Multilayer networks are relatively novel to studies of animal behaviour
(Finn et al. 2019; Silk et al. 2018), although they have been used to
describe multidimensional human social systems, complex transportation
networks, and organismal neural networks (Silk et al. 2018). The role of
scale within multilayer social networks remains unexplored but provides
a unique opportunity to develop novel understanding of variation in the
temporal or spatial scales associated with social systems.

Here, we discuss and integrate variation in temporal and spatial scales
within a multilayer network framework. We borrow from behavioural,
landscape, and spatial ecology to build a conceptual and analytical
framework for scale-dependent multilayer networks and we apply this
framework to a fission-fusion social system case study of caribou
(*Rangifer tarandus*) in Newfoundland, Canada (Peignier et al. 2019). We
use this case study to address two principal questions associated with
scale-dependent multilayer networks. First, to what degree does the
spatial scale of landscapes, temporal windows of analysis, and social
scale of relationships, influence our ability to interpret complex
social systems? Second, can variation in spatial, temporal, and social
scale improve predictions associated with seasonal differences in
resource availability and social association? We conclude with
perspectives for further development and application of scale in
multilayer networks with respect to landscape ecology (Schneider 2009),
individual fitness and phenotypes (Ref), and movement ecology and
collective movement (Jolles et al. 2019).

## Scale in multilayer networks: a case study

### Caribou socioecology

Here, we use caribou as a case study to develop scale-dependent
multilayer networks based on temporal (seasonal), spatial (habitat
type), and social (visual and auditory perception). Caribou are
gregarious ungulates with fission-fusion dynamics (Lesmerises et
al. 2018) that display temporal (Peignier et al. 2019) and spatial
(Webber et al. unpublished data) variation in social networks. In
winter, caribou dig holes in the snow, termed craters to access forage
(Bergerud 1974). As a result, caribou tend to occupy and re-use craters
once they are established and there is considerably less access to
forage than when the landscape is snow-free. Importantly, craters exist
on the landscape at multiple scales: the crater scale (a single crater),
the feeding area scale (multiple craters in close proximity), and the
winter range scale (all craters within an individual’s range) (Mayor et
al. 2009). The distribution of forage for caribou is therefore
seasonally heterogeneous, with greater access in snow-free seasons
compared to winter as well as spatially heterogeneous in winter because
the distribution of craters on the landscape varies meaning that access
to vegetation in winter is highly variable for caribou. We therefore
partitioned data into two discrete seasons: summer (3 August - 17
October) and winter (1 January – 16 March) based on caribou socioecology
(Peignier et al. 2019).

### Caribou location data

We used GPS location data collected from Fogo Island caribou in 2018.
Adult female caribou were immobilized and fitted with global positioning
system (GPS) collars (Lotek Wireless Inc., Newmarket, ON, Canada,
GPS4400M collars, 1,250 g) as described by Schaefer and Mahoney (2013).
Collars were programmed to collect location fixes every 2 hours. Prior
to analyses, we subset GPS fixes into a discrete removed all erroneous
and outlier GPS fixes following Bjørneraas et al. (2010). We did not
collar all female caribou in the herd; however, we assumed that our
sample of collared animals was random.

### Landscape data and habitat classification

Landscape classification data were provided by the Newfoundland and
Labrador Wildlife Division. Available landcover classification included
nine habitat types at 30 x 30m resolution. We distilled the landcover
types into three broad categories: foraging habitat, open habitat, and
closed habitat. Foraging habitat consisted of lichen habitat, open
habitat consisted of wetland, rocky barrens, and anthropogenic habitat
types, while closed habitat consisted of coniferous forest, conifer
scrub, broadleaf forest, and mixed-wood forest habitat types. Water
habitat was excluded from all subsequent analyses.

### Caribou multilayer social networks

#### Network types and construction (defining layers for the multilayer network)

We generated seasonal multilayer social networks consisting of
habitat-specific monolayers. Each layer was the social association
network generated in one of three habitat types (lichen, open, and
closed). For habitat-specific networks, all GPS relocations were
assigned to the corresponding habitat type and proximity-based social
network layers were generated using the R package spatsoc (Robitaille et
al. 2019) in *R version* (R CITATION).

Within each habitat-specific monolayer network, we assumed individuals
were associating if simultaneous GPS fixes (i.e., recorded within 5
minutes of each other) were within a given distance of one another.
Typically for ungulates and other gregarious mammals, the ‘chain rule’
is applied for group assignment. For GPS data, the chain rule is applied
if discrete spatiotemporal GPS fixes buffered by a given distance formed
a contiguous buffer for two or more individuals, even if some
individuals within the buffer were not within the given distance of one
another (Robitaille et al. 2019). Group assignment based on the chain
rule has previously been applied to caribou at a distance of 50m
(Peignier et al. 2019; Lesmerises et al. 2018). To assess the role of
social scale in multilayer networks, we varied the threshold distance
for group assignment between 5-500m (see *Social scale* section below).
In all networks, nodes represented individuals, intralayer edges
represented associations between individuals in a given habitat type,
and interlayer edges represented **XXXX \[ALEC??\]**.

We weighted edges of social networks by the strength of association
between caribou using the simple ratio index (SRI, Cairns and Schwager
1987):

\[ SRI = \frac{x}{x + y_{AB} + y_{A} + y_{B}} \]

where x is the number of fixes where individuals A and B were within a
given distance of each other, y<sub>A</sub> is the number of fixes from
individual A when individual B did not have a simultaneous fix,
y<sub>B</sub> is the number of fixes from individual B when individual A
did not have a simultaneous fix, and y<sub>AB</sub> is the number of
simultaneous fixes from individuals A and B that were separated by more
than the given distance (Farine & Whitehead 2015). Social groups were
designated if two or more individuals occurred within a given distance
of one another at any given time point.

For each multilayer network, we calculated XXX metrics.These included
four neighborhood-based metrics: degree centrality, multidegree, degree
deviation, and neighbours as well as two multilayer \[need better term
here?\] metrics: connective redundancy and relevance (see Glossary for
definitions). GOING TO NEED MORE HERE (SEE SMITH-AGUILAR ET AL 2019
PAPER FOR REFERENCE ON EXPLAINING THESE).

We generated all networks Right now, we calculate mostly
degree/neighborhood based metrics. \* Degree centrality \* Multidegree
\* Degree deviation: standard deviation of degree across layers

  - Neighbors/neighborhood (number of unique actors directly connected
    to each focal)

Neighbors = degree within a network layer But across a multilayer
network with multiple layers, some neighbors are repeated.

So the difference between neighbors and degree is the basis for

  - Connective redundancy: 1 - (neighborhood / degree) When connective
    redundancy is 0, all edges on all layers are necessary to preserve
    the social ties

  - Relevance: neighborhood of specific layer / neighbourhood of full ml
    net. This is the proportion of neighbors present on the layer of
    focus. Comparing across, it tells you which layers are most
    important for each individual.

Then there will be some layer similarity. Right now it’s just a
correlation of each season’s asnipe SRI matrix

Finally, some weighted variable.

### Scale in multilayer networks

#### Temporal scale

We altered the temporal scale of mutlilayer networks using a moving
time-window approach to define seasons.

1.  time window length

Varying length of time window (used to define seasons). From 75 to 150
right now. Fixed start julian day for winter is day 1 and for summer is
215. Network layers for winter and summer are calculated for each window
length.

1.  time window position Varying position of time window (used to define
    seasons). Fixed length at 75. Window positions starting at 1, to +
    75. So 1-75 is first iteration for winter and 75-150 is second
    iteration for “winter”. Same for summer, starting at 215. Network
    layers for each season are constructed.

#### Spatial scale

To assess the influence of spatial scale on multilayer networks, we
re-sampled our landcover classification map at varying scales.
Specifically, we selected scales relevant to caribou ecology. We
re-sampled landcover using the `grainchanger` **package** (Graham 2019)
at **five** scales: 100m, 250m, 500m, 1000m, 2500m. Sampling at 100 and
250m represents fine-scale decision making for caribou during foraging
(REF), while re-sampling at 1000m and 2500m represents the scale at
which caribou tend to select and avoid habitat (Bastille-Rousseau et
al. 2017). Resampling occurred based on a modal moving window method,
where **XXXXX. \[ALEC YOU’RE GOING TO HAVE TO ADD DETAIL HERE\]**

For each landcover (the original resolution and modal resampled
resolutions), seasonal network layers are combined in a multilayer
network
<!-- Each modal landcover, and the original are sampled and separate network layers constructed for each. **[QW: NOT SURE WHAT THIS MEANS]** -->

#### Altering social scale

We altered social scale based on visual (short distance) and auditory
(long distnace) sensory modalities of caribou (REF?). Specifically, we
modified the distance threshold required for group assignment (see
above) and re-assigned groups at incremental distance between 5-500m.
For example, at the finest social scale, only individuals within 5m of
one another were considered in the same group, whereas at the coarset
social scale, only individuals within 500m of one another were
considered in the same group.

#### Altering observational scale

Studies of social network analysis vary in the number and frequency of
observations as well as the data collection technique used to generate
networks (Davis et al. 2018; Webber and Vander Wal 2019).

Randomly select max number of observations - timegroups - (right now
750). For each iteration, include n observations for each season for all
individuals. Subsequent iterations include nstep more (right now 25),
along with previously included to remove stochasticity. Parallels with
observation data.

## Scale in multilayer networks in practice: case study results

## Perspectives to advance multilayer networks

### Landscape ecology

### Individual fitness and phenotypes

### Movement ecology and collective movement

Animal movement undoubtedly affects the social environment
(Strandburg-Peshkin et al. 2015) and multilayer networks are no
exception (Mourier et al. 2019). Movement is a dynamic process and is
related to an individual’s space use as well as the resources consumed
within their home range (Van Moorter et al. 2016). Collective movement
can reduce group-level predation via detection-dilution trade-offs,
while it can also improve information transfer about the quality or
location of resources (Jolles et al. 2019). Social processes, movement
decisions, and space use are therefore inextricably linked.

Although multilayer animal social networks are relatively novel (Silk et
al. 2018), movement behaviour within multilayer networks has already
been considered in a handful of studies. In gunieafowl (*Acryllium
vulturinum*), GPS movement data were used to generate *monolayer*
association networks within a multilayer network (Papageorgiou et
al. 2019). In addition, *spatial networks* are networks of locations,
which are connected in a network when individuals move between
locations. For example, spatial networks were applied to monitor
movement of sharks (*Carcharhinus amblyrhynchos* and *Carcharhinus
melanopterus*) between between fixed location autonomous arrays, where
nodes represent locations within the array, *intralayer edges* represent
individual movement frequency, and *interlayer edges* represent contact
probability among individuals at a given node (Mourier et al. 2019).
While both studies integrate movement in some capacity, neither generate
networks based on continuous measures of collective, or dyadic, movement
(Long et al. 2014).

Continuous collection of animal relocation data using GPS technology can
be used to measure how groups of animals make movement decisions in the
context of their local environment (Strandburg-Peshkin et al. 2015,
2017) and across scales. A collective movement layer could constitute
similarity in movement for dyads (Long et al. 2014) or groups (Bode et
al. 2011) as well as at a fine (i.e. minute-to-minute: Cleasby et
al. 2019) or coarse (global migration: Flack et al. 2018) scales.
Another potential application would be to generate social networks
during times when animals are engaged in different behaviours, including
moving, interacting, or foraging (e.g. Muller et al. 2018; Finn et
al. 2019) and construct a multilayer networks based on
behaviour-specific monolayer networks (e.g. Smith-Aguilar et al. 2019)
In contrast to spatial networks, movement networks could assimilate
dyadic movement metrics into a network representing the continuous and
simultaneous movement trajectories of animals. Importantly, the key to
incorporating movement in multilayer networks across scales is the
technological advancements available to overcome previous limitations
(see Hughey et al. 2018).

Given the existing framework for constructing multilayer networks from
behavioural layers (e.g. Smith-Aguilar et al. 2019), movement layers
could be integrated with interaction or association layers. Integrating
movement layers with habitat-specific social association layers could
further shed light on the role of movement as a driver of the social and
spatial environments an individual experiences (Webber and Vander Wal
2018). In our case study, we generated multilayer networks based on
habitat-specific monolayers. Coordinated movement of dyads, or groups,
could vary based on habitat and the approach we outline could be used to
explore mechanisms linking the social and spatial environments. For
example, social processes may be an emergent property of the landscape
because animals aggregate at resources, such as waterholes
(Chamaillé-Jammes et al. 2008), while movement to, from, or within
habitat patches can also contribute to the formation of the social
environment (Spiegel et al. 2016). Incorporating movement ecology within
a multilayer network framework is a logical next step for a burgeoning
field. In particular, when association networks are habitat-specific, we
suggest the integration of movement and space use in multilayer networks
provides novel insight into the effects of habitat configuration on the
formation of the social environment (He et al. 2019).
