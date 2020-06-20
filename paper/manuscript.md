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

Scale remains a foundational concept in ecology. Spatial scale, for
instance, has become a central consideration in the way we understand
landscape ecology and animal space use. Meanwhile, social processes can
also scale from fine-scale interactions to co-occurrence to overlapping
home ranges and vary within and across seasons. Multilayer networks
promise the integration of monolayer animal social networks with the
complexity and importance of animal space use and movement in
heterogeneous landscapes. Despite the complex interplay between social
networks and animal space use, there remains an important biological and
methodological gap in our understanding of an animal’s perception of
scale. Here we discuss the role of scale in the context of multilayer
networks and provide a social ungulate case study to illustrate the role
of social, spatial, and temporal scale on multilayer processes.
<!--We also present perspectives on
future development and applications of scale in multilayer networks with respect
to: phenotypes and individual fitness, movement ecology and collective movement,
and habitat selection and space use.--> Effective integration of social
and spatial processes, including biologically meaningful scales, within
the context of animal social networks is an emerging area of research.
Here, we incorporate perspectives on how the social environment and
spatial processes are linked across scales in a multilayer context.

## Keywords

Social network analysis, Landscape ecology, Movement ecology, Space use

# Introduction

Our inference regarding the processes underlying ecological patterns are
directly linked to the scale at which they are observed (Levin 1992;
Allen and Hoekstra 2015). Animals are influenced across scales, through
ecological processes such as species-specific trophic interactions,
resource availability (Legendre 1993; Chave 2013), and global climate
and productivity (Field et al. 2009).
<!-- JWT: I'm not sure exactly what that sentence was trying to say so my edits may not work -->
Multiscale ecology has been integrated into species distribution
modelling (Elith and Leathwick 2009), habitat selection (Mayor et al.
2007), and food webs (Sugihara, Schoenly and Trombla 1989), among other
processes. Meanwhile, in the context of animal behaviour, certain
behaviours are scale-dependent; for example, acoustic communication in
birds varies with spatial scales (Luther 2009). We posit that it is
important to consider that animal behaviour within the social
environment will be scale-dependent.
<!-- QW: I think this last sentence needs to be a bit stronger. Why is it important? -->

Sociality exists across both temporal and spatial scales (Whitehead
2008). For example, grooming requires close spatial proximity between
conspecifics and occurs over brief time periods (e.g. Carter, Lee and
Marshall 2015), whereas social association represents shared space use
by members of the same social group (Figure
<a href="#fig:spacetime">1</a>, Franks, Ruxton and James 2009). Further,
for social interactions or associations to occur individuals must share
space, and thus have overlapping home ranges (Vander Wal, Laforge and
McLoughlin 2013). In the context of the social environment, home range
overlap is an example of how animals share space over coarser spatial
and temporal scales (e.g. Piza-Roca et al. 2018). Although the social
environment clearly scales spatially and temporally, it remains unclear
whether coarser scales of sociality, including social association and
home range overlap, vary predictably with social interaction (Castles et
al. 2014; Farine 2015). We therefore define social scale as the type of
social relationship observed that can be explicitly defined and measured
(Farine 2015) and suggest the potential for adaptive variance in social
relationships is also scale-dependent.
<!--QW: also need to fix up this last sentence- I added the 'adaptive variance part 
under the expectation that there is some scale at which variance is greatest, and presumably
it is this scale that has the greatest effect on fitness or other traits-->

Animal social network analysis is a well-developed tool used to measure
the relationships of individuals and organization of social systems (Wey
et al. 2008; Krause, Lusseau and James 2009; Croft et al. 2011). Social
network analysis provides insight into the structure of social
communities and social network properties, which can influence
population dynamics and evolutionary processes (Pinter-Wollman et al.
2013; Kurvers et al. 2014). Despite the widespread use and innovation of
traditional social network analysis (Webber and Vander Wal 2019), it
typically considers a single scale of sociality in a given network
(monolayer), drastically simplifying the complexity of animal social
systems (Finn et al. 2019).

Unlike traditional monolayer social networks, multilayer networks
explicitly consider social systems across scale-dependent contexts
(Pilosof et al. 2017). Multilayer networks are made up of multiple
layers, each representing (i) different classes of individuals,
e.g. male or female, (ii) types of behaviours, e.g. grooming,
travelling, or foraging, (iii) spatial areas, e.g. local or regional,
(iv) or temporal windows, e.g. daily or seasonal (Kivela et al. 2014;
Porter 2018). Multilayer networks are relatively novel to studies of
animal behaviour (Silk et al. 2018; Finn et al. 2019), although they
have been used to describe multidimensional human social systems,
complex transportation networks, and neural networks (Silk et al. 2018).
<!-- just "scale".. edit sent -->The role of scale within multilayer
social networks remains unexplored but provides a unique opportunity to
develop novel understanding of variation in the social, spatial, or
temporal scales associated with social systems.

<!-- we examined-->

Our examinations are motivated by behavioural, landscape, and spatial
ecology to build a conceptual and analytical framework for
scale-dependent multilayer networks, and we apply this framework to a
case study of caribou (*Rangifer tarandus*) in Newfoundland, Canada
(Peignier et al. 2019). We use this case study to address two principal
questions associated with scale-dependent multilayer networks. First, to
what degree does the social scale of relationships, spatial scale of
landscapes, and temporal scale of analysis influence our ability to
interpret complex social systems? Second, can variation in the social,
spatial, and temporal scale improve <!-- replace pred-->predictions
associated with biological differences in seasonal resource availability
and social association? We conclude with perspectives for further
development and application of scale in multilayer networks with respect
to phenotypes and individual fitness, movement ecology and collective
movement, and habitat selection and space use.
<!-- JWT: This part may have to change depending on how we do the disc -->

# Methods

## Caribou socioecology

