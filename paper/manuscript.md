The problem and promise of scale in animal social multilayer networks
================
Alec L. Robitaille<sup>1</sup>, Quinn M.R. Webber<sup>2</sup>, Julie W.
Turner<sup>1</sup>, Eric Vander Wal<sup>1,2</sup>
<sup>1</sup>Department of Biology, Memorial University of Newfoundland,
Canada; <sup>2</sup>Cognitive and Behavioural Ecology Interdisciplinary
Program, Memorial University of Newfoundland

# Abstract

Scale remains a seminal concept in ecology. Spatial scale, for instance,
has become a central consideration in the way we understand landscape
ecology and animal space use. Meanwhile, social processes can also scale
from fine-scale interactions to co-occurrence to overlapping home
ranges. Multilayer networks promise the integration of monolayer animal
social networks with the complexity and importance of animal space use
and movement in heterogeneous landscapes. Despite the complex interplay
between social networks and how animals use space, there remains an
important biological and methodological gap in our understanding of an
animal’s perception of scale. But scale can affect multilayer network
dynamics and how we build and interpret them. Here we discuss the role
of scale in the context of multilayer networks and provide a social
ungulate case study to illustrate the role of social, spatial, and
temporal scale on multilayer processes. We also present perspectives on
future development and application of scale in multilayer networks with
respect to: habitat selection and space use; phenotypes and individual
fitness; and movement ecology and collective movement. Effective
integration of social and spatial processes, including biologically
meaningful scales, within the context of animal social networks is an
emerging area of research; our contribution incorporates perspectives on
how the social environment and spatial processes are linked across
scales in a multilayer

## Keywords

<!-- TODO: is this the final list ? -->

Social network analysis, Landscape ecology, Movement ecology, Space use

# Introduction

Our inference regarding the ecological processes underlying ecological
patterns are directly linked to the scale at which they are observed
(Levin 1992; Allen and Hoekstra 2015). Animals are influenced across
scales, through processes such as species-specific as trophic
interactions and resource availability (Legendre 1993; Chave 2013) and
global climate and productivity (Field et al. 2009). Multiscale ecology
has been integrated into species distribution modelling (Elith and
Leathwick 2009), habitat selection (Mayor et al. 2007), and food webs
(Sugihara, Schoenly, and Trombla 1989). Meanwhile, in the context of
animal behaviour, certain behaviours are scale dependent, for example,
acoustic communication in birds occurs over variable spatial scales
(Luther 2009). We posit that animal behaviour and, more specifically,
the social environment that animals experience must also be
scale-dependent.

Sociality exists across both temporal and spatial scales (Whitehead
2008). For example, grooming requires close spatial proximity between
conspecifics and occurs over brief time periods (e.g. Carter et
al. 2015), whereas social association represents shared space use by
members of the same social group (Figure @ref(fig:spacetime), Franks et
al. 2010). Further, for social interactions or associations to occur
individuals must share space, and thus have overlapping home ranges. In
the context of the social environment, home range overlap is a
relatively coarse scale of sociality across which individuals share
space over coarser spatial and temporal scales (e.g. Piza-Roca et al.
2018). Although the social environment clearly scales spatially and
temporally, it remains unclear whether coarser scales of sociality,
including social association and home range overlap, vary predictably
with social interaction (Castles et al. 2014;
<span class="citeproc-not-found" data-reference-id="Farine2015a">**???**</span>).
Thus, we define social scale as the type of social relationship observed
that can be explicitly defined and measured (D. R. Farine 2015).

Animal social network analysis is a well-developed tool used to measure
the relationships of individuals and organization of social systems
(Krause et al. 2009; Wey et al. 2008; Croft et al. 2008). Social network
analysis provides insight into the structure of social communities and
social network properties, which can influence population dynamics and
evolutionary processes (Pinter-Wollman et al. 2014; Kurvers et
al. 2014). Despite the widespread use and innovation of traditional
social network analysis (Webber & Vander Wal 2019), it typically
considers a single scale of sociality in a given network (monolayer),
drastically simplifying the potential complexity of animal social
systems (Finn et al. 2019).

Unlike traditional monolayer social networks, multilayer networks
explicitly consider social systems across contexts, including
scale-dependent contexts (Pilosof et al. 2017). Multilayer networks are
made up of multiple layers, each representing (i) different classes of
individuals, e.g. male or female; (ii) types of behaviours,
e.g. grooming, travelling, or foraging; and (iii) spatial areas,
e.g. local or regional, or temporal windows, e.g. daily or seasonal
(Kivela et al. 2014; Porter 2018). Multilayer networks are relatively
novel to studies of animal behaviour (Silk\_2018; Finn et al. 2019),
although they have been used to describe multidimensional human social
systems, complex transportation networks, and neural networks (Silk et
al. 2018). The role of scale within multilayer social networks remains
unexplored but provides a unique opportunity to develop novel
understanding of variation in the temporal or spatial scales associated
with social systems.

Our study is motivated by behavioural, landscape, and spatial ecology to
build a conceptual and analytical framework for scale-dependent
multilayer networks and we apply this framework to a case study of
caribou (*Rangifer tarandus*) in Newfoundland, Canada (Peignier et al.
2019). We use this case study to address two principal questions
associated with scale-dependent multilayer networks. First, to what
degree does the social scale of relationships, spatial scale of
landscapes, and temporal scale of analysis influence our ability to
interpret complex social systems? Second, can variation in the social,
spatial, and temporal improve predictions associated with biological
differences in seasonal resource availability and social association? We
conclude with perspectives for further development and application of
scale in multilayer networks with respect to phenotypes and individual
fitness
(<span class="citeproc-not-found" data-reference-id="Webber_2018">**???**</span>),
movement ecology and collective movement (Jolles, King, and Killen
2019), and habitat selection and space use <!-- TODO: (REF)-->, and .

(ref:spacetime) Space-time diagram displaying variation the spatial and
temporal extent required for different social processes across a range
of taxa.

<!-- TODO: units of spatial scale? -->

<img src="../graphics/figure1.png" title="(ref:spacetime)" alt="(ref:spacetime)" width="\linewidth" />

# Scale in multilayer networks: a case study

## Caribou socioecology

Here, we use caribou as a case study to develop scale-dependent
multilayer networks based on social (visual and auditory perception),
spatial (habitat type), and temporal (seasonal). Caribou are gregarious
ungulates with fission-fusion dynamics (Lesmerises, Johnson, and
St-Laurent 2018) that display temporal (Peignier et al. 2019) and
spatial (Webber et al. unpublished data) variation in social networks.
In winter, caribou dig holes in the snow, termed craters, to access
forage (Bergerud 1974)<!-- TODO: get Bergerud ref-->. As a result,
caribou tend to occupy and re-use craters once they are established and
there is considerably less access to forage than when the landscape is
snow-free. Importantly, craters exist on the landscape at multiple
scales: the crater scale (a single crater), the feeding area scale
(multiple craters in close proximity), and the winter range scale (all
craters within an individual’s range) (Mayor et al. 2009). The
distribution of forage for caribou is therefore seasonally
heterogeneous, with greater access in snow-free seasons compared to
winter as well as spatially heterogeneous in winter because the
distribution of craters on the landscape varies meaning that access to
vegetation in winter is highly variable for caribou. We therefore
partitioned data into two discrete seasons: summer (3 August - 20
September) and winter (1 January – 17 February) based on caribou
socioecology (Peignier et al. 2019).

