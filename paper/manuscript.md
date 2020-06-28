Considering scale in multilayer animal social networks
================
Alec L. Robitaille<sup>1\*</sup>, Quinn M.R. Webber<sup>2</sup>, Julie
W. Turner<sup>1</sup>, Eric Vander Wal<sup>1,2</sup>
<sup>1</sup>Department of Biology, Memorial University of Newfoundland,
Canada  
<sup>2</sup>Cognitive and Behavioural Ecology Interdisciplinary Program,
Memorial University of Newfoundland  
\*Corresponding author: Alec L. Robitaille (<robit.alec@gmail.com>)

# Abstract

<!-- Scale remains a foundational concept in ecology. Social processes range from 
fine-scale interactions and co-occurrence to overlapping home ranges. Spatial 
scale has become a central consideration in the way we understand landscape ecology
and animal space use. Temporal variation in sociality and

Multilayer networks promise the explicit integration of social, 
spatial and temporal contexts of animal social networks. 

-->

Scale remains a foundational concept in ecology. Spatial scale, for
instance, has become a central consideration in the way we understand
landscape ecology and animal space use. Meanwhile, social processes can
range from fine-scale interactions to co-occurrence and overlapping home
ranges. <!-- and vary within
and across seasons.--> Multilayer networks promise the explicit
integration of the social, spatial and temporal contexts. Given the
complex interplay of sociality and animal space use in heterogeneous
landscapes, there remains an important gap in our understanding of the
influence of scale on animal social networks. We discuss ways of
considering social, spatial and temporal scale in the context of
multilayer caribou social networks. <!--We also present
perspectives on future development and applications of scale in multilayer
networks with respect to: phenotypes and individual fitness, movement ecology
and collective movement, and habitat selection and space use.-->
Effective integration of social and spatial processes, including
biologically meaningful scales, within the context of animal social
networks is an emerging area of research. We incorporate perspectives on
how the social environment and spatial processes are linked across
scales in a multilayer context.

## Keywords

Social network analysis, Landscape ecology, Movement ecology, Space use

# Introduction

Our inference regarding the processes underlying ecological patterns are
directly linked to the scale at which they are observed (Levin 1992;
Allen and Hoekstra 2015). Animals are influenced across scales through
ecological processes such as trophic interactions, resource availability
(Legendre 1993; Chave 2013), and global climate and productivity (Field
et al. 2009). Multiscale ecology has been integrated into species
distribution modelling (Elith and Leathwick 2009), habitat selection
(Mayor et al. 2007), and food webs (Sugihara, Schoenly and Trombla
1989). In the context of animal behaviour, certain behaviours are
scale-dependent; for example, acoustic communication in birds varies
with spatial scales (Luther 2009). We posit that it is important to
consider that animal behaviour within the social environment will be
scale-dependent.
<!-- QW: I think this last sentence needs to be a bit stronger. Why is it important? -->

Social interactions exists across both temporal and spatial scales
(Whitehead 2008). For example, grooming requires close spatial proximity
between conspecifics and occurs over brief time periods (e.g. Carter,
Lee and Marshall 2015), whereas social associations over long time
periods represent shared space use by members of the same social group
(Figure <a href="#fig:spacetime">1</a>, Franks, Ruxton and James 2009).
Individuals must share space to interact or associate and thus have
overlapping home ranges (Vander Wal, Laforge and McLoughlin 2014). Home
range overlap is an example of how animals share space over coarser
spatial and temporal scales (e.g. Piza-Roca et al. 2018). Although the
social environment clearly scales spatially and temporally, it remains
unclear whether coarser scales of social interactions, such as social
association and home range overlap, vary predictably (Castles et al.
2014; Farine 2015). We therefore define social scale as the explicit
definition and measurement of social relationships (Farine 2015).

Social network analysis is a well-developed tool used to measure the
relationships of individuals and organization of social systems (Wey et
al. 2008; Krause, Lusseau and James 2009; Croft et al. 2011). It
provides insight into the structure of social communities and social
network properties, which can influence population dynamics and
evolutionary processes (Pinter-Wollman et al. 2013; Kurvers et al.
2014). Despite the widespread use and innovation of traditional social
network analysis (Webber and Vander Wal 2019), it typically considers a
single scale of sociality in a monolayer network, drastically
simplifying the complexity of animal social systems (Finn et al. 2019).

Extending traditional monolayer social networks, multilayer networks
explicitly consider social systems across scale-dependent contexts
(Pilosof et al. 2017). Multilayer networks are composed of multiple
layers, each representing (i) different classes of individuals,
e.g. male or female, (ii) types of behaviours, e.g. grooming,
travelling, or foraging, (iii) spatial areas, e.g. local or regional,
(iv) or temporal windows, e.g. daily or seasonal (Kivela et al. 2014;
Porter 2018). Multilayer networks are relatively novel to studies of
animal behaviour (Silk et al. 2018; Finn et al. 2019), although they
have been used to describe multidimensional human social systems,
complex transportation networks, and neural networks (Kivela et al.
2014). Scale within multilayer social networks remains unexplored but
provides a unique opportunity to develop novel understanding of
variation in the social, spatial, or temporal scales associated with
social systems.

We examined scale-dependent multilayer networks motivated by
behavioural, landscape, and spatial ecology to and applied this
framework to caribou (*Rangifer tarandus*) on Fogo Island, Newfoundland,
Canada. First, we test to what degree the social scale of relationships,
spatial scale of landscapes, and temporal scale of analysis influences
our ability to interpret complex social systems. Second, we address how
variation in the social, spatial, and temporal scale improves our
understanding of the relationship between social association and
seasonal resource availability. We conclude with potential future
developments and applications of scale in multilayer networks.

# Methods

## Caribou socioecology

Caribou are gregarious ungulates with fission-fusion dynamics
(Lesmerises, Johnson and St-Laurent 2018) that display temporal and
spatial variation in social networks (Peignier et al. 2019). In winter,
caribou dig holes, termed craters, to access forage beneath the snow
(Bergerud 1974). Cratering is presumed to be a costly behaviour, and as
a result, caribou tend to occupy and re-use craters once they are
established. Importantly, craters exist on the landscape at multiple
scales: the crater scale (a single crater), the feeding area scale
(multiple craters in close proximity), and the winter range scale (all
craters within an individual’s range) (Mayor et al. 2009). Access to
forage is therefore heterogeneous in winter depending on snow cover and
distribution of craters on the landscape.

## Caribou location data

We used GPS location data collected from Fogo Island caribou between
April 2017 and March 2019. Adult female caribou were immobilized and
fitted with global positioning system (GPS) collars (Lotek Wireless
Inc., Newmarket, ON, Canada, GPS4400M collars, 1,250 g) as described by
(Schaefer and Mahoney 2013). Collars were programmed to collect location
fixes every 2 hours. Prior to analyses, we subset GPS fixes to remove
all erroneous and outlier GPS fixes following (Bjørneraas et al. 2010).
We did not collar all caribou in the herd; however, the proportion of
marked adult females was \~10% of all adult females and \~5% of all
individuals in the herd. We assumed these individuals were randomly
distributed throughout the population.