Caribou are gregarious ungulates with fission-fusion dynamics
(Lesmerises, Johnson and St-Laurent 2018) that display temporal and
spatial variation in social networks (Peignier et al. 2019). In winter,
caribou dig holes in the snow, termed craters, to access forage
(Bergerud 1974). Cratering is presumed to be a costly behaviour and as a
result, caribou tend to occupy and re-use craters once they are
established. <!-- and there is
considerably less access to forage than when the landscape is snow-free.-->
Importantly, craters exist on the landscape at multiple scales: the
crater scale (a single crater), the feeding area scale (multiple craters
in close proximity), and the winter range scale (all craters within an
individual’s range) (Mayor et al. 2009). Access to forage is seasonally
heterogeneous depending on snow cover and, in winter, variable
distribution of craters on the landscape.

## Caribou location data

We used GPS location data collected from Fogo Island caribou between
2017-04-21 and 2019-03-27. Adult female caribou were immobilized and
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
using the R package `raster` (Hijmans 2019): foraging, open, and forest
habitats. Foraging habitat consisted of foraging, open habitat consisted
of wetland, rocky barrens, and anthropogenic, while forest habitat
consisted of coniferous forest, conifer scrub, broad leaf forest, and
mixed-wood forest. Water habitat was excluded from all subsequent
analyses.

## Caribou multilayer social networks

### Network layer construction

<!--We generated a multilayer social network consisting 21
individual nodes and two aspects (season and land cover). Two season
elementary-layers (summer and winter) and three land cover elementary-layers
(foraging, forest, and open) combined for a total of six layers. Single layers were
composed of individuals linked by social associations, for each season and land cover combination.-->

We generated proximity-based social networks using the R package
`spatsoc` (Robitaille, Webber and Vander Wal 2019) in R version 4.0.1
(2020-06-06) (R Core Team 2019). We assumed individuals were associating
if simultaneous GPS fixes were within the spatial distance threshold of
one another. Typically for ungulates and other gregarious mammals, the
‘chain rule’ is used for group assignment (Croft, James and Krause
2008). For GPS data, the chain rule is applied by assigning a group
identifier to the union of buffered GPS fixes at each time step. As
such, individuals in a group are within the social distance threshold of
at least one other though not necessarily all other individuals
(Robitaille, Webber and Vander Wal 2019). Group assignment based on the
chain rule has previously been applied to caribou using a temporal
threshold of 5 minutes and a social distance threshold of 50 m
(Lesmerises, Johnson and St-Laurent 2018; Peignier et al. 2019). In all
networks, individual caribou were represented as nodes and associations
between individuals in a given network layer were represented as
intralayer edges.

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
layer. Extending degree centrality to multiple layers, we calculated
multidegree, the sum of degree centrality of individuals across layers
(Berlingerio et al. 2012; Kivela et al. 2014). Finally, we measured the
similarity of layers by calculating edge overlap. Edge overlap is
defined as the proportion of edges present in each network layer out of
all observed edges (Battiston, Nicosia and Latora 2014). Network metrics
were calculated using the R packages `igraph` (Csardi and Nepusz 2006),
`asnipe` (Farine 2019), `spatsoc` (Robitaille, Webber and Vander Wal
2019) and `data.table` (Dowle and Srinivasan 2019).

## Varying scale in multilayer networks

### Social scale

We generated multilayer networks across a series of social distance
thresholds that relate to behavioural interactions that could occur
within those distances
<!-- JWT: or something like that needs to be in the first sentence to relate the spatial distance to social scale upfront -->
for group assignment. Social distance thresholds (5, 25, 50, 75, 100,
250 and 500 m) represented a range of visual (short distance) to
auditory (long distance) sensory modalities of caribou. Multilayer
networks consisted of the social association between 21 individuals
across three habitat layers (open, forest and foraging) for the entire
study period. At the finest scale, individuals within 5 m of one another
were considered in the same group, whereas at the coarsest scale,
individuals within 500 m of one another were considered in the same
group. We calculated graph strength and multidegree for each habitat
layer and social distance threshold, and edge
<!-- JWT: can we call spatial distance social distance? --> overlap
across the entire series of networks to determine proportion of total
edges observed in each combination of habitat layer and spatial distance
threshold.

### Spatial scale

To assess the influence of spatial scale, we aggregated the land cover
raster using the R package `grainchanger` (Graham 2019) across a series
of scales (100 - 1000 m by steps of 100 m). The land cover raster was
aggregated using a modal moving window method using a circular window
corresponding to the above scales (Graham et al. 2019). We assume 30 m
and 100 m represents fine-scale decision making for caribou during
foraging, while re-sampling at 500 m , 750 m and 1000 m represents the
scale at which caribou tend to select and avoid habitat
(Bastille-Rousseau et al. 2017). For each spatial scale, we generated a
multilayer network consisting of the social associations between 21
individuals across three habitat layers (open, forest and foraging) for
the entire study period. Social associations of individuals were defined
by spatiotemporal overlap within 5 minutes and 50 m. We calculated graph
strength and multidegree for each habitat layer and spatial scale, and
edge overlap across the entire series of networks to determine
proportion of total edges observed in each combination of habitat layer
and spatial scale.
<!-- JWT: Your graphs present things in the order of Foraging, Forest, Open, but in the text you do open, forest, forage. They need to be consistent -->

### Temporal scale

#### Time windows

We used a temporal multilayer network to assess the seasonality of
caribou sociality. Multilayer networks consisted of the social
associations between 21 individuals across 20 ordinal sample periods of
35-36 <!--QW: why 35-36 and not just 35 or 36?--> days taken from the
entire study period. Social associations were defined by spatiotemporal
overlap of individuals within 5 minutes and 50 m. In each time window,
we calculated individual graph strength and multidegree, and across the
series of networks, we calculated edge overlap to determine proportion
of total edges observed in each time window.

#### Number of observations