## Caribou location data

We used GPS location data collected from Fogo Island caribou in 2017 and
2018. Adult female caribou were immobilized and fitted with global
positioning system (GPS) collars (Lotek Wireless Inc., Newmarket, ON,
Canada, GPS4400M collars, 1,250 g) as described by Schaefer and Mahoney
(2013). Collars were programmed to collect location fixes every 2 hours.
Prior to analyses, we subset GPS fixes into a discrete removed all
erroneous and outlier GPS fixes following (Bjørneraas et al. 2010). We
did not collar all female caribou in the herd; however, we assumed that
our sample of collared animals was random.

## Landscape data and habitat classification

Landcover data were provided by the Newfoundland and Labrador Wildlife
Division. Available landcover classification included nine habitat types
at <!-- TODO:
double check lc res--> 10 m resolution. We reclassified the landcover
types into three categories: foraging habitat, open habitat, and forest
habitat using the R package `raster`
(<span class="citeproc-not-found" data-reference-id="Hijmans_2019">**???**</span>).
Foraging habitat <!-- TODO: "foraging" should
be "lichen" ?--> consisted of lichen habitat, open habitat consisted of
wetland, rocky barrens, and anthropogenic habitat types, while forest
habitat consisted of coniferous forest, conifer scrub, broadleaf forest,
and mixed-wood forest habitat types. Water habitat was excluded from all
subsequent analyses.

## Caribou multilayer social networks

### Network types and construction (defining layers for the multilayer network)

<!-- TODO: should use something like "using syntax from Kivela 2014..." or 
Following [@Kivela_2014]:
other info to maybe include: the multilayer network was not node-aligned since
not all individuals were on all layers
the temporal aspect is ordinal coupling and landcover aspect is categorical coupling

Individuals were subset to ensure they had data collected in both seasons
-->

We generated a multilayer social network consisting 16 individual nodes
and two aspects (season and landcover). Two season elementary-layers
(winter and summer) and three landcover elementary-layers (open, forest
and lichen) combined for a total of six layers. Layers were composed of
individuals represented as nodes and social associations represented as
edges, for each season and landcover combination. Proximity-based social
network layers were generated using the R package `spatsoc` (Robitaille,
Webber, and Wal 2019) in R version 3.6.1 (2019-07-05) (R Core Team
2019). <!-- TODO: FIX VANDER WAL IN SPATSOC REF -->

Within each layer, we assumed individuals were associating if
simultaneous GPS fixes, i.e., recorded within 5 minutes of each other,
were within a given spatial distance of one another. Typically for
ungulates and other gregarious mammals, the ‘chain rule’ is applied for
group assignment. For GPS data, the chain rule is applied if discrete
spatiotemporal GPS fixes buffered by a given distance formed a
contiguous buffer for two or more individuals, even if some individuals
within the buffer were not within the given distance of one another
(Robitaille, Webber, and Wal 2019). Group assignment based on the chain
rule has previously been applied to caribou at a distance of 50 m
(Peignier et al. 2019; Lesmerises, Johnson, and St-Laurent 2018). In all
networks, nodes represented individuals, intralayer edges represented
associations between individuals in a given habitat type and season, and
interlayer edges represented connections between the same individuals
across contexts.

We weighted edges of social networks by the strength of association
between caribou using the simple ratio index (SRI, Cairns and Schwaeger
1987): <!-- TODO: get Cairns ref-->

\[ SRI = \frac{x}{x + y_{AB} + y_{A} + y_{B}} \]

where x is the number of fixes where individuals A and B were within a
given distance of each other, \(y_{A}\) is the number of fixes from
individual A when individual B did not have a simultaneous fix,
\(y_{B}\) is the number of fixes from individual B when individual A did
not have a simultaneous fix, and \(y_{AB}\) is the number of
simultaneous fixes from individuals A and B that were separated by more
than the given distance (D. R. Farine and Whitehead 2015). Social groups
were designated if two or more individuals occurred within a given
distance of one another at any given time point.

### Network metrics

<!-- TODO: expand + simplify + examples individual A, B etc -->

<!-- TODO: EVW "parallelism"? -->

We used a series of metrics to characterize the multilayer networks,
focusing on the role of individuals, importance of individual layers and
the similarity of different layers. To measure the role of individuals,
we calculated degree centrality and graph strength. Degree centrality is
the number of direct connections an individual has to other individuals
in a network layer. Graph strength is the degree weighted by the
strength of association, in this case SRI, in each layer-specific season
and landcover context <!-- TODO:
citation for graph strength?-->. Extending degree centrality, we
calculated multidegree, the sum of degree centrality across layers, and
neighbourhood, the sum of unique neighbours to each individual
(Berlingerio et al. 2012; Kivela et al. 2014). We evaluated the
relevance and redundancy of layers by combining the multidegree and
neighbourhood to calculate connective redundancy and layer relevance.
Connective redundancy is the proportion of neighbours repeated in
multiple layers, and layer relevance is the proportion of neighbours
present in each layer compared to the neighbourhood for each individual
(Berlingerio et al. 2012). Finally, we calculated the similarity of
layers between seasons, across landcover classes (e.g.: winter open
compared to summer open) using the Pearson correlation coefficient
(Br’odka et al. 2018).

## Varying scale in multilayer networks

### Social scale

We altered the social scale based on visual (short distance) and
auditory (long distance) sensory modalities of
caribou<!-- TODO: REF?-->. Specifically, we modified the spatial
distance threshold required for group assignment using `spatsoc`
(Robitaille, Webber, and Wal 2019) (see above) and re-assigned groups at
incremental distances between 5 - 500 m. For example, at the finest
social scale, only individuals within 5 m of one another were considered
in the same group, whereas at the coarsest social scale, individuals
within 500 m of one another were considered in the same group.

### Spatial scale

To assess the influence of spatial scale on multilayer networks, we
aggregated our landcover raster at varying scales relevant to caribou
ecology. We aggregated the 10 m landcover raster using the R package
`grainchanger` (Graham et al. 2019) at five scales: 100 m, 250 m, 500 m,
and 1000 m. Aggregation occurred using a modal moving window method
using a circular window corresponding to the above scales
(<span class="citeproc-not-found" data-reference-id="Graham_2019a">**???**</span>).
We assume 10 m and 100 m represents fine-scale decision making for
caribou during foraging (Webber et al. unpublished data), while
re-sampling at 500 m and 1000 m represents the scale at which caribou
tend to select and avoid habitat (Bastille-Rousseau et al. 2017).

### Temporal scale

<!--TODO: are we missing some mention of 2017 summer and 2018 winter somewhere?-->

We altered the temporal scale of multilayer networks by varying the
length and position of the time window used to define seasons. The
length of the time window varied from 40-100 days using a fixed start
day for winter (starting at 1 January) and summer (starting at 3
August). The position of the time window was shifted by 1-48 days, using
a fixed time window length of 48 days. These new time windows were
iteratively used to partition data into two discrete seasons (winter,
summer) and generate multilayer networks.

Studies of social network analysis vary in the number and frequency of
observations as well as the data collection technique used to generate
networks (Davis et al. 2018; Webber and Vander Wal 2019). In addition to
altering the temporal scale by adjusting the time window, we
investigated the influence of the number of observations on resulting
multilayer networks. We randomly selected 500 timesteps and iteratively
included 25 additional observations, regenerating the multilayer network
and calculating associations of individuals. Subsequent iterations
included the previous set of observations to mimic observational data.
<!-- TODO: bah conclude / this sentence falls off a cliff -->