## Landscape data and habitat classification

Land cover data were provided by the Newfoundland and Labrador Wildlife
Division (Integrated Informatics Inc.)<!--TODO: check ref-->. Available
land cover classification included nine habitat types at 30 m
resolution. We reclassified the land cover types into three categories
using the R package `raster` (Hijmans 2019): foraging, forest, and open
habitats. Foraging habitat consisted of foraging, forest habitat
consisted of coniferous forest, conifer scrub, broad leaf forest, and
mixed-wood forest, while open habitat consisted of wetland, rocky
barrens, and anthropogenic. Water habitat was excluded from all
subsequent analyses.

## Caribou multilayer social networks

### Network layer construction

We generated proximity-based social networks using the R package
`spatsoc` (Robitaille, Webber and Vander Wal 2019) in R version 4.0.1 (R
Core Team 2020). We assumed individuals were associating if simultaneous
GPS fixes were within the spatial distance threshold of one another.
Typically for ungulates and other gregarious mammals, the ‘chain rule’
is used for group assignment (Croft, James and Krause 2008). For GPS
data, the chain rule is applied by assigning a group identifier to the
union of buffered GPS fixes at each time step. As such, individuals in a
group are within the social distance threshold of at least one other
though not necessarily all other individuals (Robitaille, Webber and
Vander Wal 2019). Group assignment based on the chain rule has
previously been applied to caribou using a temporal threshold of 5
minutes and a social distance threshold of 50 m (Lesmerises, Johnson and
St-Laurent 2018; Peignier et al. 2019). In all networks, individual
caribou were represented as nodes and associations between individuals
in a given network layer were represented as intralayer edges.

We weighted edges of social networks by the strength of association
between caribou using the simple ratio index (SRI, Cairns and Schwager
1987):

\[ SRI = \frac{x}{x + y_{AB} + y_{A} + y_{B}} \]

where x is the number of fixes where individuals A and B were in the
same group, \(y_{A}\) is the number of fixes from individual A when
individual B did not have a simultaneous fix, \(y_{B}\) is the number of
fixes from individual B when individual A did not have a simultaneous
fix, and \(y_{AB}\) is the number of simultaneous fixes from individuals
A and B that were separated by more than the social distance threshold
(Farine and Whitehead 2015).

### Network metrics

We used a series of metrics to characterize the multilayer networks,
focusing on the role of individuals within and across layers, and the
similarity of different layers. To measure the role of individuals
within layers, we calculated degree centrality and graph strength.
Degree centrality is the number of direct connections an individual has
to other individuals in a network layer. Graph strength is the degree
weighted by the strength of association, in this case SRI, in each
layer. We calculated multidegree, the sum of degree centrality of
individuals across layers, an extension of degree centrality to multiple
layers (Berlingerio et al. 2012; Kivela et al. 2014). Finally, we
measured the similarity of layers by calculating edge overlap. Edge
overlap is defined as the proportion of edges present in each network
layer out of all observed edges (Battiston, Nicosia and Latora 2014).
Network metrics were calculated using the R packages `igraph` (Csardi
and Nepusz 2006), `asnipe` (Farine 2019), `spatsoc` (Robitaille, Webber
and Vander Wal 2019) and `data.table` (Dowle and Srinivasan 2019).

## Varying scale in multilayer networks

### Social scale

We generated multilayer networks across a series of social distance
thresholds for group assignment. Social distance thresholds (5, 25, 50,
75, 100, 250 and 500 m) represented a range of visual (short distance)
to olfactory and long distance auditory sensory modalities of caribou.
Multilayer networks consisted of the social association between 21
individuals across three habitat layers (foraging, forest, and open) for
the entire study period. At the finest scale, individuals within 5 m of
one another were considered in the same group, whereas at the coarsest
scale, individuals within 500 m of one another were considered in the
same group. Increasing social distance threshold is a proxy for
potential behavioural interactions that occur across these distances.
For every social distance threshold, we calculated individual graph
strength within each habitat layer, and edge overlap and multidegree
across habitat layers.

### Spatial scale

To assess the influence of spatial scale, we aggregated the land cover
raster using the R package `grainchanger` (Graham 2019) across a series
of scales (100 - 1000 m by steps of 100 m). The land cover raster was
aggregated using a modal moving window method using a circular window
corresponding to the above scales (Graham et al. 2019). We assume 30 m
and 100 m represents fine-scale decision making for caribou during
foraging, while 500 - 1000 m represents the scale at which caribou tend
to select and avoid habitat (Bastille-Rousseau et al. 2018). Multilayer
networks consisted of the social associations between 21 individuals
across three habitat layers (foraging, forest and open) for the entire
study period. For each land cover resolution, we calculated individual
graph strength within each habitat layer, and edge overlap and
multidegree across habitat layers.

### Temporal scale

#### Time windows

We used a temporal multilayer network to assess the seasonality of
caribou sociality. Multilayer networks consisted of the social
associations between 21 individuals across 20 ordinal sample periods
from the entire study period. Social associations were defined by
spatiotemporal overlap of individuals within 5 minutes and 50 m. For
each time window, we calculated individual graph strength within each
time window, and edge overlap and multidegree across time windows.

#### Number of observations

Studies of social network analysis vary in the number and frequency of
observations as well as the data collection technique used to generate
networks, ranging from directly observed to remotely sensed (Davis,
Crofoot and Farine 2018; Webber and Vander Wal 2019). Remotely sensed
GPS data is commonly collected at a fixed rate, e.g. every \(x\) minutes
or hours, continuously throughout the study period. Fix rate is a
reflection of number of observations an individual would have been
observed and recorded in traditional ethological studies. To investigate
the influence of number of observations, we generated multilayer
networks of social association between 21 individuals across three
habitat layers (foraging, forest, and open) using \(n\) randomly
selected observations. We first generated a maximum of 1000 timesteps
and iteratively used \(n\) of these (\(n\) = 10 - 1000 observations by
steps of 10), to ensure previously included timesteps, and resulting
associations, were accumulated with subsequent observations to mimic
collection of observational data. Within each multilayer network with
\(n\) observations, we calculated individual graph strength and
multidegree. We calculated edge overlap across the entire series of
networks to determine proportion of total edges as number of
observations increased.

# Results