Studies of social network analysis vary in the number and frequency of
observations as well as the data collection technique used to generate
networks (Davis, Crofoot and Farine 2018; Webber and Vander Wal 2019).
For example, GPS data is commonly collected at a fixed rate, e.g. every
\(x\) minutes or hours, continuously throughout the study period. Fix
rate is a reflection of number of observations an individual would have
been observed and recorded in traditional ethological studies. To
investigate the influence of number of observations, we generated
multilayer networks of social association between 21 individuals across
three habitat layers (open, forest and foraging) using \(N\) randomly
selected observations. We first generated a maximum of 1000 timesteps
and iteratively used \(N\) of these (\(N\) = 10 - 1000 observations by
steps of 10), to ensure previously included timesteps, and resulting
associations, were accumulated with subsequent observations to mimic
collection of observational data. Within each multilayer network with
\(N\) observations, we calculated individual graph strength and
multidegree. We calculated edge overlap across the entire series of
networks to determine proportion of total edges as number of
observations increased.

# Results

Individuals in multilayer networks became more connected as the spatial
distance threshold increased. Mean graph strength differed across
habitat layers with similar and higher graph strength in open and
foraging layers, and lower strength in forest layers (Figure
<a href="#fig:socres">4</a>). Individual graph strength increased
sharply between 5 m and 100 m in all three habitat classes followed by a
plateau in the rate of increase after 100 m (<!--TODO: figure XX-->).
These results suggest the optimal social scale at which groups should be
assigned is between \~20 - 100 m based on the rate at which network
metrics <!--QW: which metrics?--> stabilized. For ungulates, groups are
often assigned based on 50 m threshold (Lingle 2003; Lesmeries et
al. 2018; Peignier et al. 2019), suggesting that given similar
quantities of data, \~50 m is likely an appropriate social scale for
generating social networks in caribou and similar species.
<!--QW: I'm not sure about this statement. Should it be more about 
how GPS data allows (e.g. from this study and Peignier et al; Lesmerises et al.) us to confirm 
the use of 50m buffer that has long been used for studies in the field (e.g. Lingle 2003 and 
any Clutton-Brock red deer paper that uses group size data)-->

Increasing land cover resolution resulted in decreased availability of
foraging habitat, a rare and patchy habitat, and corresponding low
connectivity of individuals in these habitats at higher resolution
(Figure <a href="#fig:lcres">2</a>). Graph strength and edge overlap
were relatively consistent across land cover resolutions for forest and
open layers (Figure <a href="#fig:lcres">2</a> D, E). Edge overlap
decreased sharply between 30 m and 600 m in foraging layers, afterwards
remaining stable to 1000 m (Figure <a href="#fig:lcres">2</a> D). Graph
strength was more variable within foraging habitat layers across land
cover resolutions than open and forest habitat layers (Figure
<a href="#fig:lcres">2</a> D).
<!-- JWT: the order things are discussed here is a little confusing, you discuss strength, edge overlap, then strenght again. I think this should be reordered so it's easier to follow. -->
The proportion of relocations in forest and open habitats increased with
increasing spatial resolution, while decreasing in foraging habitat
(Supplementary 1 Figure 1). Overall, these results indicate the
importance of matching land cover resolution to scale of selection as
well as ensuring the land cover product used has a resolution fine
enough to detect landscape features and habitats relevant to study
species, such as important patchy and rare habitats.

<!--QW: what makes it ordinal again? Is it ordinal OR continuous? -->

The ordinal multilayer network generated indicated within-year time
windows of increased caribou sociality.
<!--QW: I'm not sure what you are trying to say in this first sentence. Is it that there are distinct within-year time windows where social network metrics increased? -->
Edge overlap was higher in time windows 1, 6-11 and 15-20 than in time
windows 2-5 and 12-15 (Figure <a href="#fig:temp">3</a> A).
<!--QW: I'm not sure about using the window number - it doesn't really mean anyhting. Can you use actual dates?-->
Time windows of higher edge overlap, between approximately October and
May, had correspondingly higher graph strength compared to time windows
of lower edge overlap, between approximately May and October (Figure
<a href="#fig:temp">3</a> C). Graph strength peaked across the time
series in periods 9 and 10. These results suggest that ordinal
multilayer networks can effectively capture discrete time windows of
aggregation and dissaggregation related to resource availability, and
highlight the importance of carefully selecting the temporal scale of
analysis.

As the number of observations used to generate multilayer networks
increased, individuals became more connected and variance in metrics
decreased.
<!--QW: I think throughout you want to say "variance decreased" instead of "stabilized" -->
Graph strength across individuals in all three habitat layers was highly
variable at low number of observations and stabilized after \~100
observations (Figure <a href="#fig:nobs">5</a> A). Edge overlap
increased across all three habitat layers with increasing number of
observations (Figure <a href="#fig:nobs">5</a> B). Similarly,
multidegree for all individuals increased quickly between 10 and 100
observations, and continued to increase until 1000 observations (Figure
<a href="#fig:nobs">5</a> C). Given the observed trend of these
multilayer metrics stabilizing after a certain number of observations
are included, the results suggest this sensitivity method could be
useful for determining the number of observations necessary for
sufficiently describing social dynamics across contexts.

<!-- Figure: metrics by social scale -->

<!-- Figure: metrics by land cover resolution -->

<!-- Figure: metrics by number of observations -->

<!-- Figure: Time window -->

<!-- JWT: edge overlap, graph strength, and multidegree are presented in different orders in the graphs. They should be presented in the same order each time even if the combination of what you show changes. -->

# Discussion

<!-- 1)
First, to what degree does the social scale of relationships, spatial
scale of landscapes, and temporal scale of analysis influence our ability to
interpret complex social systems? 
-->

<!-- 2)
Second, can variation in the social, spatial,
and temporal scale improve predictions associated with biological differences in
seasonal resource availability and social association? 

+
We conclude with
perspectives for further development and application of scale in multilayer
networks with respect to phenotypes and individual fitness,
movement ecology and collective movement, and habitat selection
and space use.
-->