# Scale in multilayer networks in practice: case study results and discussion

<!-- TODO: make sure we clarify these are means of all individuals? -->

<!-- TODO: discuss layer similarity for social threshold -->

In general, individuals in multilayer networks became more connected as
social scale increased; however, this relationship varied by habitat
type and season. As social scale increased, connective redundancy
increased rapidly when groups were formed up to approximately 100 m
threshold, followed by a plateau and slight decrease at higher
thresholds, presumably due to an increase in summer forest degree at
\~500 m (Figure @ref(fig:socres)d). Regardless of social scale, layer
relevance did not change for any habitat types or seasons, which
suggests habitat-by-season layers captured most, if not all, of the
potential connections an individual would have across all networks
(Figure @ref(fig:socres)b). Finally, somewhat predictably, graph
strength for winter networks increased up to \~100-200 m thresholds,
followed by a plateau, while graph strength for summer networks did not
change as the social threshold increased (Figure @ref(fig:socres)a).
Taken together, these results suggest the optimal social scale at which
groups should be assigned is likely somewhere between \~20-100 m based
on the rate at which network metrics stabilized. For ungulates, groups
are often assigned based on 50 m threshold (Lingle 2003; Lesmeries et
al. 2018; Peignier et al. 2019), suggesting that given similar
quantities of data, \~50 m is likely an ideal social scale for
generating social networks in caribou and similar species.

<!-- landcover resolution
* decreasing availability of patchy lichen = no edges in these layers, though some small proportion of relocations still exist in those layers
* decreasing connective redundancy because through resolution because lichen decreased in connectivity and landcovers became more homogeneous (?)
* decreasing winter lichen relevance because the degree + number of edges decreased
-->

<!-- TODO: discuss things in a,b,c,d order consistently. They shouldn't be presented out of order -->

Increasing the scale of landcover resolution resulted in decreased
proportion of rare and patchy habitats and low connectivity of
individuals in these habitats. In winter, layer relevance was stable for
open and forest habitats but decreased for forage habitats (Figure
@ref(fig:lcres)b). Connective redundancy decreased with increasing
landcover resolution due the decrease in connectivity of individuals in
winter forage habitats, resulting in a multilayer network where
neighbours were less frequently repeated in multiple layers
<!-- TODO: I'm
having a hard time understanding this previous sentence -->
(Figure@ref(fig:lcres)d). Layer similarity was generally stable for
forest and open habitats except for a contrasting increase in similarity
for forest and decrease in similarity for open habitats at 250 m
landcover resolution (Figure @ref(fig:lcres)c). Layer similarity was not
possible to calculate between winter and summer forage because, at all
landcover resolutions greater than 10 m there were no individuals
connected in the network layers. <!-- individuals
still used forage but in much lower proportion + lowered opportunity to
associate --> These results indicate the importance of matching
landcover resolution to scale of selection as well as ensuring the
landcover product used has a resolution fine enough to detect relevant
landscape features and habitats.
<!-- TODO: how? This isn't clear enough for me to follow yet -->

<!-- nobs * common, though at different points - more observations until
stabilizing * we dont see the stabilizing/full plateau for connective redundancy
but appears to be coming.. * still some variability, especially for graph
strength because individuals are differently connected but broad strokes - they
stabilize with more observations -->

As the number of observations used to generate multilayer networks
increased, individuals became more connected and metrics generally
appeared to stabilize. Like coarse landcover resolution (above), low
numbers of observations were not sufficient for capturing individuals in
all contexts and layer similarity could not be calculated below
approximately 75 observations for forest, approximately 210 observations
for open and approximately 300 observations for forage (Figure
@ref(fig:nobs)c). Once sufficient observations were obtained, layer
similarity stabilized for all three landcover classes at approximately
200 observations for forest and approximately 300 observations for open
and forage landcover types. Connective redundancy increased with
increasing number of observations as individuals became more connected
to neighbours in multiple layers (Figure @ref(fig:nobs)d). Given the
overall trend of these multilayer metrics stabilizing after a certain
number of observations are included, the results suggest this
sensitivity method could be useful for determining the number of
observations necessary for sufficiently describing the social dynamics
across contexts.
<!-- TODO: I'm not sure this is relevant since this is the main way it
is already done, can we make this thought more relevant to picking scales or
multilayer networks in general? I think it's important for building robust
networks -->

<!-- win  length * increasing window length = increasingly similar layers and
increasingly redundant edges. more individuals have the opportunity to interact
* increasing window length also leads to increasing similarity between seasons
because seasons are less well defined/include more shoulder seasons * decreasing
graph strength at the upper end of window length in winter showing again
inclusion of more shoulder season * layers are more similarly relevant at high
window length -->

Contrasting winter and summer seasons became more similar with
increasing window length. Layer similarity between seasons increased
consistently across landcover class (Figure @ref(fig:winlen)b).
Individual graph strength and layer relevance increased for all summer
layers as individuals became more connected with increasing window
lengths (Figure @ref(fig:winlen)a, Figure @ref(fig:winlen)b). These
results suggest that an increasing window length, especially for the
summer season, may be resulting in less precisely defined seasons that
are not clearly capturing periods of aggregation and dissaggregation
according to resource availability and presence of conspecifics.
<!-- TODO: ?? -->
<!-- TODO: end with something highlighting this shows it's
important to properly define your season -->
<!-- Similarly, shifting window position of the summer season resulted in an
increase in number of connections between individuals. Layer relevance  -->
<!-- win position * increasing network connectivity in summer when the window
position is moved - these seasons are more similar than the original window
position * same theme shown in the connective redundancy * quite variable layer
similarity, not sure what to pull out of that one * increased graph strength for
winter down the middle, with generally increasing summer layers - again where
the season is including more shoulder season potentially -->
<!-- Shifting window position results showed increasing layer similarity  -->
**Missing: discussion of window position..**

<!--
## Each metric's interpretation
* Degree: the number of direct connections an individual has to other individuals in the network. High degree = connected to many indviduals in a single layer. Low degree = not connected to many individuals in a single layer.

* Multidegree: sum of degree across layers. High multidegree = connected to many
individuals across layers. Low multidegree = not connected to many individuals
across layers.

* Degree deviation: standard **[??]** deviation of degree across layers. High degree deviation =
large difference between degree for an individual across layers. Low degree
deviation = individuals are similarly connected across layers.

* Graph strength: the sum of all the edge weights directly connected to an actor, sometimes called weigthed degree. High graph strength = highly social, connected to many individuals and/or having stronger, high-valued connections between individuals. Low graph strength = not very social, connected to few individuals and/or having weak, low-valued connections between individuals. Not summed in this case across layers.

* Neighbours: number of unique individuals adjacent to each actor. Considered in
a single layer, this is equal to the degree.

* Neighbourhood: number of unique individuals across all layers. High
neighbourhood = a high number of unique individuals connected to an actor. Low
neighbourhood = a low number of unique individuals connected to an actor. 

* Relevance: layer centric metric, corresponding to the number of neighbours on a
layer divided by the total neighbourhood for each actor. High relevance = the layer is highly relevant to the individuals connections. A low
relevance means this layer does not contribute many neighbours to an individuals
overall neighbourhood.