Individuals in multilayer networks became more connected as the social
distance threshold increased. Mean graph strength differed across
habitat layers with similar and higher graph strength in foraging and
open layers, and lower strength in forest layers (Figure
<a href="#fig:socres">2</a>). Individual graph strength increased
sharply between 5 m and 100 m in all three habitat classes followed by a
plateau in the rate of increase after 100 m (Figure
<a href="#fig:socres">2</a>). These results suggest the optimal social
scale at which groups should be assigned is between \~20 - 100 m based
on the rate at which variance in graph strength decreased. GPS data
allows (e.g. from this study and Peignier et al. 2019; Lesmerises,
Johnson and St-Laurent 2018) us to confirm the use of 50 m buffer that
has long been used for studies in the field (Clutton-Brock, Guinness and
Albon 1982; Lingle 2003).

Increasing land cover resolution resulted in decreased availability of
foraging habitat and corresponding low connectivity of individuals at
higher land cover resolutions. Edge overlap decreased sharply between 30
m and 600 m in foraging layers, afterwards remaining stable to 1000 m
(Figure <a href="#fig:lcres">3</a> D). In contrast, edge overlap was
relatively consistent across land cover resolutions in forest and open
layers (Figure <a href="#fig:lcres">3</a> D). Graph strength was more
variable within foraging habitat layers across land cover resolutions
than open and forest habitat layers (Figure <a href="#fig:lcres">3</a>
E). The proportion of relocations in forest (38.68% at 30 m - 50.27% at
1000 m) and open (37.39% at 30 m - 48.18% at 1000 m) habitats increased
with increasing spatial resolution, while decreasing in foraging habitat
(23.93% at 30 m - 1.55% at 1000 m). These results indicate the
importance of matching land cover resolution to scale of habitat
selection and choosing a land cover product with a resolution sufficient
to detect less common habitats.

The temporal multilayer network indicated within-year time windows where
social network metrics increased. Edge overlap was higher in time
windows 1, 6-11 and 15-20 than in time windows 2-5 and 12-15 (Figure
<a href="#fig:temp">4</a> A). Time windows of higher edge overlap,
between approximately October and June, also had higher graph strength
compared to time windows of lower edge overlap, between approximately
June and October (Figure <a href="#fig:temp">4</a> C). Graph strength
peaked across the time series between January 2018 and April 2018. These
results highlight the importance of carefully selecting the temporal
scale of analysis to effectively capture within- and across-year
variation in sociality.

As the number of observations used to generate multilayer networks
increased, individuals became more connected and variance in metrics
decreased. Edge overlap increased across all three habitat layers with
increasing number of observations (Figure <a href="#fig:nobs">5</a> B).
Similarly, multidegree for all individuals increased quickly between 10
and 100 observations, and continued to increase until 1000 observations
(Figure <a href="#fig:nobs">5</a> C). Graph strength across individuals
in all three habitat layers was highly variable at low number of
observations and variance decreased after \~100 observations (Figure
<a href="#fig:nobs">5</a> A). Since the variance in these multilayer
metrics decreases after a certain number of observations, this
sensitivity method could be useful for determining the number of
observations necessary for sufficiently describing social dynamics
across contexts.

An illustrative multilayer network was generated, informed by previous
social, spatial and temporal scale results (Figure
<a href="#fig:ml">6</a>). <!--The social 
distance threshold was 50 m. The spatial resolution of the land cover 
raster was 30 m. -->Relocations were predominantly in open (37.39%) and
forest (38.68%) habitats compared to foraging habitats (23.93%). Despite
this, individuals were more strongly connected in foraging and open
habitats than in forest (mean graph strength in habitat layers;
foraging: 0.21, forest: 0.11, open: 0.23). There was a seasonal
difference in association, individuals were more connected between
approximately October - June (mean graph strength in time windows; 2:
0.37, 4: 0.18) than between approximately June - October (mean graph
strength in time windows; 1: 0.04, 3: 0.03).

<!-- Figure: metrics by social scale -->

<!-- Figure: metrics by land cover resolution -->

<!-- Figure: metrics by number of observations -->

<!-- Figure: Time window -->

<!-- Figure: Fogo ML Net -->

# Discussion

Animal social systems are characterized and influenced by scale. Three
types of scale to consider are social, spatial, and temporal scale.
Social scale defines the type and measurement of social relationships
and directly impacts observed social connectivity between individuals.
Spatial scale can reflect the resolution of the habitat within which
social interactions occur. Finally, temporal scale is related to both
study design and seasonal differences in social processes. By
partitioning social associations into discrete contexts using multilayer
networks, we highlight the influence of social, spatial and temporal
scales on animal social systems, demonstrating the importance of
considering biologically relevant and robust scales.

Social scale is an essential consideration for social network analysis
(Castles et al. 2014; Carter, Lee and Marshall 2015; Farine 2015). For
example, networks can be constructed based on fine-scale social
interactions (e.g. grooming or aggression), social associations
(e.g. group membership or proximity), or spatial or home range overlap.
Here, we define social associations using a series of social distance
thresholds to generate proximity-based social networks. Across network
layers, increasing the social distance threshold resulted in an increase
in graph strength (Figure <a href="#fig:socres">2</a>). Specifically,
the strength of social associations across habitat layers, with open and
foraging habitats demonstrating a more pronounced increase in graph
strength as well as greater variation across individuals. These results
emphasize that multilayer network metrics are directly influenced by
social scale. An extension of this analysis could be to incorporate
behavioural states to explore the influence of social scale on patterns
of association or interaction across habitat and behavioural layers
(e.g. using focal observations or hidden Markov Models see Muller et al.
2018; Jones et al. 2020).

Habitat selection, the use of available resources or landscape features
by animals (Manly, McDonald and Thomas 1993; Boyce and McDonald 1999),
is a scale-dependent process (Mayor et al. 2009). Social structure and
habitat selection are intimately related and individuals must share
space to interact (Webber and Vander Wal 2018). We found edge overlap
was stable in open and forest layers but decreasing in foraging layers
with increasing spatial scale (Figure <a href="#fig:lcres">3</a> D).
Graph strength had greater individual variation in open and foraging
layers than in forest layers (Figure <a href="#fig:lcres">3</a> E). We
observed a decrease in the proportion of relocations in foraging habitat
with increasing spatial resolution (23.93% at 30 m - 1.55% at 1000 m).
As the foraging layer had similar edge overlap and graph strength as the
open layer at 30 m spatial resolution despite having lower abundance on
the landscape (foraging: 12.8%, open: 36.9%), this highlights the
importance of considering spatial scale when including habitat in
multilayer networks. Johnson (1980) identified four orders of habitat
selection: (1) the geographical range of a species, (2) the home range
of an individual, the (3) habitat patches within the home range and (4)
specific resources within a habitat patch. Kie et al. (2002) found that,
independently, third order of selection was insufficient for capturing
landscape attributes selected for by mule deer (*Odocoileus hemionus*),
at a scale larger than their home range size. Scales of habitat
selection could be relevant for multilayer networks and our integration
of habitat within a multilayer context could be an important first step
(see Figure <a href="#fig:lcres">3</a>). Specifically, if individuals
select habitats at the home range scale, it may be relevant to assess
social structure using home range overlap. By contrast, in cases where
individuals select habitats at the patch-scale, fine-scale measures of
sociality may be more relevant. Moving past this hierarchical
perspective, Mayor et al. (2007) emphasized the importance of
considering a broad continuum of scales to reveal scale-dependent
selection and avoid the bias of predefined scales assumed to be
associated with certain behaviours.