Our results highlight the influence of social, spatial and temporal
scale on multilayer networks. For social scale, we found individuals
became more connected with increasing social distance threshold.
Increasing land cover resolution lead to a decrease in availability of
patchy and rare habitats and,
<!--QW: not sure I'd mention 'rare' since there are only 3 habitat types. 
Could you just say 'less common' or even just 'patchy'?-->
correspondingly, lower connectivity of individuals in these habitats.
Temporal windows highlighted clear periods of increased sociality among
individuals. Finally, increasing number of observations led to a general
stabilization in network metrics. As such, scale is inherently tied to
the generation of multilayer networks and metrics evaluating them, as
well as the individual layers that make them up.
<!--QW: I will pre-empt Eric and say I think this paragraph could maybe not mention the results at all. 
You could focus on just talking about the importance of scale for behavioural and spatial ecology.
Why is it important and what are the more broadly applicable ideas that lead us to this paper? 
Maybe keep this little summary paragraph for now - I think likely we could integrate what I describe 
above with what you already have-->

Monolayer network approaches have been increasingly used to link social
network position with individual fitness, including in primates (Brent,
Ruiz-Lambides and Platt 2017; Thompson 2019), dolphins (Stanton, Gibson
and Mann 2011; Stanton and Mann 2012), and birds (McDonald 2007; Royle
et al. 2012). Social scale has emerged as an important variable for
understanding fitness consequences in the context of social network
positions
<!-- TODO JWT check-- JWT: these are right, and we could potentially replace the holekamp paper with our recent JAE one if it gets released in time -->
(Holekamp et al. 2011; Berger et al. 2015; Almeling et al. 2016; Brent,
Ruiz-Lambides and Platt 2017). Defining the social scale to generate
networks is an essential consideration for social network analysis
<!-- with direct impacts on
outcomes blah-->(Castles et al. 2014; Carter, Lee and Marshall 2015;
Farine 2015). Proximity-based social networks generated using GPS
location data require using a social scale, specifically a social
distance threshold, to define social associations. We found increasing
individual graph strength across three habitat layers with increasing
social distance threshold (Figure <a href="#fig:socres">4</a>).
<!-- This means blah blah for different types of interactions.--> In
addition, habitat layers differed in their response to social distance
threshold, with open and foraging with a larger increase in graph
strength and greater variation across individuals.
<!-- What could this mean biologically? --> These results emphasize that
multilayer network metrics are directly influenced by social scale, in
this case the spatial distance threshold.

Social structure and habitat selection are intimately related:
individuals must share space to interact and the distribution of
resources influences group dynamics and home range size (Webber and
Vander Wal 2018). Social structure is influenced by resource
availability and seasonality (Peignier et al. 2019), configuration (He,
Maldonado-Chaparro and Farine 2019) and fragmentation (Banks et al.
2007). Habitat selection, the disproportionate use of available
resources or landscape features by animals (Manly, McDonald and Thomas
1993; Boyce and McDonald 1999), is a scale-dependent process (Mayor et
al. 2009). Johnson (1980) identified four orders of habitat selection:
(1) the geographical range of a species, (2) the home range of an
individual, the (3) habitat patches within the home range and (4)
specific resources within a habitat patch. Kie et al. (2002) found that,
independently, third order of selection was insufficient for capturing
landscape attributes selected for by mule deer (*Odocoileus hemionus*),
at a scale larger than their home range size. Moving past this
hierarchical perspective, Mayor (2007) emphasized the importance of
considering a broad continuum of scales to reveal scale-dependent
selection and avoid the bias of predefined scales assumed to be
associated with certain behaviours.

The emergent relationship between habitat and sociality has been
explored by the distribution and phenology of resources and use of
social information. For example, cougar (*Puma concolor*) home ranges
overlapped more in regions with high hunting opportunity, a proxy for
resource richness (Elbroch et al. 2015). Caribou social network graph
strength differed between seasons, where graph strength was stronger in
winter and contrastingly low in summer when resource availability are
more homogeneous (Peignier et al. 2019). Bison (*Bison bison*) showed
stronger habitat selection in larger groups, and avoidance of predation
risk was a main factor contributing to their habitat selection (Fortin
et al. 2009). These examples, comparing sociality and habitat selection
across temporal or spatial contexts, are implicitly multilayer analyses.

Multilayer networks represent a novel framework for explicitly testing
the influence of habitat selection on sociality across scales. Animal
social systems can be parsed by spatial contexts, for example as defined
by habitat types as in Figure <a href="#fig:lcres">2</a>. Given that
habitat data are available across a wide range of spatial scales, we
evaluated the influence of habitat spatial resolution on multilayer
network metrics. The results indicate varied influence of increasing
spatial resolution depending on the habitat layer. As spatial resolution
increased, edge overlap decreased in foraging while remaining stable in
open and forest habitats (Figure <a href="#fig:socres">4</a> D).
Foraging
<!--Lichen? I think we need to call this lichen and not forage --> is a
rare (<!--TODO--> XX % of the landscape) and patchy habitat on Fogo
Island, as is indicated by a decrease in the proportion of relocations
in this habitat type with increasing spatial resolution (Supplementary 1
Figure 1). Similar to increasing social distance threshold, the
influence of increasing spatial resolution on graph strength was notably
different between habitat layers. Forest layers showed little change in
graph strength with increasing spatial resolution and variation between
individuals. Foraging and open layers had greater individual variation
in graph strength, while foraging was the only layer to show large
responses in graph strength to increasing spatial resolution (Figure
<a href="#fig:socres">4</a> E). As such, multilayer network measures
related to habitat are explicitly dependent on spatial scale. Edge
overlap can indicate if some associations between individuals are
dependent on the habitat-context (Battiston, Nicosia and Latora 2014).
If the spatial resolution of the habitat data are insufficient to
capture rare habitats, context-specific relationships between
individuals may not be captured by multilayer networks.