* Connective redundancy: the total multilayer neighbourhood divided by the
multidegree. High connective redundancy indicates a multilayer network that has
many repeated edges across layers between an actor and its neighbours. Low
connective redundancy indicates that each layer is important for preserving all
social ties.

* Layer similarity: how similar each layer is (Brodka 2018). Pearson's
correlation coefficient of degree vectors for each layer, comparing each
landcover across seasons.


-->

(ref:socres) Varying scale in social threshold. For each social
threshold (5 m, 50 m, 100 m, 150 m, 200 m, 250 m, 300 m, 350 m, 400 m,
450 m, 500 m), multilayer networks were constructed for each landcover
class (forest, lichen and open) across two seasons (summer and winter)
and four network metrics calculated. A) Mean graph strength across
individuals showed an increase for winter network layers at 50 m through
500 m while summer network layers had consistently weak connections. B)
Mean layer relevance was relatively stable across social thresholds for
each season and landcover layer. C) Similarity of landcover network
layers between seasons (e.g.: open summer compared to open winter)
showed different responses to changing landcover scale with an overall
increase in similarity for open layers and decrease in similarity for
lichen layers. <!--TODO: what about forest.--> D) Mean connective
redundancy across individuals increased rapidly between 5 m and 50 m
reaching a plateau of about 0.65 at approximately a 50 m
<!--TODO:**??**--> social threshold before decreasing between 400 m and
500 m.

<img src="../graphics/figure-spatialthreshold.png" title="(ref:socres)" alt="(ref:socres)" width="\linewidth" />

(ref:lcres) Variation in multilayer network metrics as a function of
changes in landcover resolution, a metric which we interpret as spatial
scale. For each landcover resolution (10 m, 100 m, 250 m, 500 m and 1000
m), multilayer networks were constructed for each landcover class
(forest, lichen and open) across two seasons (summer and winter), and
four network metrics were calculated and we examined how network metrics
changed as a function of changes in spatial scale. A) Mean graph
strength of individuals was weaker during the summer compared to the
winter months. B) Mean layer relevance showed sparse connectivity in
summer compared to winter networks and a decrease in winter lichen layer
relevance at higher landcover resolutions. C) Similarity of landcover
network layers between seasons (e.g.: open summer compared to open
winter) showed different responses to changing landcover scale with an
increase in similarity for forest layers at 250 m and decrease in
similarity for open layers at 250 m. Note that lichen layer similarity
is not shown because individuals did not interact in lichen habitats
greater greater than 10 m landcover resolution. D) Mean connective
redundancy across individuals showed a decreasing trend with increasing
landcover resolution.

<img src="../graphics/figure-lcres.png" title="(ref:lcres)" alt="(ref:lcres)" width="\linewidth" />

<!-- TODO: RO first sentence... -->

(ref:nobs) Varying scale in number of observations. For each iteration,
a number of observations (10-485 observations in steps of 25) were
selected from the complete data set to construct multilayer networks
with layers defined by each landcover class (forest, lichen and open)
across two seasons (summer and winter) and four network metrics
calculated. A) Mean graph strength across individuals varied for winter
layers becoming relatively stable at 200 observations and remained weak
throughout for summer layers. B) Mean layer relevance across individuals
increased for winter layers and slightly increased for summer layers. C)
Similarity of landcover network layers between seasons (e.g.: open
summer compared to open winter) showed a stabilizing layer similarity at
200 observations for forest and 300 observations for lichen and open.
<!--TODO:*There were observations of individuals in lichen and open areas at lower numbers of observations during the winter, so layer similarity could not be calculated at these values.* **Brief explanation of why two landcover don't have values at lower nobs??**.-->
D) Mean connective redundancy across individuals increased with
increasing number of observations, which begins to plateau around 100
observations.

<img src="../graphics/figure-nobs.png" title="(ref:nobs)" alt="(ref:nobs)" width="\linewidth" />

(ref:winlen) Varying scale in time window length. For each time window
length (40 to 100 days in length increasing by 5 days in sequence),
multilayer networks were constructed for each landcover class (forest,
lichen and open) across two seasons (summer and winter) and four network
metrics calculated. A) Mean graph strength across individuals was
relatively stable over increasing time window lengths, though there was
more variation in strength between landcover types as window length
increased.
<!--TODO:**[see if you agree with my changes. B-D were based off fig. 3 and not relevant to this figure]**-->
B) Mean layer relevance generally increased during the summer months but
was relatively stable across time window lengths for each landcover
layer. C) Similarity of landcover network layers between seasons (e.g.:
open summer compared to open winter) showed increasing similarity
consistent across landcover layers with increasing window length. D)
Mean connective redundancy across individuals varied dramatically
depending on the length of the time window
<!--TODO:**[JWT: previously this was describing fig. 3. I don't know if what I wrote best encapsulates what connnective redundancy does here. Length of time window seems to make connective redundancy highly variable as it changes.]**.-->

<img src="../graphics/figure-winlength.png" title="(ref:winlen)" alt="(ref:winlen)" width="\linewidth" />

(ref:winpos) Varying scale in time window position. For each time window
position (shifting the start date of the time window used to define
seasons 1 to 48 days from the original), multilayer networks were
constructed for each landcover class (forest, lichen and ope) across two
seasons (summer and winter) and four network metrics calculated. A) Mean
graph strength across individuals increased in summer network layers at
window position 25 and increased between window position 20 and 40 for
winter network layers. B) Mean layer relevance slightly decreased for
winter layers and increased for summer layers, showing decreasing
connectivity in shifted winter time windows and greater connectivity in
summer layers at later window positions. C) Similarity of landcover
network layers between seasons (e.g.: open summer compared to open
winter) showed fluctuations in layer similarity across landcover types
with shifted time windows.
<!--TODO:**[JWT: previously describing window length, not position. Check that you're ok with my changes]**-->
D) Mean connective redundancy across individuals increased between
window position 12 through 48 due to increased connectivity in the
summer network layers.

<img src="../graphics/figure-winpos.png" title="(ref:winpos)" alt="(ref:winpos)" width="\linewidth" />

# Perspectives to advance multilayer networks

The integration of behavioural and ecological theory has shown the value
of considering the importance of various ecological disciplines to
better understand and predict animal social networks, including
demography (Shizuka and Johnson 2019), evolutionary and quantitative
genetics (Fisher and McAdam 2017), disease ecology (Silk et al. 2017),
and animal personality (Sih et al. 2017). While the number of studies
integrating social network theory into a broader array of behavioural
and ecological sub-disciplines is impressive, only recently has the role
of animal space use been considered in describing the causes and
consequences of the social environment in the context of (1) phenotypes
and individual fitness
(<span class="citeproc-not-found" data-reference-id="Webber_2018">**???**</span>),
(2) movement ecology and collective movement (Bode, Wood, and Franks
2011), and (3) habitat selection and space use (He, Maldonado-Chaparro,
and Farine 2019). Importantly, much of the work linking space use and
the social environment has been theoretical and empirical studies are
lacking (but see Peignier et al. 2019; Pinter-Wollman 2015;
Strandburg-Peshkin et al. 2015; 2017). Here, we discuss the role
mutlilayer networks within the emerging integration of social and
spatial ecology within the behavioural ecology literature.