The emergent relationship between habitat and sociality has been
explored by the temporal distribution and phenology of resources and use
of social information. We found increased edge overlap and graph
strength in fall, winter and spring (approximately October - June) than
in summer (approximately June - October) (Figure
<a href="#fig:temp">4</a> A, C). These periods of increased sociality
correspond to seasons of heterogeneous resource availability
\[Peigner\_2019\]. This analysis could be extended using time-aggregated
networks and a moving-window approach to time window size and sampling
effort (Farine 2017; Bonnell and Vilette 2020). By explicitly
considering the temporal context of social interactions in separate
layers, multilayer networks provide a detailed and dynamic perspective
of animal social networks. For example, female mandrill (*Mandrillus
sphinx*) sociality is more completely represented by temporal multilayer
networks than aggregated networks (Pereira et al. 2020). Evans et
al. (2020) observed seasonal differences in the social structure of
mice (*Mus musculus domesticus*) related to temperature and breeding
activity. Finally, it is crucial to include sufficient data within
sampling periods or time windows to construct robust networks \[Farine
(2017); Proskurnikov\_2017\]. With increasing number of observations, we
found variance decreased in edge overlap and multidegree across habitat
layers as well as in graph strength within habitat layers (Figure
<a href="#fig:nobs">5</a>). As more observations were added, rarer
relationships were recorded demonstrating the value of this form of
sensitivity analysis.

Recognition of scale as a fundamental concept in ecology (Levin 1992)
has lead to an increased attention to the scale at which ecological
processes are observed (Schneider 2001; Chave 2013). Recent
technological advances in remotely sensed imagery (Drusch et al. 2012)
and animal tracking devices (Wikelski et al. 2007; Börger 2016; Börger
et al. 2020) have increased the availability of complex, high resolution
data. We highlight ways in which scale should be considered when
building social networks from both observed and remotely-sensed data.
Our multilayer network analysis of caribou sociality incorporating high
resolution GPS telemetry data and spatial land cover data is grounded in
the context of observed animal behaviour as the scales we chose to
explore, e.g., number of observations and sociality across space and
time, are ones that have also traditionally been done in ethology.

Multilayer networks remain a nascent but powerful tool in animal
behavioural ecology and we introduce concepts of scale within the
existing multilayer framework. Silk et al. (2018) summarized some key
multilayer questions in animal behaviour research and based on our case
study of scale in the context of multilayer networks, we conclude by
posing an additional set of questions on the future of multilayer
networks through the lens of scale and behavioural, landscape, and
spatial ecology:

1.  How do social phenotypes vary across social, spatial, and temporal
    scales and at which scale might these influence fitness? Are some
    scales better predictors for different fitness metrics?

2.  Why do individuals associate more strongly with certain conspecifics
    in some habitats? What, if any, is the role of movement in the
    context of habitat networks?

3.  How, and why, does the spatial scale of perception influence,
    e.g. auditory, visual, or chemotaxis, influence the social
    environment? What is the role of memory, and by extension social and
    spatial cognition, as animals navigate their environment and make
    decisions about where to move next?

We show that multilayer social networks are (1) scale-dependent, and (2)
useful for identifying spatially or temporally specific social
associations. When employing multilayer networks, it is critical to
consider a broad continuum of social, spatial and temporal scales to
fully capture ecological processes and to establish a clear link between
biologically relevant scales of observation.

# Box 1

<!-- Finally, due to the autocorrelated nature of biologging data it is -->

<!-- essential to ensure social association data area non-randomly distributed -->

<!-- [@Farine_2017b]. -->

<!-- TODO include mov elsewhere 
Social processes, movement decisions, and space use are inextricably linked and
multilayer networks represent a potential analytical framework for linking these
processes [@Mourier_2019]. 

Integrating habitat-specific
movement layers could further illuminate the role of movement as a driver of the
social and spatial environments an individual experiences [@Webber_2018]. 
-->

Social phenotype has been increasingly linked to individual fitness,
including in primates (Brent, Ruiz-Lambides and Platt 2017; Thompson
2019), dolphins (Stanton, Gibson and Mann 2011; Stanton and Mann 2012),
and birds (McDonald 2007; Royle et al. 2012). Social and temporal scales
have emerged as important variables for understanding the fitness
consequences of social network position (Holekamp et al. 2011; Berger et
al. 2015; Almeling et al. 2016; Brent, Ruiz-Lambides and Platt 2017).

Varying social scales can have different fitness repercussions for
individuals. Rhesus macaques (*Macaca mulatta*) had higher survivorship
when they had fewer but stronger and more stable social associates and
grooming partners rather than simply more associates (Ellis et al.
2019). It is a common trope that individuals must be associating to
interact, and many studies assume that proximity is proxy for
interacting (Farine 2015). For instance, baboons must be within
proximity of each other for grooming yet other animals interact using
communication such as long-distance vocalization or olfactory signals
(Carter, Lee and Marshall 2015). It is possible to record social
interactions that do not require proximity using, for example,
microphone arrays to construct long-distance communication networks
(Snijders and Naguib 2017).

Multilayer networks enable researchers to look at similarities and
differences between discrete temporal windows. Changing social
phenotypes over ontogeny can affect fitness (Berger et al. 2015; Brent,
Ruiz-Lambides and Platt 2017). Individuals progress through development
at different rates (Tarka et al. 2018) and this variation can complicate
the selection of time windows. Considering fine temporal scales provides
insight across developmental stages that may otherwise be missed (Turner
et al. 2020). Thus, it is critical to carefully consider the effect of
scale on the relationship between an individual’s social network
position and fitness using a temporal scale based on the hypotheses
being tested and logistical constraints.

# Acknowledgements

We thank all members of the Wildlife Evolutionary Ecology Lab, including
J. Hendrix, K. Kingdon, S. Boyle, J. Balluffi-Fry, C. Prokopenko, I.
Richmond, J. Hogg, and L. Newediuk for their comments on previous
versions of this manuscript as well as D. C. Schneider for inspiration
and helpful discussions about scale. Funding for this study was provided
by a Vanier Canada Graduate Scholarship to QMRW and a NSERC Discovery
Grant to EVW.

<div class="figure">