Social processes, movement decisions, and space use are inextricably
linked and multilayer networks represent a potential analytical
framework for linking these processes (Mourier, Lédée and Jacoby 2019).
Movement as a collective group can reduce per capita predation risk via
detection-dilution trade-offs and improve information transfer about the
quality or location of resources to other group members (Jolles, King
and Killen 2019). Given the existing framework for constructing
multilayer networks from behavioural layers (e.g. Smith-Aguilar et al.
2019), monolayer networks that explicitly quantify movement parameters
could be integrated. For example, edges could represent measures of
dyadic or collective movement based on dynamic interaction metrics (Long
et al. 2014). Integrating movement layers with habitat-specific social
association layers could further illuminate the role of movement as a
driver of the social and spatial environments an individual experiences
(Webber and Vander Wal 2018). We generated multilayer networks based on
habitat-specific layers of social association. Coordinated movement of
dyads, or groups, could vary based on habitat, and the approach we
outline could be used to explore mechanisms linking the social and
spatial environments.<!--  <- long sentence with two coulds --> For
example, social processes may be an emergent property of the landscape
because animals aggregate at resources, such as waterholes
(Chamaill’e-Jammes et al. 2008). Movement to, from, or within habitat
patches or territories can also contribute to the formation of the
social environment (Spiegel et al. 2016). For example, in sleepy lizards
(*Tiliqua rugosa*) males interacted primarily at home range edges,
presumably driving territorial behaviour (Spiegel et al. 2018).
Incorporating movement ecology within a multilayer network framework is
a logical next step for a burgeoning field. In particular, when
association networks are habitat-specific, we suggest the integration of
movement and space use in multilayer networks provides novel insights
into the effects of habitat configuration on the formation of the social
environment (Webber and Vander Wal 2018; He, Maldonado-Chaparro and
Farine 2019).

Importantly, the key to incorporating movement in multilayer networks
across scales is the technological advancements available to overcome
previous limitations (Hughey et al. 2018). Biologging and wildlife
tracking technology has advanced to the point where relocations can be
programmed to occur as frequently as each second (Börger 2016), a
practice which has been applied to questions of collective movement (e.g
Strandburg-Peshkin et al. 2015). Meanwhile, remote sensing technology,
including unmanned aerial vehicles and satellites, can be used to track
the fine-scale movements of groups over large distances and time scales
(Torney et al. 2018). Using technology to infer behaviour has therefore
become standard operating procedure for many species in many systems.
Our ability to collect and process remotely sensed data and infer social
processes based on animal movement provides an opportunity to use
multilayer social network analysis to answer complex questions about
animal socioecology.

The effect of seasonality of resources on sociality can be directly
measured by differences across discrete time windows. Using an ordinal
multilayer network consisting of 20 discrete time windows throughout the
study period, we observed periods of increased sociality in caribou on
Fogo Island (Figure <a href="#fig:temp">3</a>). Edge overlap was higher
between approximately October and May (time windows 1, 6-11, 15-20)
compared to between approximately May and October (time windows 2-5,
12-15) (Figure <a href="#fig:temp">3</a> A). These periods of high edge
overlap correspond to seasons of low resource availability
\[Peigner\_2019\]. Similarly, individual graph strength was also highest
in these periods (Figure <a href="#fig:temp">3</a> B). By explicitly
considering the temporal context of social interactions in separate
layers, multilayer networks provide a detailed and dynamic perspective
at animal social networks.

Selection of appropriate time windows is essential for capturing
sociality in specific life stages of interest. Social phenotypes can
change over ontogeny in ways that can affect fitness (Berger et al.
2015; Brent, Ruiz-Lambides and Platt 2017). Further complicating the
issue, individuals can vary in their rate of development (Tarka et al.
2018). This variation can make defining the appropriate temporal scale
for testing the fitness implications of an individual’s social phenotype
over different stages of ontogeny difficult. However, considering fine
temporal scales has been show to provide insight across developmental
stages that may otherwise be missed (Turner, Bills and Holekamp 2017)
<!-- It would be better to cite the more recent one if it gets released in time. -->
Furthermore, given the non-independent nature of social interactions and
associations, especially over time, it can be challenging to test
hypotheses about social dynamics with a suitable null control (Farine
2017; Proskurnikov and Tempo 2017). Using the framework of multilayer
networks, ordinal layers of discrete time windows provide a way to make
appropriate null models to test questions about the dynamics of an
individual’s social network position over multiple aggregated time
periods.

Finally, it is crucial to consider sufficient data to construct robust
networks when selecting time windows and study periods. Time windows
should be long enough for each layer to have enough data for robust
networks (Farine 2017). To test the influence of data quantity on
multilayer networks, we used a subset of observations to generate
multilayer networks. All network metrics across all three habitat layers
appeared to stabilize with increasing number of observations. Individual
graph strength showed high variability at low number of observations,
while edge overlap and multidegree increased sharply. After
approximately 200 observations, the rate of change for all metrics
decreased and and graph strength remained relatively static, while edge
overlap and multidegree continued to increase slowly. As more
observations were added, more and rarer relationships were recorded
revealing the value of this form of sensitivity analysis.

<!--
Multilayer networks can be built with different types of interactions


In contrast to multilayer networks formed by combining layers defined
by different types of interactions, multilayer networks with GPS data are limited to 
proximity based measures. An alternative which has been explored is using 
hidden markov models behavioural states, within which individuals are associating. [@Jones_2020]

Another potential application would be
to generate social networks during times when animals are engaged in different
behaviours, including travelling, interacting, or foraging [@Muller_2018;
@Finn_2019] and construct a multilayer network based on behaviour-specific
monolayer networks [e.g. @Smith_Aguilar_2019].



netTS


However, animals
have certain interactions that do not require proximity such as long-distance
vocalization and olfactory signals [@Carter_2015]. 