## Phenotypes and Individual fitness

Social network positions are frequently used to represent the social
environment that an individual experiences or their social phenotype.
Social phenotypes are increasingly linked to important fitness for
individuals of various species, including primates (e.g. Brent,
Ruiz-Lambides, & Platt, 2017; Thompson, 2019), dolphins (e.g. Stanton &
Mann, 2012; Stanton, Gibson, & Mann, 2011), and birds (e.g. McDonald,
2007; Royle, Pike, Heeb, Richner, & Kolliker, 2012). Both temporal,
seasons and stages of life, and social scales, types of interactions,
have emerged as important for understanding fitness consequences in the
context of social network positions (Almeling, Hammerschmidt,
Sennhenn-Reulen, Freund, & Fischer, 2016; Berger, Lemaître, Allainé,
Gaillard, & Cohas, 2015; Brent, Ruiz-Lambides, & Platt, 2017; Holekamp,
Smith, Strelioff, Van Horn, & Watts, 2012). Multilayer networks provide
a way to bridge these different scales so that we can examine social
phenotypes in more holistic ways rather than looking at each scale
separately as has traditionally been done.

For instance, social scale is major consideration for social network
analysis, especially in the context of different types of relationships,
such as grooming and association, that are typically examined separately
while answering a single question (Castles et al. 2014;
<span class="citeproc-not-found" data-reference-id="Cater_2015">**???**</span>;
D. R. Farine 2015). Furthermore, it is a common trope that individuals
must be associating to interact, and many studies therefore assume that
proximity is proxy for interacting (Farine, 2015). For instance, baboons
need to be in proximity in order to groom each other. However, animals
have certain interactions that do not require proximity such as
long-distance vocalization and olfactory signals (Carter, Lee, and
Marshall 2015) With the advancement of biologging technology, we have
the ability to record social interactions that do not require proximity,
particularly long-distance communication networks with devices like
microphone arrays (Snijders & Naguib, 2017). These varying social scales
can have different fitness repercussions for individuals. Rhesus
macaques (*Macaca mulatta*) had higher survivorship when they had fewer
but stronger, more stable social associates and grooming partners rather
than simply more associates (Ellis, Snyder-Mackler, Ruiz-Lambides,
Platt, & Brent, 2019). This finding highlights that different qualities
of social scales have lasting consequences.

Temporal scale is also important for understanding the repercussions of
social phenotypes. For instance, social phenotypes can change over
ontogeny in ways that can affect fitness (Berger et al., 2015; Brent et
al., 2017). Thus, it is critical to carefully consider the temporal
scale that is meaningful for the proposed hypotheses. Further
complicating the issue of selecting suitable time scales across
ontogeny, individuals progress through development at different rates
(Tarka, Guenther, Niemelä, Nakagawa, & Noble, 2018). This variation can
make defining appropriate temporal scales for testing the fitness
implications of an individual’s social phenotype over different stages
of ontogeny even more difficult when they vary by individual. However,
considering fine temporal scales provide insight across developmental
stages that may otherwise be missed (Turner, Bills, & Holekamp, 2018).

Multilayer networks provide unique opportunities and challenges, linking
these various scales, for understanding the social phenotypes and
environments of individuals and their fitness outcomes. The multilayer
network framework enables researchers to examine these different social
scales simultaneously rather than individually, which is what has been
done under most circumstances, but is not very realistic. Metrics from
multilayer networks provide an opportunity to simplify statistical
models. Interactions that happen side-by-side, proximity associations,
and long-distance interactions can be encapsulated in a single
multilayer network, and a single metric can be used to describe the
various social scales of an individual’s network position. This
multilevel network metric could be used to assess the relationship
between an individual’s social phenotype and fitness. It would also be a
meaningful simplification of many network metrics that could help
simplify statistical analyses and deal with the frequent correlations
between social network metrics in different types of networks (Castles
et al. 2014). Furthermore, multilayer networks provide a framework to
test hypotheses linking social phenotypes and fitness across temporal
scales. Because of the non-independent nature of social interactions and
associations, especially over time, it is hard to test hypotheses about
social dynamics with a suitable null control (Farine, 2017; Proskurnikov
& Tempo, 2017). Using the framework of multilayer networks, making
layers of different temporal periods provides a way to make appropriate
null models to test questions about the dynamics of an individual’s
social network position over multiple aggregated time periods.

On the other hand, picking the proper temporal scale is important but a
challenge because all layers in the multilayer network should reflect
the same time period, and the period should be long enough for each
layer to have enough data for robust networks (Farine, 2017). These
considerations may be limiting factors when answering questions that
require timeframes that are relevant to different individuals, for
instance. In both mono- and multilayer networks, the effect of scale on
the relationship between an individual’s social network position and
fitness need to be considered based on the hypotheses being tested and
logistical constraints.

## Movement ecology and collective movement

Social processes, movement decisions, and space use are inextricably
linked and multilayer networks represent a potential analytical
framework for linking these processes
(<span class="citeproc-not-found" data-reference-id="Mourier_2019">**???**</span>)
(Mourier et al. 2019). Movement as a collective group can reduce per
capita predation risk via detection-dilution trade-offs and improve
information transfer about the quality or location of resources to other
group members (Jolles, King, and Killen 2019). In our case study, we
integrate proximity based social networks that inherently rely on animal
collective movement and, in general, we found that movement is likely an
important mechanism driving social network connectivity within and
between habitat types.

Although multilayer animal social networks are relatively novel (Silk et
al. 2018), movement behaviour within multilayer networks has been
considered. Spatial networks are physical locations (nodes) which are
connected in a network when individuals move between said locations
(edges). For example, spatial networks were applied to monitor movement
of sharks (*Carcharhinus amblyrhynchos* and *Carcharhinus melanopterus*)
between fixed location autonomous arrays. In this example, nodes
represent locations within the array, *intralayer edges* represent
individual movement frequency, and *interlayer edges* represent contact
probability among individuals at a given node
(<span class="citeproc-not-found" data-reference-id="Mourier_2019">**???**</span>)
(Mourier et al. 2019). Although movement between fixed arrays is
inherent, networks are not constructed based on continuous measures of
dyadic or collective movement (Long et al. 2014). Our case study builds
on the work of Mourier et al. (2019) and explicitly integrates
continuous and simultaneous measures of animal movement through space
and time as layers of a multilayer social network.

In contrast to spatial networks, where nodes represent spatial locations
that are fixed in space, movement networks can represent continuous and
simultaneous movement trajectories of multiple animals. In a recent
study of vulturine gunieafowl (*Acryllium vulturinum*), GPS movement
data were used to generate monolayer association networks within a
multilayer network (Papageorgiou et al. 2019). However, despite
potential to generate networks in different spatial or social contexts,
layers in the multilayer network represented social associations within
and between groups. Continuous collection of animal relocation data
using GPS technology can be used to measure how groups of animals make
collective movement decisions in the context of their local environment
(Strandburg-Peshkin et al. 2015, 2017) and across scales. A collective
movement layer could constitute similarity in movement for dyads (Long
et al. 2014) or groups (Bode, Wood, and Franks 2011). This movement
layer could be made at a fine (i.e. minute-to-minute: Cleasby et al.
2019) or coarse scale (global migration: Flack et al. 2018). Our case
study integrates variation in temporal and spatial scale to assess the
role of scale in predicting multilayer networks. As one might expect, we
found increasing spatial scale results in saturation of potential social
connections (Figure 3), while increasing temporal scale had little
effect on habitat-specific networks (Figure 5). Another potential
application would be to generate social networks during times when
animals are engaged in different behaviours, including traveling,
interacting, or foraging (Muller et al. 2018; Finn et al. 2019) and
construct a multilayer network based on behaviour-specific monolayer
networks
(e.g. <span class="citeproc-not-found" data-reference-id="Smith_Aguilar_2019">**???**</span>).