<img src="../graphics/figure-scales.png" alt="Space-time diagram representing variation the relative spatial and temporal extent required for different types of social and communication processes for four species, including spotted hyaena, passerine birds, sleepy lizards, and elephants. Spatial and temporal extent for social interactions, e.g. mating, grooming, or aggression, are similar for most species because physical contact between two individuals is required for many social interactions. The logical extension is that spatial and temporal extent for social interaction is hierarchically nested within the spatial and temporal extent for social association because individuals must share space to interact. By contrast, different species have potential for greater spatial and temporal extents, for example, temporal extent for vocal communication is similar for most species because most vocal calls only persist in the environment for seconds, but spatial extent for vocal communication is highly variable with elephant calls extending the great distance and passerine calls extending the shortest distance." width="\linewidth" />

<p class="caption">

Figure 1: Space-time diagram representing variation the relative spatial
and temporal extent required for different types of social and
communication processes for four species, including spotted hyaena,
passerine birds, sleepy lizards, and elephants. Spatial and temporal
extent for social interactions, e.g. mating, grooming, or aggression,
are similar for most species because physical contact between two
individuals is required for many social interactions. The logical
extension is that spatial and temporal extent for social interaction is
hierarchically nested within the spatial and temporal extent for social
association because individuals must share space to interact. By
contrast, different species have potential for greater spatial and
temporal extents, for example, temporal extent for vocal communication
is similar for most species because most vocal calls only persist in the
environment for seconds, but spatial extent for vocal communication is
highly variable with elephant calls extending the great distance and
passerine calls extending the shortest distance.

</p>

</div>

<div class="figure">

<img src="../graphics/figure-soc.png" alt="Varying scale in social distance threshold. For each social distance threshold (100 - 1000 m by steps of 100 m), multilayer networks were constructed of caribou social associations (n = 21 females) on Fogo Island, Newfoundland between 2017-04-21 and 2019-03-27 within three habitat layers (foraging, forest, and open). Graph strength (mean of individuals in bold) showed a sharp increase between 5 m and 100 m for all habitat classes. After 100 m, graph strength continued to increase at a slower rate. Foraging and open layers showed higher variation in graph strength between individuals while forest layers had less variation and lower mean graph strength." width="\linewidth" />

<p class="caption">

Figure 2: Varying scale in social distance threshold. For each social
distance threshold (100 - 1000 m by steps of 100 m), multilayer networks
were constructed of caribou social associations (n = 21 females) on Fogo
Island, Newfoundland between 2017-04-21 and 2019-03-27 within three
habitat layers (foraging, forest, and open). Graph strength (mean of
individuals in bold) showed a sharp increase between 5 m and 100 m for
all habitat classes. After 100 m, graph strength continued to increase
at a slower rate. Foraging and open layers showed higher variation in
graph strength between individuals while forest layers had less
variation and lower mean graph strength.

</p>

</div>

<div class="figure">

<img src="../graphics/figure-lc.png" alt="Varying spatial scale of land cover raster. For each land cover resolution (5, 25, 50, 75, 100, 250 and 500 m), multilayer networks were constructed of caribou social associations (n = 21 females) on Fogo Island, Newfoundland between 2017-04-21 and 2019-03-27 within three habitat layers (foraging, forest, and open). A, B, C) Three land cover rasters: the original resolution (30 m) and two aggregated rasters (500 m and 1000 m). D) Edge overlap of habitat layers across spatial resolutions. Open and forest layers show consistent edge overlap with increasing spatial resolution while foraging shows a sharp decline in edge overlap between 30 m and 600 m. Above 600 m, edge overlap in foraging layers is stable. E) Graph strength (mean of individuals in bold) within habitat layers across spatial resolution. Foraging layers showed high variation in graph strength with many individuals dropping to 0 after 500 m and others increasing with spatial resolution. Open layers and forest layers were relatively stable across spatial resolutions, with higher mean graph strength in open compared to forest layers." width="\linewidth" />

<p class="caption">

Figure 3: Varying spatial scale of land cover raster. For each land
cover resolution (5, 25, 50, 75, 100, 250 and 500 m), multilayer
networks were constructed of caribou social associations (n = 21
females) on Fogo Island, Newfoundland between 2017-04-21 and 2019-03-27
within three habitat layers (foraging, forest, and open). A, B, C) Three
land cover rasters: the original resolution (30 m) and two aggregated
rasters (500 m and 1000 m). D) Edge overlap of habitat layers across
spatial resolutions. Open and forest layers show consistent edge overlap
with increasing spatial resolution while foraging shows a sharp decline
in edge overlap between 30 m and 600 m. Above 600 m, edge overlap in
foraging layers is stable. E) Graph strength (mean of individuals in
bold) within habitat layers across spatial resolution. Foraging layers
showed high variation in graph strength with many individuals dropping
to 0 after 500 m and others increasing with spatial resolution. Open
layers and forest layers were relatively stable across spatial
resolutions, with higher mean graph strength in open compared to forest
layers.

</p>

</div>

<div class="figure">

<img src="../graphics/figure-temp.png" alt="Varying temporal scale in multilayer networks. Multilayer networks were generated of caribou social associations (n = 21 females) on Fogo Island, Newfoundland within time windows (20 ordinal sample periods of 35-36 days) between 2017-04-21 and 2019-03-27. A) Edge overlap across time windows showed two periods of low overlap (time windows 2-5 and 12-15), and three periods of high overlap (time windows 1, 6-11, 15-20). B) Ordinal network layers showing unweighted edges between individuals within time windows. Like edge overlap, individuals were more connected in time windows 1, 6-11, and 15-20, compared to 2-5 and 12-15. Number of individuals in each time window is reported below each layer. C) Graph strength within time windows showing individuals as thin grey lines and mean across individuals as thick black lines. Graph strength peaked in time window 9, with noticeable higher strength than the following year." width="\linewidth" />

<p class="caption">

Figure 4: Varying temporal scale in multilayer networks. Multilayer
networks were generated of caribou social associations (n = 21 females)
on Fogo Island, Newfoundland within time windows (20 ordinal sample
periods of 35-36 days) between 2017-04-21 and 2019-03-27. A) Edge
overlap across time windows showed two periods of low overlap (time
windows 2-5 and 12-15), and three periods of high overlap (time windows
1, 6-11, 15-20). B) Ordinal network layers showing unweighted edges
between individuals within time windows. Like edge overlap, individuals
were more connected in time windows 1, 6-11, and 15-20, compared to 2-5
and 12-15. Number of individuals in each time window is reported below
each layer. C) Graph strength within time windows showing individuals as
thin grey lines and mean across individuals as thick black lines. Graph
strength peaked in time window 9, with noticeable higher strength than
the following year.

</p>

</div>

<div class="figure">