With the advancement of
biologging technology, we have the ability to record social interactions that do
not require proximity, particularly long-distance communication networks with
devices like microphone arrays [@Snijders_2017]. 

-->

# Conclusion

Multilayer networks remain a nascent but powerful tool in animal
behavioural ecology. We demonstrate the potential novel analyses that
vary social, spatial, and temporal scale within a multilayer framework.
We show that (1) multilayer social networks can be scale-dependent, and
(2) the use of multilayer networks could be useful for identifying
habitat or season-specific social processes. Our analyses of social,
spatial, and temporal scales in a multilayer network framework highlight
the potential to identify scales at which different properties of layers
within a multilayer network show the most variability. Furthermore, we
discuss the potential integration of individual phenotypes and fitness,
collective movement, and habitat selection for future analyses
considering spatial ecology using multilayer networks.

Recognition of scale as a fundamental concept in ecology (Levin 1992)
has lead to an increased attention to the scale at which ecological
processes are observed (Schneider 2001; Chave 2013). In addition, recent
technological advances have lead to increased data complexity and
resolution. Remotely sensed imagery collected by modern satellites
provide, for example, 10 m spatial resolution optical imagery at a
temporal revisit period of five days at the equator (Drusch et al.
2012). Similarly, animal tracking devices have become smaller allowing
their deployement on a wider variety of organisms (Wikelski et al. 2007)
and at a higher temporal resolution (Börger 2016). Given this increased
availability of complex data, it is important to consider using a broad
continuum of scales to fully capture ecological processes, carefully
select and combine sources of data with different temporal and spatial
scales, and establish a clear link between scales of observation and
meaningful biology.

Multilayer networks are complicated in that they can incorporate data as
varied as social interactions, landscape features, and seasons, all of
which exist at different scales and units of measurement. Our analysis
of caribou multilayer networks which incorporated high resolution GPS
telemetry data and spatial land cover data is grounded in the context of
observed animal social networks, as the scales we chose to explore,
e.g., number of observations, sociality across space and time, are ones
that can be observed as has <!-- edit-->traditionally been done in
ethology. We highlight ways in which scale ought to be considered for
both observed and remotely-sensed data when building social networks.
GPS telemetry data provides a link between large scale landscape
properties and fine scale social interactions as animal movement occurs
across the landscape, and when taken into account with multiple
individuals<!-- edit--> can indicate association patterns. Thus, a layer
incorporating relocation data could be a great boon linking spatial and
social layer in multilayer networks.

Silk et al. (2018) summarized some key multilayer questions in animal
behaviour research. While these questions are important for linking
animal behaviour and multilayer networks, we summarize our perspectives
on the future of multilayer networks with an additional set of questions
posed through the lens of spatial ecology that are relevant to the
promise and problem of scale in multilayer networks:

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

<!-- JWT: It think we need an ending thought or punch or something, not end it on a question. -->

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

<img src="../graphics/figure-lc.png" alt="Varying spatial scale of land cover raster. For each land cover resolution (5, 25, 50, 75, 100, 250 and 500 m), multilayer networks were constructed of caribou social associations (n = 21 females) on Fogo Island, Newfoundland between 2017-04-21 and 2019-03-27 across three habitat classes (foraging, forest, and open). A, B, C) Three land cover rasters: the original resolution (30 m) and two aggregated rasters (500 m and 1000 m). D) Edge overlap of habitat layers across spatial resolutions. Open and forest layers show consistent edge overlap with increasing spatial resolution while foraging shows a sharp decline in edge overlap between 30 m and 600 m. Above 600 m, the foraging layers are stable. E) Graph strength (mean of individuals in bold) within habitat layers across spatial resolution. Foraging layers showed high variation in graph strength with many individuals dropping to 0 after 500 m and others increasing with spatial resolution. Open layers and forest layers were relatively stable across spatial resolutions, with higher mean graph strength in open compared to forest." width="\linewidth" />

<p class="caption">

Figure 2: Varying spatial scale of land cover raster. For each land
cover resolution (5, 25, 50, 75, 100, 250 and 500 m), multilayer
networks were constructed of caribou social associations (n = 21
females) on Fogo Island, Newfoundland between 2017-04-21 and 2019-03-27
across three habitat classes (foraging, forest, and open). A, B, C)
Three land cover rasters: the original resolution (30 m) and two
aggregated rasters (500 m and 1000 m). D) Edge overlap of habitat layers
across spatial resolutions. Open and forest layers show consistent edge
overlap with increasing spatial resolution while foraging shows a sharp
decline in edge overlap between 30 m and 600 m. Above 600 m, the
foraging layers are stable. E) Graph strength (mean of individuals in
bold) within habitat layers across spatial resolution. Foraging layers
showed high variation in graph strength with many individuals dropping
to 0 after 500 m and others increasing with spatial resolution. Open
layers and forest layers were relatively stable across spatial
resolutions, with higher mean graph strength in open compared to forest.

</p>

</div>

<div class="figure">

<img src="../graphics/figure-temp.png" alt="Varying temporal scale in multilayer networks. Multilayer networks were generated of caribou social associations (n = 21 females) on Fogo Island, Newfoundland within ordinal time windows (20 ordinal sample periods of 35-36 days) between 2017-04-21 and 2019-03-27. A) Edge overlap across time windows showed two periods of low overlap (time windows 2-5 and 12-15), and three periods of high overlap (time windows 1, 6-11, 15-20). B) Ordinal network layers showing unweighted edges between individuals within time windows. Like edge overlap, individuals were more connected in time windows 1, 6-11, and 15-20, compared to 2-5 and 12-15. C) Graph strength within time windows showing individuals as thin grey lines and mean across individuals as thick grey lines. Graph strength peaked in time window 9, with noticeable higher strength than the following year." width="\linewidth" />

<p class="caption">