Importantly, the key to incorporating movement in multilayer networks
across scales is the technological advancements available to overcome
previous limitations (Hughey et al. 2018). Biologging and wildlife
tracking technology has advanced to the point where relocations can be
programmed to occur as frequently as each second
(<span class="citeproc-not-found" data-reference-id="Börger_2016">**???**</span>),
a practice which has been applied to questions of collective movement
(e.g Strandburg-Peshkin et al. 2015). Meanwhile, remote sensing
technology, including unmanned aerial vehicles and satellites, can be
used to track the fine-scale movements of groups over large distances
and time scales (Torney et al. 2018). Using technology to infer
behaviour has therefore become standard operating procedure for many
species in many systems. Our ability to collect and process remotely
sensed data and infer social processes based on animal movement provides
an opportunity to use multilayer social network analysis to answer
complex questions about animal socioecology.

Given the existing framework for constructing multilayer networks from
behavioural layers
(e.g. <span class="citeproc-not-found" data-reference-id="Smith_Aguilar_2019">**???**</span>),
monolayer networks that explicity quantify movement paramters could be
itnegrated. For example, edges could represent measures of dyadic or
collective movement based on dynamic interaction metrics (Long et al.
2014). Integrating movement layers with habitat-specific social
association layers could further shed light on the role of movement as a
driver of the social and spatial environments an individual experiences
(<span class="citeproc-not-found" data-reference-id="Webber_2018">**???**</span>).
In our case study, we generated multilayer networks based on
habitat-specific monolayers. Coordinated movement of dyads, or groups,
could vary based on habitat, and the approach we outline could be used
to explore mechanisms linking the social and spatial environments. For
example, social processes may be an emergent property of the landscape
because animals aggregate at resources, such as waterholes
(<span class="citeproc-not-found" data-reference-id="Chamaillé_Jammes_2008">**???**</span>).
Movement to, from, or within habitat patches or territories can also
contribute to the formation of the social environment (Spiegel et al.
2016). For example, in sleepy lizards (*Tiliqua rugosa*) males
interacted primarily at home range edges, presumably driving territorial
behaviour
(<span class="citeproc-not-found" data-reference-id="Spiegel_2018">**???**</span>).
Incorporating movement ecology within a multilayer network framework is
a logical next step for a burgeoning field. In particular, when
association networks are habitat-specific, we suggest the integration of
movement and space use in multilayer networks provides novel insights
into the effects of habitat configuration on the formation of the social
environment (He, Maldonado-Chaparro, and Farine 2019).

## Habitat selection and space use

<!--
* Social structure is influenced by large scale processes such as resource availability and seasonality [@Peigner_2019], configuration [@He_2019] and fragmentation [@Banks_2007].
* Habitat selection definition
* johnson's four scales of selection and Mayor 2009 habitat selection across scales
* habitat selection influences social structure since resource availability + quality influence home range size and overlap
* individuals must share space to interact [@Farine_2015]
* multilayer networks represent a novel framework for considering habitat selection and space use on sociality across scales

individual differences in habitat selection
-->

Social structure is influenced by large scale processes such as resource
availability and seasonality
(<span class="citeproc-not-found" data-reference-id="Peigner_2019">**???**</span>),
configuration (He, Maldonado-Chaparro, and Farine 2019) and
fragmentation
(<span class="citeproc-not-found" data-reference-id="Banks_2007">**???**</span>).
Habitat selection is the “disproportionate use of available” (Mayor et
al. 2009) landscape resources or features by animals. Johnson (1980)
identified four orders of habitat selection: (1) the geographical range
of a species, (2) the home range of an individual, (3) the habitat
patches within the home range and (4) specific resources within a
habitat patch. Combined, habitat selection and social structure are
intimately linked as individuals must share space to interact (D. R.
Farine and Whitehead 2015) and resource availability and quality
influence home range size and overlap. Multilayer networks represent a
novel framework for considering the influence of habitat selection and
space use on sociality across scales.

<!--
* multilayer networks are new but folks have looked at habitat selection + sociality
  * Fortin
  * Banks
  * McLoughlin
  
* none use a multilayer framework to explicitly combine
-->

Despite not in a multilayer network context, the link between habitat
and sociality has been previously investigated. Fortin et al. (2009)
evaluated habitat selection and group formation and division in bison.
They observed contrasting group sizes in meadows and forests as well as
identified predation risk avoidance as a main factor in their habitat
selection
(<span class="citeproc-not-found" data-reference-id="Fortin_2009">**???**</span>).
A review of the influence of habitat fragmentation on sociality noted
decreased group size in small patches compared to large, continuous
landscapes
(<span class="citeproc-not-found" data-reference-id="Banks_2007">**???**</span>).
Finally, McLoughlin (2000) showed variable responses in brown bears
(*Ursus arctos*) to seasonality, a proxy in this case for habitat
quality, showing high home range overlap in areas of low and high
seasonality and low home range overlap in areas of moderate seasonality.
Despite these, *missing multilayer approach*.

<!--

Scale + habitat selection and space use
types of scale to consider in these types of ML nets



McGarigal 2016 organisms select habitat at multiple scales, temporal spatial 
should investigate scale dependency. linking ecological processes to scale eg foraging or predator-prey dynamics


Johnson 1980 1st order = selection of the physical or geographical range of a species
2nd order = selection of a home range of an individual or social group
3rd order = selection of various habitat patches within the home range 
4th order = selection of specific resources within a habitat patch

* Mayor et al. 2009 paper 
* MRSF Laforge paper 
* van Beest et al. 2014 scale paper 
* Habitat–performance relationships: finding the right metric at a given spatial scale Jean-Michel Gaillard1,*, Mark Hebblewhite2, Anne Loison3, Mark Fuller4, Roger Powell5, Mathieu Basille1,6 and Bram Van Moorter1
* Multi-scale habitat selection modeling: a review and outlook
-->

Scale in habitat selection… Mayor (2019)

<!--
how to combine moving forward
multilayer networks across landcover types
in areas of high selection/low selection or favorable/unfavorable habitat
combined with seasonality

in our case study, we looked at increase spatial scales of landcover metrics

we could define layers of the multilayer network according to home range overlap 
instead of specific associations
looking at broader temporal scales and coarser spatial resolutions
-->

How to combine moving forward: habitat selection, space use, multiple
scales, multilayer networks Sociality across scales eg home range
overlap and interactions Layers defined by habitat/landcover

# Conclusions

Silk et al. (2018) presented some key multilayer questions in animal
behaviour research. While these questions represent an important
starting point for multilayer networks, we present an additional set of
questions relevant to the promise and problem of scale in mutlilayer
networks:

1.  How do social phenotypes across scales differently influence
    fitness? Are some temporal or social scales better predictors for
    different fitness metrics?

2.  Why do individuals associate more strongly with certain conspecifics
    in some habitats? What, if any, is the role of movement in the
    context of habitat networks?