<img src="../graphics/figure-nobs.png" alt="Varying scale in number of observations. Multilayer networks were generated using a subset of observations (10 - 1000 observations by steps of 10) of caribou social associations (n = 21 females) on Fogo Island, Newfoundland between 2017-04-21 and 2019-03-27 within three habitat layers (foraging, forest, and open). A) Edge overlap increased for all habitat layers with increasing number of observations. Foraging and open layers had higher edge overlap than forest layers. B) Graph strength was highly variable at low number of observations (less than 100) for all habitat layers and relatively stable after ~200 observations. C) Multidegree increased for all individuals with increasing number of observations. Individuals showed high variability (2 - 51) at the maximal number of observations (1000)." width="\linewidth" />

<p class="caption">

Figure 5: Varying scale in number of observations. Multilayer networks
were generated using a subset of observations (10 - 1000 observations by
steps of 10) of caribou social associations (n = 21 females) on Fogo
Island, Newfoundland between 2017-04-21 and 2019-03-27 within three
habitat layers (foraging, forest, and open). A) Edge overlap increased
for all habitat layers with increasing number of observations. Foraging
and open layers had higher edge overlap than forest layers. B) Graph
strength was highly variable at low number of observations (less than
100) for all habitat layers and relatively stable after \~200
observations. C) Multidegree increased for all individuals with
increasing number of observations. Individuals showed high variability
(2 - 51) at the maximal number of observations (1000).

</p>

</div>

<div class="figure">

<img src="../graphics/figure-fogo-ml.png" alt="Multilayer network representing social association of caribou on Fogo Island, Newfoundland between May 2017 and February 2019. Individual caribou (n = 21 females) are represented as nodes in a constant location in layers they were observed. Twelve layers represent combinations of four time windows and three habitat classes (foraging, forest, and open) informed by previous social, spatial and temporal scale analyses. Intralayer edges represent association between individuals and line thickness is scaled by strength of association (SRI)." width="\linewidth" />

<p class="caption">

Figure 6: Multilayer network representing social association of caribou
on Fogo Island, Newfoundland between May 2017 and February 2019.
Individual caribou (n = 21 females) are represented as nodes in a
constant location in layers they were observed. Twelve layers represent
combinations of four time windows and three habitat classes (foraging,
forest, and open) informed by previous social, spatial and temporal
scale analyses. Intralayer edges represent association between
individuals and line thickness is scaled by strength of association
(SRI).

</p>

</div>

# References

<div id="refs" class="references hanging-indent">

<div id="ref-Allen_2015">

Allen TFH, Hoekstra TW. *Toward a Unified Ecology*. Columbia University
Press, 2015.

</div>

<div id="ref-Almeling_2016">

Almeling L, Hammerschmidt K, Sennhenn-Reulen H, Freund AM, Fischer J.
Motivational shifts in aging monkeys and the origins of social
selectivity. *Current Biology* 2016;**26**:1744–9.

</div>

<div id="ref-Bastille_2018">

Bastille-Rousseau G, Murray DL, Schaefer JA, Lewis MA, Mahoney SP, Potts
JR. Spatial scales of habitat selection decisions: Implications for
telemetry-based movement modelling. *Ecography* 2018;**41**:437–43.

</div>

<div id="ref-Battiston_2014">

Battiston F, Nicosia V, Latora V. Structural measures for multiplex
networks. *Physical Review E* 2014;**89**:032804.

</div>

<div id="ref-Berger_2015">

Berger V, Lemaître J-F, Allainé D, Gaillard J-M, Cohas A. Early and
adult social environments have independent effects on individual fitness
in a social vertebrate. *Proceedings of the Royal Society B: Biological
Sciences* 2015;**282**:20151167.

</div>

<div id="ref-Bergerud_1974">

Bergerud AT. Relative abundance of food in winter for newfoundland
caribou. *Oikos* 1974;**25**:379.

</div>

<div id="ref-Berlingerio_2012">

Berlingerio M, Coscia M, Giannotti F, Monreale A, Pedreschi D.
Multidimensional networks: Foundations of structural analysis. *World
Wide Web* 2012;**16**:567–93.

</div>

<div id="ref-Bjorneraas_2010">

Bjørneraas K, Moorter B, Rolandsen CM, Herfindal I. Screening global
positioning system location data for errors using animal movement
characteristics. *The Journal of Wildlife Management*
2010;**74**:1361–6.

</div>

<div id="ref-Bonnell_2020">

Bonnell TR, Vilette C. Constructing and analysing time-aggregated
networks: The role of bootstrapping, permutation and simulation.
*Methods in Ecology and Evolution* 2020.

</div>

<div id="ref-B_rger_2016">

Börger L. Editorial: Stuck in motion? Reconnecting questions and tools
in movement ecology. *Journal of Animal Ecology* 2016;**85**:5–10.

</div>

<div id="ref-Borger_2020">

Börger L, Bijleveld AI, Fayet AL, Machovsky-Capuska GE, Patrick SC,
Street GM, Vander Wal E. Biologging special feature. *Journal of Animal
Ecology* 2020;**89**:6–15.

</div>

<div id="ref-Boyce_1999">

Boyce MS, McDonald LL. Relating populations to habitats using resource
selection functions. *Trends in Ecology & Evolution* 1999;**14**:268–72.

</div>

<div id="ref-Brent_2017">

Brent LJN, Ruiz-Lambides A, Platt ML. Family network size and survival
across the lifespan of female macaques. *Proceedings of the Royal
Society B: Biological Sciences* 2017;**284**:20170515.

</div>

<div id="ref-Cairns_1987">

Cairns SJ, Schwager SJ. A comparison of association indices. *Animal
Behaviour* 1987;**35**:1454–69.

</div>

<div id="ref-Carter_2015">

Carter AJ, Lee AEG, Marshall HH. Research questions should drive edge
definitions in social network studies. *Animal Behaviour*
2015;**104**:e7–e11.

</div>

<div id="ref-Castles_2014">

Castles M, Heinsohn R, Marshall HH, Lee AEG, Cowlishaw G, Carter AJ.
Social networks created with different techniques are not comparable.
*Animal Behaviour* 2014;**96**:59–67.

</div>

<div id="ref-Chave_2013">

Chave J. The problem of pattern and scale in ecology: What have we
learned in 20 years? *Ecology Letters* 2013;**16**:4–16.

</div>

<div id="ref-Clutton_1982">

Clutton-Brock TH, Guinness FE, Albon SD. *Red Deer: Behavior and Ecology
of Two Sexes*. University of Chicago press, 1982.

</div>

<div id="ref-Croft_2008">

Croft DP, James R, Krause J. *Exploring Animal Social Networks*.
Princeton University Press, 2008.

</div>

<div id="ref-Croft_2011">

Croft DP, Madden JR, Franks DW, James R. Hypothesis testing in animal
social networks. *Trends in Ecology & Evolution* 2011;**26**:502–7.

</div>

<div id="ref-Csardi_2006">