Figure 3: Varying temporal scale in multilayer networks. Multilayer
networks were generated of caribou social associations (n = 21 females)
on Fogo Island, Newfoundland within ordinal time windows (20 ordinal
sample periods of 35-36 days) between 2017-04-21 and 2019-03-27. A) Edge
overlap across time windows showed two periods of low overlap (time
windows 2-5 and 12-15), and three periods of high overlap (time windows
1, 6-11, 15-20). B) Ordinal network layers showing unweighted edges
between individuals within time windows. Like edge overlap, individuals
were more connected in time windows 1, 6-11, and 15-20, compared to 2-5
and 12-15. C) Graph strength within time windows showing individuals as
thin grey lines and mean across individuals as thick grey lines. Graph
strength peaked in time window 9, with noticeable higher strength than
the following year.

</p>

</div>

<div class="figure">

<img src="../graphics/figure-soc.png" alt="Varying scale in social distance threshold. For each social distance threshold (100 - 1000 m by steps of 100 m), multilayer networks were constructed of caribou social associations (n = 21 females) on Fogo Island, Newfoundland between 2017-04-21 and 2019-03-27 across three habitat classes (forage, forest, and open). Graph strength (mean of individuals in bold) showed a sharp increase between 5 m and 100 m for all habitat classes. After 100 m, graph strength continued to increase at a slower rate. Open and foraging layers showed higher variation in graph strength between individuals while the forest layer had less variation and lower mean graph strength." width="\linewidth" />

<p class="caption">

Figure 4: Varying scale in social distance threshold. For each social
distance threshold (100 - 1000 m by steps of 100 m), multilayer networks
were constructed of caribou social associations (n = 21 females) on Fogo
Island, Newfoundland between 2017-04-21 and 2019-03-27 across three
habitat classes (forage, forest, and open). Graph strength (mean of
individuals in bold) showed a sharp increase between 5 m and 100 m for
all habitat classes. After 100 m, graph strength continued to increase
at a slower rate. Open and foraging layers showed higher variation in
graph strength between individuals while the forest layer had less
variation and lower mean graph strength.

</p>

</div>

<div class="figure">

<img src="../graphics/figure-nobs.png" alt="Varying scale in number of observations. Multilayer networks were generated using a sample number of observations (10 - 1000 observations by steps of 10) of caribou social associations (n = 21 females) on Fogo Island, Newfoundland between 2017-04-21 and 2019-03-27 across three habitat classes (foraging, forest, and open). A) Graph strength was highly variable at low number of observations (less than 100) for all habitat layers and relatively stable after 200 observations. B) Edge overlap increased for all habitat layers with increasing number of observations. Open and foraging layers had higher edge overlap than forest layers. C) Multidegree increased for all individuals with increasing number of observations. Individuals showed high variability (2 - 51) at the maximal number of observations (1000)." width="\linewidth" />

<p class="caption">

Figure 5: Varying scale in number of observations. Multilayer networks
were generated using a sample number of observations (10 - 1000
observations by steps of 10) of caribou social associations (n = 21
females) on Fogo Island, Newfoundland between 2017-04-21 and 2019-03-27
across three habitat classes (foraging, forest, and open). A) Graph
strength was highly variable at low number of observations (less than
100) for all habitat layers and relatively stable after 200
observations. B) Edge overlap increased for all habitat layers with
increasing number of observations. Open and foraging layers had higher
edge overlap than forest layers. C) Multidegree increased for all
individuals with increasing number of observations. Individuals showed
high variability (2 - 51) at the maximal number of observations (1000).

</p>

</div>

<div class="figure">

<img src="../graphics/figure-fogo-ml.png" alt="Visualization of multilayer network representing social association of caribou on Fogo Island, Newfoundland between 2017-04-21 and 2019-03-27. Individual caribou (n = 21 females) are show as nodes and each individual is represented by a unique color. Twelve layers represent combinations of four time windows and three habitat classes (open, forest and foraging). Intralayer edges connect pairs of individuals that associated according to spatial and temporal thresholds described above, and are scaled in line thickness according to strength of association (SRI)." width="\linewidth" />

<p class="caption">

Figure 6: Visualization of multilayer network representing social
association of caribou on Fogo Island, Newfoundland between 2017-04-21
and 2019-03-27. Individual caribou (n = 21 females) are show as nodes
and each individual is represented by a unique color. Twelve layers
represent combinations of four time windows and three habitat classes
(open, forest and foraging). Intralayer edges connect pairs of
individuals that associated according to spatial and temporal thresholds
described above, and are scaled in line thickness according to strength
of association (SRI).

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

<div id="ref-Banks_2007">

Banks SC, Piggott MP, Stow AJ, Taylor AC. Sex and sociality in a
disconnected world: A review of the impacts of habitat fragmentation on
animal social interactions. *Canadian Journal of Zoology*
2007;**85**:1065–79.

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

<div id="ref-B_rger_2016">

Börger L. Editorial: Stuck in motion? Reconnecting questions and tools
in movement ecology. *Journal of Animal Ecology* 2016;**85**:5–10.

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

<div id="ref-Chamaill_Jammes_2008">

Chamaill’e-Jammes S, Fritz H, Valeix M, Murindagomo F, Clobert J.
Resource variability, aggregation and direct density dependence in an
open context: The local regulation of an african elephant population.
*Journal of Animal Ecology* 2008;**77**:135–44.

</div>

<div id="ref-Chave_2013">

Chave J. The problem of pattern and scale in ecology: What have we
learned in 20 years? *Ecology Letters* 2013;**16**:4–16.

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

<div id="ref-Elbroch_2015">

Elbroch LM, Lendrum PE, Quigley H, Caragiulo A. Spatial overlap in a
solitary carnivore: Support for the land tenure, kinship or resource
dispersion hypotheses? *Journal of Animal Ecology* 2015;**85**:487–96.

</div>

<div id="ref-Elith_2009">