3.  How, and why, does the spatial scale of perception influence,
    e.g. auditory, visual, or chemotaxis, influence the social
    environment across scales? What is the role of memory, and by
    extension social and spatial cognition, as animals navigate their
    environment and make decisions about where to move next?

# Acknowledgements

We thank all members of the Wildlife Evolutionary Ecology Lab, including
J. Hendrix, K. Kingdon, S. Boyle, C. Prokopenko, I. Richmond, J. Hogg,
and L. Newediuk for their comments on previous versions of this
manuscript as well as D. C. Schneider for inspiration and helpful
discussions about scale. Funding for this study was provided by a Vanier
Canada Graduate Scholarship to QMRW and a NSERC Discovery Grant to EVW.

# References

<div id="refs" class="references">

<div id="ref-Allen_2015">

Allen, Timothy F. H., and Thomas W. Hoekstra. 2015. *Toward a Unified
Ecology*. Columbia University Press.
<https://doi.org/10.7312/alle06918>.

</div>

<div id="ref-Berlingerio_2012">

Berlingerio, Michele, Michele Coscia, Fosca Giannotti, Anna Monreale,
and Dino Pedreschi. 2012. “Multidimensional Networks: Foundations of
Structural Analysis.” *World Wide Web* 16 (5-6): 567–93.
<https://doi.org/10.1007/s11280-012-0190-4>.

</div>

<div id="ref-Bjørneraas_2010">

Bjørneraas, KARI, BRAM MOORTER, CHRISTER MOE ROLANDSEN, and IVAR
HERFINDAL. 2010. “Screening Global Positioning System Location Data for
Errors Using Animal Movement Characteristics.” *The Journal of Wildlife
Management* 74 (6): 1361–6.
<https://doi.org/10.1111/j.1937-2817.2010.tb01258.x>.

</div>

<div id="ref-Bode_2011">

Bode, Nikolai W. F., A. Jamie Wood, and Daniel W. Franks. 2011. “The
Impact of Social Networks on Animal Collective Motion.” *Animal
Behaviour* 82 (1): 29–38.
<https://doi.org/10.1016/j.anbehav.2011.04.011>.

</div>

<div id="ref-Br_dka_2018">

Br’odka, Piotr, Anna Chmiel, Matteo Magnani, and Giancarlo Ragozini.
2018. “Quantifying Layer Similarity in Multiplex Networks: A Systematic
Study.” *Royal Society Open Science* 5 (8): 171747.
<https://doi.org/10.1098/rsos.171747>.

</div>

<div id="ref-Carter_2015">

Carter, Alecia J., Alexander E. G. Lee, and Harry H. Marshall. 2015.
“Research Questions Should Drive Edge Definitions in Social Network
Studies.” *Animal Behaviour* 104 (June): e7–e11.
<https://doi.org/10.1016/j.anbehav.2015.03.020>.

</div>

<div id="ref-Castles_2014">

Castles, Madelaine, Robert Heinsohn, Harry H. Marshall, Alexander E. G.
Lee, Guy Cowlishaw, and Alecia J. Carter. 2014. “Social Networks Created
with Different Techniques Are Not Comparable.” *Animal Behaviour* 96
(October): 59–67. <https://doi.org/10.1016/j.anbehav.2014.07.023>.

</div>

<div id="ref-Chave_2013">

Chave, J’erôme. 2013. “The Problem of Pattern and Scale in Ecology: What
Have We Learned in 20 Years?” Edited by Jordi Bascompte. *Ecology
Letters* 16 (January): 4–16. <https://doi.org/10.1111/ele.12048>.

</div>

<div id="ref-Cleasby_2019">

Cleasby, Ian R., Ewan D. Wakefield, Barbara J. Morrissey, Thomas W.
Bodey, Steven C. Votier, Stuart Bearhop, and Keith C. Hamer. 2019.
“Using Time-Series Similarity Measures to Compare Animal Movement
Trajectories in Ecology.” *Behavioral Ecology and Sociobiology* 73 (11).
<https://doi.org/10.1007/s00265-019-2761-1>.

</div>

<div id="ref-Elith_2009">

Elith, Jane, and John R. Leathwick. 2009. “Species Distribution Models:
Ecological Explanation and Prediction Across Space and Time.” *Annual
Review of Ecology, Evolution, and Systematics* 40 (1): 677–97.
<https://doi.org/10.1146/annurev.ecolsys.110308.120159>.

</div>

<div id="ref-Farine_2015a">

Farine, Damien R. 2015. “Proximity as a Proxy for Interactions: Issues
of Scale in Social Network Analysis.” *Animal Behaviour* 104 (June):
e1–e5. <https://doi.org/10.1016/j.anbehav.2014.11.019>.

</div>

<div id="ref-Farine_2015">

Farine, Damien R., and Hal Whitehead. 2015. “Constructing, Conducting
and Interpreting Animal Social Network Analysis.” Edited by Sonia
Altizer. *Journal of Animal Ecology* 84 (5): 1144–63.
<https://doi.org/10.1111/1365-2656.12418>.

</div>

<div id="ref-Field_2009">

Field, Richard, Bradford A. Hawkins, Howard V. Cornell, David J. Currie,
J. Alexandre F. Diniz-Filho, Jean-François Gu’egan, Dawn M. Kaufman, et
al. 2009. “Spatial Species-Richness Gradients Across Scales: A
Meta-Analysis.” *Journal of Biogeography* 36 (1): 132–47.
<https://doi.org/10.1111/j.1365-2699.2008.01963.x>.

</div>

<div id="ref-Finn_2019">

Finn, Kelly R., Matthew J. Silk, Mason A. Porter, and Noa
Pinter-Wollman. 2019. “The Use of Multilayer Network Analysis in Animal
Behaviour.” *Animal Behaviour* 149 (March): 7–22.
<https://doi.org/10.1016/j.anbehav.2018.12.016>.

</div>

<div id="ref-Flack_2018">

Flack, Andrea, M’at’e Nagy, Wolfgang Fiedler, Iain D. Couzin, and Martin
Wikelski. 2018. “From Local Collective Behavior to Global Migratory
Patterns in White Storks.” *Science* 360 (6391): 911–14.
<https://doi.org/10.1126/science.aap7781>.

</div>

<div id="ref-Graham_2019">

Graham, Laura J., Rebecca Spake, Simon Gillings, Kevin Watts, and Felix
Eigenbrod. 2019. “Incorporating Fine-Scale Environmental Heterogeneity
into Broad-Extent Models.” Edited by Nick Isaac. *Methods in Ecology and
Evolution* 10 (6): 767–78. <https://doi.org/10.1111/2041-210x.13177>.

</div>

<div id="ref-He_2019">

He, Peng, Adriana A. Maldonado-Chaparro, and Damien R. Farine. 2019.
“The Role of Habitat Configuration in Shaping Social Structure: A Gap
in Studies of Animal Social Complexity.” *Behavioral Ecology and
Sociobiology* 73 (1). <https://doi.org/10.1007/s00265-018-2602-7>.

</div>

<div id="ref-Hughey_2018">

Hughey, Lacey F., Andrew M. Hein, Ariana Strandburg-Peshkin, and Frants
H. Jensen. 2018. “Challenges and Solutions for Studying Collective
Animal Behaviour in the Wild.” *Philosophical Transactions of the Royal
Society B: Biological Sciences* 373 (1746): 20170005.
<https://doi.org/10.1098/rstb.2017.0005>.