Csardi G, Nepusz T. The igraph software package for complex network
research. *InterJournal* 2006;**Complex Systems**:1695.

</div>

<div id="ref-Davis_2018">

Davis GH, Crofoot MC, Farine DR. Estimating the robustness and
uncertainty of animal social networks using different observational
methods. *Animal Behaviour* 2018;**141**:29–44.

</div>

<div id="ref-Dowle_2019">

Dowle M, Srinivasan A. *Data.table: Extension of ‘Data.frame‘*., 2019.

</div>

<div id="ref-Drusch_2012">

Drusch M, Bello UD, Carlier S et al. Sentinel-2: ESA’s optical
high-resolution mission for gmes operational services. *Remote Sensing
of Environment* 2012;**120**:25–36.

</div>

<div id="ref-Elith_2009">

Elith J, Leathwick JR. Species distribution models: Ecological
explanation and prediction across space and time. *Annual Review of
Ecology, Evolution, and Systematics* 2009;**40**:677–97.

</div>

<div id="ref-Ellis_2019">

Ellis S, Snyder-Mackler N, Ruiz-Lambides A, Platt ML, Brent LJN.
Deconstructing sociality: The types of social connections that predict
longevity in a group-living primate. *Proceedings of the Royal Society
B: Biological Sciences* 2019;**286**:20191991.

</div>

<div id="ref-Evans_2020">

Evans JC, Lindholm AK, König B. Long-term overlap of social and genetic
structure in free-ranging house mice reveals dynamic seasonal and group
size effects. *Current Zoology* 2020.

</div>

<div id="ref-Farine_2015a">

Farine DR. Proximity as a proxy for interactions: Issues of scale in
social network analysis. *Animal Behaviour* 2015;**104**:e1–5.

</div>

<div id="ref-Farine_2017">

Farine DR. When to choose dynamic vs. Static social network analysis.
*Journal of Animal Ecology* 2017;**87**:128–38.

</div>

<div id="ref-Farine_2019">

Farine DR. *Asnipe: Animal Social Network Inference and Permutations for
Ecologists*., 2019.

</div>

<div id="ref-Farine_2015">

Farine DR, Whitehead H. Constructing, conducting and interpreting animal
social network analysis. *Journal of Animal Ecology*
2015;**84**:1144–63.

</div>

<div id="ref-Field_2009">

Field R, Hawkins BA, Cornell HV et al. Spatial species-richness
gradients across scales: A meta-analysis. *Journal of Biogeography*
2009;**36**:132–47.

</div>

<div id="ref-Finn_2019">

Finn KR, Silk MJ, Porter MA, Pinter-Wollman N. The use of multilayer
network analysis in animal behaviour. *Animal Behaviour*
2019;**149**:7–22.

</div>

<div id="ref-Franks_2009">

Franks DW, Ruxton GD, James R. Sampling animal association networks with
the gambit of the group. *Behavioral Ecology and Sociobiology*
2009;**64**:493–503.

</div>

<div id="ref-Graham_2019">

Graham L. *Grainchanger: Moving-Window and Direct Data Aggregation*.,
2019.

</div>

<div id="ref-Graham_2019a">

Graham LJ, Spake R, Gillings S, Watts K, Eigenbrod F. Incorporating
fine-scale environmental heterogeneity into broad-extent models.
*Methods in Ecology and Evolution* 2019;**10**:767–78.

</div>

<div id="ref-Hijmans_2019">

Hijmans RJ. *Raster: Geographic Data Analysis and Modeling*., 2019.

</div>

<div id="ref-Holekamp_2011">

Holekamp KE, Smith JE, Strelioff CC, Horn RCV, Watts HE. Society,
demography and genetic structure in the spotted hyena. *Molecular
Ecology* 2011;**21**:613–32.

</div>

<div id="ref-Integrated_2013">

Integrated Informatics Inc. *Sustainable Development & Strategic Science
Branch Land Cover Classifcation.* St. John’s, NL: Sustainable
Development; Strategic Science, Government of Newfoundland; Labrador

</div>

<div id="ref-Johnson_1980">

Johnson DH. The comparison of usage and availability measurements for
evaluating resource preference. *Ecology* 1980;**61**:65–71.

</div>

<div id="ref-Jones_2020">

Jones TB, Green JA, Patrick SC, Evans JC, Wells MR, Rodríguez-Malagón
MA, Arnould JPY. Consistent sociality but flexible social associations
across temporal and spatial foraging contexts in a colonial breeder.
*Ecology Letters* 2020;**23**:1085–96.

</div>

<div id="ref-Kie_2002">

Kie JG, Bowyer RT, Nicholson MC, Boroski BB, Loft ER. Landscape
heterogeneity at differing scales: Effects on spatial distribution of
mule deer. *Ecology* 2002;**83**:530–44.

</div>

<div id="ref-Kivela_2014">

Kivela M, Arenas A, Barthelemy M, Gleeson JP, Moreno Y, Porter MA.
Multilayer networks. *Journal of Complex Networks* 2014;**2**:203–71.

</div>

<div id="ref-Krause_2009">

Krause J, Lusseau D, James R. Animal social networks: An introduction.
*Behavioral Ecology and Sociobiology* 2009;**63**:967–73.

</div>

<div id="ref-Kurvers_2014">

Kurvers RHJM, Krause J, Croft DP, Wilson ADM, Wolf M. The evolutionary
and ecological consequences of animal social networks: Emerging issues.
*Trends in Ecology & Evolution* 2014;**29**:326–35.

</div>

<div id="ref-Legendre_1993">

Legendre P. Spatial autocorrelation: Trouble or new paradigm? *Ecology*
1993;**74**:1659–73.

</div>

<div id="ref-Lesmerises_2018">

Lesmerises F, Johnson CJ, St-Laurent M-H. Landscape knowledge is an
important driver of the fission dynamics of an alpine ungulate. *Animal
Behaviour* 2018;**140**:39–47.

</div>

<div id="ref-Levin_1992">

Levin SA. The problem of pattern and scale in ecology: The robert h.
MacArthur award lecture. *Ecology* 1992;**73**:1943–67.

</div>

<div id="ref-Lingle_2003">

Lingle S. Group composition and cohesion in sympatric white-tailed deer
and mule deer. *Canadian Journal of Zoology* 2003;**81**:1119–30.

</div>

<div id="ref-Luther_2009">

Luther D. The influence of the acoustic community on songs of birds in a
neotropical rain forest. *Behavioral Ecology* 2009;**20**:864–71.

</div>

<div id="ref-Manly_1993">

Manly BFJ, McDonald LL, Thomas DL. *Resource Selection by Animals*.
Springer Netherlands, 1993.

</div>

<div id="ref-Mayor_2007">

Mayor SJ, Schaefer JA, Schneider DC, Mahoney SP. Spectrum of selection:
New approaches to detecting the scale-dependent response to habitat.
*Ecology* 2007;**88**:1634–40.