Elith J, Leathwick JR. Species distribution models: Ecological
explanation and prediction across space and time. *Annual Review of
Ecology, Evolution, and Systematics* 2009;**40**:677–97.

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

<div id="ref-Fortin_2009">

Fortin D, Fortin M-E, Beyer HL, Duchesne T, Courant S, Dancose K.
Group-size-mediated habitat selection and group fusionfission dynamics
of bison under predation risk. *Ecology* 2009;**90**:2480–90.

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

<div id="ref-He_2019">

He P, Maldonado-Chaparro AA, Farine DR. The role of habitat
configuration in shaping social structure: A gap in studies of animal
social complexity. *Behavioral Ecology and Sociobiology* 2019;**73**,
DOI:
[10.1007/s00265-018-2602-7](https://doi.org/10.1007/s00265-018-2602-7).

</div>

<div id="ref-Hijmans_2019">

Hijmans RJ. *Raster: Geographic Data Analysis and Modeling*., 2019.

</div>

<div id="ref-Holekamp_2011">

Holekamp KE, Smith JE, Strelioff CC, Horn RCV, Watts HE. Society,
demography and genetic structure in the spotted hyena. *Molecular
Ecology* 2011;**21**:613–32.

</div>

<div id="ref-Hughey_2018">

Hughey LF, Hein AM, Strandburg-Peshkin A, Jensen FH. Challenges and
solutions for studying collective animal behaviour in the wild.
*Philosophical Transactions of the Royal Society B: Biological Sciences*
2018;**373**:20170005.

</div>

<div id="ref-Integrated_2013">

Integrated Informatics Inc. *Sustainable Development & Strategic Science
Branch Land Cover Classifcation.* St. John’s, NL: Sustainable
Development; Strategic Science, Government of Newfoundland; Labrador

</div>

<div id="ref-Jolles_2019">

Jolles JW, King AJ, Killen SS. The role of individual heterogeneity in
collective animal behaviour. *Trends in Ecology & Evolution* 2019, DOI:
[10.1016/j.tree.2019.11.001](https://doi.org/10.1016/j.tree.2019.11.001).

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

<div id="ref-Long_2014">

Long JA, Nelson TA, Webb SL, Gee KL. A critical examination of indices
of dynamic interaction for wildlife telemetry studies. *Journal of
Animal Ecology* 2014;**83**:1216–33.

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

<div id="ref-Mourier_2019">

Mourier J, Lédée EJI, Jacoby DMP. A multilayer perspective for inferring
spatial and social functioning in animal movement networks. *bioRxiv*
2019, DOI: [10.1101/749085](https://doi.org/10.1101/749085).

</div>

<div id="ref-Peignier_2019">

Peignier M, Webber QMR, Koen EL, Laforge MP, Robitaille AL, Vander Wal
E. Space use and social association in a gregarious ungulate: Testing
the conspecific attraction and resource dispersion hypotheses. *Ecology
and Evolution* 2019;**9**:5133–45.

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

<div id="ref-Porter_2018">

Porter MA. What is... A multilayer network? *Notices of the American
Mathematical Society* 2018;**65**:1.

</div>

<div id="ref-Proskurnikov_2017">

Proskurnikov AV, Tempo R. A tutorial on modeling and analysis of dynamic
social networks. Part i. *Annual Reviews in Control* 2017;**43**:65–79.

</div>

<div id="ref-R_Core_Team_2019">

R Core Team. *R: A Language and Environment for Statistical Computing*.
Vienna, Austria: R Foundation for Statistical Computing, 2019.

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

<div id="ref-Smith_Aguilar_2019">

Smith-Aguilar SE, Aureli F, Busia L, Schaffner C, Ramos-Fern’andez G.
Using multiplex networks to capture the multidimensional nature of
social structure. *Primates* 2019;**60**:277–95.

</div>

<div id="ref-Spiegel_2016">

Spiegel O, Leu ST, Sih A, Bull CM. Socially interacting or indifferent
neighbours? Randomization of movement paths to tease apart social
preference and spatial constraints. *Methods in Ecology and Evolution*
2016;**7**:971–9.

</div>

<div id="ref-Spiegel_2018">

Spiegel O, Sih A, Leu ST, Bull CM. Where should we meet? Mapping social
network interactions of sleepy lizards shows sex-dependent social
network structure. *Animal Behaviour* 2018;**136**:207–15.

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

<div id="ref-Strandburg_Peshkin_2015">

Strandburg-Peshkin A, Farine DR, Couzin ID, Crofoot MC. Shared
decision-making drives collective movement in wild baboons. *Science*
2015;**348**:1358–61.

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

<div id="ref-Torney_2018">

Torney CJ, Lamont M, Debell L, Angohiatok RJ, Leclerc L-M, Berdahl AM.
Inferring the rules of social interaction in migrating caribou.
*Philosophical Transactions of the Royal Society B: Biological Sciences*
2018;**373**:20170385.

</div>

<div id="ref-Turner_2017">

Turner JW, Bills PS, Holekamp KE. Ontogenetic change in determinants of
social network position in the spotted hyena. *Behavioral Ecology and
Sociobiology* 2017;**72**, DOI:
[10.1007/s00265-017-2426-x](https://doi.org/10.1007/s00265-017-2426-x).

</div>

<div id="ref-Vander_Wal_2013">

Vander Wal E, Laforge MP, McLoughlin PD. Density dependence in social
behaviour: Home range overlap and density interacts to affect
conspecific encounter rates in a gregarious ungulate. *Behavioral
Ecology and Sociobiology* 2013;**68**:383–90.

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

<div id="ref-Wikelski_2007">

Wikelski M, Kays RW, Kasdin NJ, Thorup K, Smith JA, Swenson GW. Going
wild: What a global small-animal tracking system could do for
experimental biologists. *Journal of Experimental Biology*
2007;**210**:181–6.

</div>

</div>