</div>

<div id="ref-Jolles_2019">

Jolles, Jolle W., Andrew J. King, and Shaun S. Killen. 2019. “The Role
of Individual Heterogeneity in Collective Animal Behaviour.” *Trends in
Ecology & Evolution*, December.
<https://doi.org/10.1016/j.tree.2019.11.001>.

</div>

<div id="ref-Kivela_2014">

Kivela, M., A. Arenas, M. Barthelemy, J. P. Gleeson, Y. Moreno, and M.
A. Porter. 2014. “Multilayer Networks.” *Journal of Complex Networks* 2
(3): 203–71. <https://doi.org/10.1093/comnet/cnu016>.

</div>

<div id="ref-Legendre_1993">

Legendre, Pierre. 1993. “Spatial Autocorrelation: Trouble or New
Paradigm?” *Ecology* 74 (6): 1659–73. <https://doi.org/10.2307/1939924>.

</div>

<div id="ref-Lesmerises_2018">

Lesmerises, Fr’ed’eric, Chris J. Johnson, and Martin-Hugues St-Laurent.
2018. “Landscape Knowledge Is an Important Driver of the Fission
Dynamics of an Alpine Ungulate.” *Animal Behaviour* 140 (June): 39–47.
<https://doi.org/10.1016/j.anbehav.2018.03.014>.

</div>

<div id="ref-Levin_1992">

Levin, Simon A. 1992. “The Problem of Pattern and Scale in Ecology: The
Robert H. MacArthur Award Lecture.” *Ecology* 73 (6): 1943–67.
<https://doi.org/10.2307/1941447>.

</div>

<div id="ref-Long_2014">

Long, Jed A., Trisalyn A. Nelson, Stephen L. Webb, and Kenneth L. Gee.
2014. “A Critical Examination of Indices of Dynamic Interaction for
Wildlife Telemetry Studies.” Edited by Luca Börger. *Journal of Animal
Ecology* 83 (5): 1216–33. <https://doi.org/10.1111/1365-2656.12198>.

</div>

<div id="ref-Luther_2009">

Luther, David. 2009. “The Influence of the Acoustic Community on Songs
of Birds in a Neotropical Rain Forest.” *Behavioral Ecology* 20 (4):
864–71. <https://doi.org/10.1093/beheco/arp074>.

</div>

<div id="ref-Mayor_2007">

Mayor, S. J., J. A. Schaefer, D. C. Schneider, and S. P. Mahoney. 2007.
“SPECTRUM OF SELECTION: NEW APPROACHES TO DETECTING THE
SCALE-DEPENDENT RESPONSE TO HABITAT.” *Ecology* 88 (7): 1634–40.
<https://doi.org/10.1890/06-1672.1>.

</div>

<div id="ref-Mayor_2009">

Mayor, Stephen J., David C. Schneider, James A. Schaefer, and Shane P.
Mahoney. 2009. “Habitat Selection at Multiple Scales.” *Écoscience* 16
(2): 238–47. <https://doi.org/10.2980/16-2-3238>.

</div>

<div id="ref-Muller_2018">

Muller, Zoe, Mauricio Cantor, Innes C. Cuthill, and Stephen Harris.
2018. “Giraffe Social Preferences Are Context Dependent.” *Animal
Behaviour* 146 (December): 37–49.
<https://doi.org/10.1016/j.anbehav.2018.10.006>.

</div>

<div id="ref-Papageorgiou_2019">

Papageorgiou, Danai, Charlotte Christensen, Gabriella E. C. Gall, James
A. Klarevas-Irby, Brendah Nyaguthii, Iain D. Couzin, and Damien R.
Farine. 2019. “The Multilevel Society of a Small-Brained Bird.” *Current
Biology* 29 (21): R1120–R1121.
<https://doi.org/10.1016/j.cub.2019.09.072>.

</div>

<div id="ref-Peignier_2019">

Peignier, M’elissa, Quinn M. R. Webber, Erin L. Koen, Michel P. Laforge,
Alec L. Robitaille, and Eric Vander Wal. 2019. “Space Use and Social
Association in a Gregarious Ungulate: Testing the Conspecific Attraction
and Resource Dispersion Hypotheses.” *Ecology and Evolution* 9 (9):
5133–45. <https://doi.org/10.1002/ece3.5071>.

</div>

<div id="ref-R_Core_Team_2019">

R Core Team. 2019. *R: A Language and Environment for Statistical
Computing*. Vienna, Austria: R Foundation for Statistical Computing.
<https://www.R-project.org/>.

</div>

<div id="ref-Robitaille_2019">

Robitaille, Alec L., Quinn M. R. Webber, and Eric Vander Wal. 2019.
“Conducting Social Network Analysis with Animal Telemetry Data:
Applications and Methods Using Spatsoc.” Edited by Nick Golding.
*Methods in Ecology and Evolution* 10 (8): 1203–11.
<https://doi.org/10.1111/2041-210x.13215>.

</div>

<div id="ref-Silk_2018">

Silk, Matthew J., Kelly R. Finn, Mason A. Porter, and Noa
Pinter-Wollman. 2018. “Can Multilayer Networks Advance Animal Behavior
Research?” *Trends in Ecology & Evolution* 33 (6): 376–78.
<https://doi.org/10.1016/j.tree.2018.03.008>.

</div>

<div id="ref-Spiegel_2016">

Spiegel, Orr, Stephan T. Leu, Andrew Sih, and C. Michael Bull. 2016.
“Socially Interacting or Indifferent Neighbours? Randomization of
Movement Paths to Tease Apart Social Preference and Spatial
Constraints.” Edited by Tamara Münkemüller. *Methods in Ecology and
Evolution* 7 (8): 971–79. <https://doi.org/10.1111/2041-210x.12553>.

</div>

<div id="ref-Strandburg_Peshkin_2015">

Strandburg-Peshkin, A., D. R. Farine, I. D. Couzin, and M. C. Crofoot.
2015. “Shared Decision-Making Drives Collective Movement in Wild
Baboons.” *Science* 348 (6241): 1358–61.
<https://doi.org/10.1126/science.aaa5099>.

</div>

<div id="ref-Strandburg_Peshkin_2017">

Strandburg-Peshkin, Ariana, Damien R Farine, Margaret C Crofoot, and
Iain D Couzin. 2017. “Habitat and Social Factors Shape Individual
Decisions and Emergent Group Structure During Baboon Collective
Movement.” *eLife* 6 (January). <https://doi.org/10.7554/elife.19505>.

</div>

<div id="ref-Sugihara_1989">

Sugihara, G, K Schoenly, and A Trombla. 1989. “Scale Invariance in Food
Web Properties.” *Science* 245 (4913): 48–52.
<https://doi.org/10.1126/science.2740915>.

</div>

<div id="ref-Torney_2018">

Torney, Colin J., Myles Lamont, Leon Debell, Ryan J. Angohiatok,
Lisa-Marie Leclerc, and Andrew M. Berdahl. 2018. “Inferring the Rules of
Social Interaction in Migrating Caribou.” *Philosophical Transactions of
the Royal Society B: Biological Sciences* 373 (1746): 20170385.
<https://doi.org/10.1098/rstb.2017.0385>.

</div>

</div>