</div>

<div id="ref-Mayor_2009">

Mayor SJ, Schneider DC, Schaefer JA, Mahoney SP. Habitat selection at
multiple scales. *Écoscience* 2009;**16**:238–47.

</div>

<div id="ref-McDonald_2007">

McDonald DB. Predicting fate from early connectivity in a social
network. *Proceedings of the National Academy of Sciences*
2007;**104**:10910–4.

</div>

<div id="ref-Muller_2018">

Muller Z, Cantor M, Cuthill IC, Harris S. Giraffe social preferences are
context dependent. *Animal Behaviour* 2018;**146**:37–49.

</div>

<div id="ref-Peignier_2019">

Peignier M, Webber QMR, Koen EL, Laforge MP, Robitaille AL, Vander Wal
E. Space use and social association in a gregarious ungulate: Testing
the conspecific attraction and resource dispersion hypotheses. *Ecology
and Evolution* 2019;**9**:5133–45.

</div>

<div id="ref-Pereira_2020">

Pereira AS, Rebelo ID, Casanova C, Lee PC, Louca V. The
multidimensionality of female mandrill sociality—a dynamic multiplex
network approach. *PloS one* 2020;**15**:e0230942.

</div>

<div id="ref-Pilosof_2017">

Pilosof S, Porter MA, Pascual M, K’efi S. The multilayer nature of
ecological networks. *Nature Ecology & Evolution* 2017;**1**, DOI:
[10.1038/s41559-017-0101](https://doi.org/10.1038/s41559-017-0101).

</div>

<div id="ref-Pinter_Wollman_2013">

Pinter-Wollman N, Hobson EA, Smith JE et al. The dynamics of animal
social networks: Analytical, conceptual, and theoretical advances.
*Behavioral Ecology* 2013;**25**:242–55.

</div>

<div id="ref-Piza_Roca_2018">

Piza-Roca C, Strickland K, Schoeman D, Frere CH. Eastern water dragons
modify their social tactics with respect to the location within their
home range. *Animal Behaviour* 2018;**144**:27–36.

</div>

<div id="ref-Porter_2018">

Porter MA. What is... A multilayer network? *Notices of the American
Mathematical Society* 2018;**65**:1.

</div>

<div id="ref-R_Core_Team">

R Core Team. *R: A Language and Environment for Statistical Computing*.
Vienna, Austria: R Foundation for Statistical Computing, 2020.

</div>

<div id="ref-Robitaille_2019">

Robitaille AL, Webber QMR, Vander Wal E. Conducting social network
analysis with animal telemetry data: Applications and methods using
spatsoc. *Methods in Ecology and Evolution* 2019;**10**:1203–11.

</div>

<div id="ref-Royle_2012">

Royle NJ, Pike TW, Heeb P, Richner H, Kölliker M. Offspring social
network structure predicts fitness in families. *Proceedings of the
Royal Society B: Biological Sciences* 2012;**279**:4914–22.

</div>

<div id="ref-Schaefer_2013">

Schaefer JA, Mahoney SP. Spatial dynamics of the rise and fall of
caribou (rangifer tarandus) in Newfoundland. *Canadian Journal of
Zoology* 2013;**91**:767–74.

</div>

<div id="ref-Schneider_2001">

Schneider DC. The rise of the concept of scale in ecology. *BioScience*
2001;**51**:545.

</div>

<div id="ref-Silk_2018">

Silk MJ, Finn KR, Porter MA, Pinter-Wollman N. Can multilayer networks
advance animal behavior research? *Trends in Ecology & Evolution*
2018;**33**:376–8.

</div>

<div id="ref-Snijders_2017">

Snijders L, Naguib M. Communication in animal social networks. In.
*Advances in the Study of Behavior*. Elsevier, 2017, 297–359.

</div>

<div id="ref-Stanton_2011">

Stanton MA, Gibson QA, Mann J. When mum’s away: A study of mother and
calf ego networks during separations in wild bottlenose dolphins
(tursiops sp.). *Animal Behaviour* 2011;**82**:405–12.

</div>

<div id="ref-Stanton_2012">

Stanton MA, Mann J. Early social networks predict survival in wild
bottlenose dolphins. *PLoS ONE* 2012;**7**:e47508.

</div>

<div id="ref-Sugihara_1989">

Sugihara G, Schoenly K, Trombla A. Scale invariance in food web
properties. *Science* 1989;**245**:48–52.

</div>

<div id="ref-Tarka_2018">

Tarka M, Guenther A, Niemelä PT, Nakagawa S, Noble DWA. Sex differences
in life history, behavior, and physiology along a slow-fast continuum: A
meta-analysis. *Behavioral Ecology and Sociobiology* 2018;**72**, DOI:
[10.1007/s00265-018-2534-2](https://doi.org/10.1007/s00265-018-2534-2).

</div>

<div id="ref-Thompson_2019">

Thompson NA. Understanding the links between social ties and fitness
over the life cycle in primates. *Behaviour* 2019;**156**:859–908.

</div>

<div id="ref-Turner_2020">

Turner JW, Robitaille AL, Bills PS, Holekamp KE. Early life
relationships matter: Social position during early life predicts fitness
among female spotted hyenas. *Journal of Animal Ecology* 2020.

</div>

<div id="ref-Vander_2014">

Vander Wal E, Laforge MP, McLoughlin PD. Density dependence in social
behaviour: Home range overlap and density interacts to affect
conspecific encounter rates in a gregarious ungulate. *Behavioral
Ecology and Sociobiology* 2014;**68**:383–90.

</div>

<div id="ref-Webber_2018">

Webber QMR, Vander Wal E. An evolutionary framework outlining the
integration of individual social and spatial ecology. *Journal of Animal
Ecology* 2018;**87**:113–27.

</div>

<div id="ref-Webber_2019">

Webber QMR, Vander Wal E. Trends and perspectives on the use of animal
social network analysis in behavioural ecology: A bibliometric approach.
*Animal Behaviour* 2019;**149**:77–87.

</div>

<div id="ref-Wey_2008">

Wey T, Blumstein DT, Shen W, Jord’an F. Social network analysis of
animal behaviour: A promising tool for the study of sociality. *Animal
Behaviour* 2008;**75**:333–44.

</div>

<div id="ref-Whitehead_2008">

Whitehead H. *Analyzing Animal Societies: Quantitative Methods for
Vertebrate Social Analysis*. University of Chicago Press, 2008.

</div>

<div id="ref-Wikelski_2007">

Wikelski M, Kays RW, Kasdin NJ, Thorup K, Smith JA, Swenson GW. Going
wild: What a global small-animal tracking system could do for
experimental biologists. *Journal of Experimental Biology*
2007;**210**:181–6.

</div>

</div>
