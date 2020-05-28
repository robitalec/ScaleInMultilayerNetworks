The problem and promise of scale in multilayer animal social networks
================
Alec L. Robitaille<sup>1\*</sup>, Quinn M.R. Webber<sup>2</sup>, Julie
W. Turner<sup>1</sup>, Eric Vander Wal<sup>1,2</sup>
<sup>1</sup>Department of Biology, Memorial University of Newfoundland,
Canada  
<sup>2</sup>Cognitive and Behavioural Ecology Interdisciplinary Program,
Memorial University of Newfoundland  
\*Corresponding author: Alec L. Robitaille (<robit.alec@gmail.com>)

  - [Abstract](#abstract)
      - [Keywords](#keywords)
  - [Introduction](#introduction)
  - [Phenotypes and Individual
    fitness](#phenotypes-and-individual-fitness)
  - [Movement ecology and collective
    movement](#movement-ecology-and-collective-movement)
  - [Habitat selection and space use](#habitat-selection-and-space-use)
  - [Conclusions](#conclusions)
  - [Acknowledgements](#acknowledgements)
  - [References](#references)

# Abstract

Scale remains a foundational concept in ecology. Spatial scale, for
instance, has become a central consideration in the way we understand
landscape ecology and animal space use. Meanwhile, social processes can
also scale from fine-scale interactions to co-occurrence to overlapping
home ranges. <!-- TODO: add
temporal scale --> Multilayer networks promise the integration of
monolayer animal social networks with the complexity and importance of
animal space use and movement in heterogeneous landscapes. Despite the
complex interplay between social networks and how animals use space,
there remains an important biological and methodological gap in our
understanding of an animal’s perception of scale. Here we discuss the
role of scale in the context of multilayer networks and provide a social
ungulate case study to illustrate the role of social, spatial, and
temporal scale on multilayer processes. We also present perspectives on
future development and applications of scale in multilayer networks with
respect to: phenotypes and individual fitness, movement ecology and
collective movement, and habitat selection and space use. Effective
integration of social and spatial processes, including biologically
meaningful scales, within the context of animal social networks is an
emerging area of research, as such our contribution incorporates
perspectives on how the social environment and spatial processes are
linked across scales in a multilayer context.

## Keywords

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
(Sugihara, Schoenly and Trombla 1989), among others. Meanwhile, in the
context of animal behaviour, certain behaviours are scale-dependent; for
example, acoustic communication in birds varies with spatial scales
(Luther 2009). We posit that it is important to consider that animal
behaviour within the social environment will be scale-dependent.

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
al. 2014; Farine 2015). Thus, we define social scale as the type of
social relationship observed that can be explicitly defined and measured
(Farine 2015).

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
explicitly consider social systems across contexts, including
scale-dependent contexts (Pilosof et al. 2017). Multilayer networks are
made up of multiple layers, each representing (i) different classes of
individuals, e.g. male or female, (ii) types of behaviours,
e.g. grooming, travelling, or foraging, (iii) spatial areas, e.g. local
or regional, (iv) or temporal windows, e.g. daily or seasonal (Kivela et
al. 2014; Porter 2018). Multilayer networks are relatively novel to
studies of animal behaviour (Silk et al. 2018; Finn et al. 2019),
although they have been used to describe multidimensional human social
systems, complex transportation networks, and neural networks (Silk et
al. 2018). The role of scale within multilayer social networks remains
unexplored but provides a unique opportunity to develop novel
understanding of variation in the social, spatial or temporal scales
associated with social systems.

Our examinations is motivated by behavioural, landscape, and spatial
ecology to build a conceptual and analytical framework for
scale-dependent multilayer networks, and we apply this framework to a
case study of caribou (*Rangifer tarandus*) in Newfoundland, Canada
(Peignier et al. 2019). We use this case study to address two principal
questions associated with scale-dependent multilayer networks. First, to
what degree does the social scale of relationships, spatial scale of
landscapes, and temporal scale of analysis influence our ability to
interpret complex social systems? Second, can variation in the social,
spatial, and temporal scale improve predictions associated with
biological differences in seasonal resource availability and social
association? We conclude with perspectives for further development and
application of scale in multilayer networks with respect to phenotypes
and individual fitness, movement ecology and collective movement, and
habitat selection and space use.

<!-- # Perspectives to advance multilayer networks  -->

<!-- The integration of behavioural and ecological theory has shown the value of -->

<!-- considering the importance of various ecological disciplines to better -->

<!-- understand and predict animal social networks, including demography -->

<!-- [@Shizuka_2019], evolutionary and quantitative genetics [@Fisher_2017], disease -->

<!-- ecology [@Silk_2017], and animal personality [@Sih_2018]. While the number of -->

<!-- studies integrating social network theory into a broader array of behavioural -->

<!-- and ecological sub-disciplines is impressive, only recently has the role of -->

<!-- animal space use been considered in describing the causes and consequences of -->

<!-- the social environment in the context of (1) phenotypes and individual fitness -->

<!-- [@Webber_2018], (2) movement ecology and collective movement [@Bode_2011], and -->

<!-- (3) habitat selection and space use [@He_2019]. Importantly, much of the work -->

<!-- linking space use and the social environment has been theoretical and empirical -->

<!-- studies are lacking [but see @Peignier_2019; @Strandburg_Peshkin_2015; -->

<!-- @Strandburg_Peshkin_2017]. Here, we discuss the role of scale and multilayer -->

<!-- networks in the emerging integration of social and spatial ecology within the -->

<!-- behavioural ecology literature. -->

# Phenotypes and Individual fitness

Social network positions are frequently used to represent the social
environment that an individual experiences or their social phenotype.
Multilayer networks provide a way to bridge these different scales so
that we can examine social phenotypes in more holistic ways rather than
looking at each scale separately as has traditionally been done. From a
monolayer network perspective, social phenotypes are increasingly linked
to important fitness for individuals of various species, including
primates (Brent, Ruiz-Lambides and Platt 2017; Thompson 2019), dolphins
(Stanton, Gibson and Mann 2011; Stanton and Mann 2012), and birds
(McDonald 2007; Royle et al. 2012). Both social scales, types of
interactions, and temporal, seasons and stages of life, have emerged as
important for understanding fitness consequences in the context of
social network positions (Holekamp et al. 2011; Berger et al. 2015;
Almeling et al. 2016; Brent, Ruiz-Lambides and Platt 2017).

For instance, social scale is major consideration for social network
analysis, especially in the context of different types of relationships,
such as grooming and association, that are typically examined separately
while answering a single question (Castles et al. 2014; Carter, Lee and
Marshall 2015; Farine 2015). Furthermore, it is a common trope that
individuals must be associating to interact, and many studies therefore
assume that proximity is proxy for interacting (Farine 2015). For
instance, baboons need to be in proximity to groom each other. However,
animals have certain interactions that do not require proximity such as
long-distance vocalization and olfactory signals (Carter, Lee and
Marshall 2015). With the advancement of biologging technology, we have
the ability to record social interactions that do not require proximity,
particularly long-distance communication networks with devices like
microphone arrays (Snijders and Naguib 2017). Using relocation data, our
case study results indicate that there are different social patterns in
different habitat types, likely indicating different types of
interactions. When the social threshold is greater than approximately 50
m during the winter, individuals demonstrate dramatically different
graph strength (Figure <a href="#fig:socres">3</a>) in different habitat
types, having higher graph strength in forage and open habitats where
they can likely see each other and still interact with visual cues
unlike in forest habitats. Varying social scales can have different
fitness repercussions for individuals. Rhesus macaques (*Macaca
mulatta*) had higher survivorship when they had fewer but stronger, more
stable social associates and grooming partners rather than simply more
associates (Ellis et al. 2019). This finding highlights that different
qualities of social scales have lasting consequences. Multilayer
networks provide the opportunity to address these types of questions
involving social scale with all the individual layers of interaction
integrated in a holistic way.

Temporal scale is also important for understanding the repercussions of
social phenotypes. Varying the time window length and position for
caribou, we found there was a lot of variation in the multilayer network
metrics (Figure <a href="#fig:winlen">6</a>, Figure
<a href="#fig:winpos">7</a>). These changes in the outcome depending on
how the time window is defined highlight how critical it is to properly
define the time window appropriately to address the questions and
hypotheses of interest. For instance, social phenotypes can change over
ontogeny in ways that can affect fitness (Berger et al. 2015; Brent,
Ruiz-Lambides and Platt 2017). Thus, it is critical to carefully
consider the temporal scale that is meaningful for the proposed
hypotheses. Further complicating the issue of selecting suitable time
scales across ontogeny, individuals progress through development at
different rates (Tarka et al. 2018). This variation can make defining
appropriate temporal scales for testing the fitness implications of an
individual’s social phenotype over different stages of ontogeny even
more difficult when they vary by individual. However, considering fine
temporal scales provide insight across developmental stages that may
otherwise be missed (Turner, Bills and Holekamp 2017). Defining temporal
scales is a challenge in multilayer networks just as in monolayer
networks; however, multilayer networks provide metrics that enable
researchers to look at similarities and differences in separate layers
representing different stages of ontogeny, or seasons as in our case
study, which can be difficult to detect.

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
meaningful reduction of many network metrics that could help simplify
statistical analyses and deal with the frequent correlations between
social network metrics in different types of networks (Castles et al.
2014). Furthermore, multilayer networks provide a framework to test
hypotheses linking social phenotypes and fitness across temporal scales.
Because of the non-independent nature of social interactions and
associations, especially over time, it is hard to test hypotheses about
social dynamics with a suitable null control (Farine 2017; Proskurnikov
and Tempo 2017). Using the framework of multilayer networks, making
layers of different temporal periods provides a way to make appropriate
null models to test questions about the dynamics of an individual’s
social network position over multiple aggregated time periods.

Conversely, picking the proper temporal scale is important but a
challenge because all layers in the multilayer network should reflect
the same time period, and the period should be long enough for each
layer to have enough data for robust networks (Farine 2017). These
considerations may be limiting factors when answering questions that
require time frames that are relevant to different individuals, for
instance. In both mono- and multilayer networks, the effect of scale on
the relationship between an individual’s social network position and
fitness need to be considered based on the hypotheses being tested and
logistical constraints.

# Movement ecology and collective movement

Social processes, movement decisions, and space use are inextricably
linked and multilayer networks represent a potential analytical
framework for linking these processes (Mourier, Lédée and Jacoby 2019).
Movement as a collective group can reduce per capita predation risk via
detection-dilution trade-offs and improve information transfer about the
quality or location of resources to other group members (Jolles, King
and Killen 2019). In our case study, we integrate proximity based social
networks that inherently rely on animal collective movement, and, in
general, we found that movement is likely an important mechanism driving
social network connectivity within and between habitat types.

Although multilayer animal social networks are relatively novel (Silk et
al. 2018), movement behaviour within multilayer networks has been
considered. Spatial networks are physical locations (nodes) which are
connected in a network when individuals move between said locations
(edges). For example, spatial networks were applied to monitor movement
of sharks (*Carcharhinus amblyrhynchos* and *Carcharhinus melanopterus*)
between fixed location autonomous arrays. In this example, nodes
represent locations within the array, *intralayer edges* represent
individual movement frequency, and *interlayer edges* represent contact
probability among individuals at a given node (Mourier, Lédée and Jacoby
2019). Although movement between fixed arrays is inherent, networks are
not constructed based on continuous measures of dyadic or collective
movement (Long et al. 2014). Our case study builds on the work of
Mourier et al. (2019) and explicitly integrates continuous and
simultaneous measures of animal movement through space and time as
layers of a multilayer social network.

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
et al. 2014) or groups (Bode, Wood and Franks 2011). This movement layer
could be made at a fine (i.e. minute-to-minute: Cleasby et al. 2019) or
coarse scale (global migration: Flack et al. 2018). Our case study
integrates variation in temporal and spatial scale to assess the role of
scale in predicting multilayer networks. As one might expect, we found
increasing social threshold results in saturation of potential social
connections (Figure
<a href="#fig:socres">3</a>).<!--TODO: what??, while increasing temporal scale had little effect
on habitat-specific networks (Figure <a href="#fig:"><strong>??</strong></a>)-->.
Another potential application would be to generate social networks
during times when animals are engaged in different behaviours, including
travelling, interacting, or foraging (Muller et al. 2018; Finn et al.
2019) and construct a multilayer network based on behaviour-specific
monolayer networks (e.g. Smith-Aguilar et al. 2019).

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

Given the existing framework for constructing multilayer networks from
behavioural layers (e.g. Smith-Aguilar et al. 2019), monolayer networks
that explicitly quantify movement parameters could be integrated. For
example, edges could represent measures of dyadic or collective movement
based on dynamic interaction metrics (Long et al. 2014). Integrating
movement layers with habitat-specific social association layers could
further illuminate the role of movement as a driver of the social and
spatial environments an individual experiences (Webber and Vander Wal
2018). In our case study, we generated multilayer networks based on
habitat-specific monolayers. Coordinated movement of dyads, or groups,
could vary based on habitat, and the approach we outline could be used
to explore mechanisms linking the social and spatial environments. For
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

# Habitat selection and space use

Social structure and habitat selection are intimately linked:
individuals must share space to interact and the distribution of
resources influences group dynamics and home range size (Webber and
Vander Wal 2018). Social structure is influenced by resource
availability and seasonality (Peignier et al. 2019), configuration (He,
Maldonado-Chaparro and Farine 2019) and fragmentation (Banks et al.
2007). Habitat selection, the disproportionate use of available
resources or landscape features by animals (Manly, McDonald and Thomas
1993; Boyce and McDonald 1999), is a scale-dependent process (Mayor et
al. 2009). Multilayer networks represent a novel framework for
considering the influence of habitat selection and space use on
sociality across scales.

<!-- TODO: point to figure 1 -->

Habitat selection depends on the scale at which it is measured and a
singular scale is insufficient for generalizing across scales (Mayor et
al. 2009). Habitat selection is measured using resource selection
functions (RSFs), based on the proportion of used and available
resources for an animal (Manly, McDonald and Thomas 1993; Boyce and
McDonald 1999). Johnson (1980) identified four orders of habitat
selection: (1) the geographical range of a species, (2) the home range
of an individual, the (3) habitat patches within the home range and (4)
specific resources within a habitat patch. Kie et al. (2002) found that,
independently, third order of selection was insufficient for capturing
landscape attributes selected for by mule deer (*Odocoileus hemionus*),
at a scale larger than their home range size. Moving past this
hierarchical perspective, Mayor (2007) emphasized the importance of
considering a broad continuum of scales to reveal scale-dependent
selection and avoid the bias of predefined scales assumed to be
associated with certain behaviours. Despite animals selecting for
different landscape attributes at different scales (Mayor et al. 2009),
the use of multiscale analyses for habitat selection is still critically
lacking (McGarigal et al. 2016).

The emergent relationship between habitat and sociality has been
explored by the distribution and phenology of resources and use of
social information. Cougar (*Puma concolor*) home ranges overlapped more
in regions with high hunting opportunity, a proxy for resource richness
(Elbroch et al. 2015). Caribou (*Rangifer tarandus*) sociality differed
between seasons, where social associations were stronger in winter and
contrastingly low in summer when resource availability are more
homogeneous (Peignier et al. 2019). Bison (*Bison bison*) showed
stronger habitat selection in larger groups and avoidance of predation
risk was a main factor contributing to their habitat selection (Fortin
et al. 2009). These examples, comparing sociality and habitat selection
across temporal or spatial contexts, are implicitly multilayer analyses.

<!-- TODO: weak -->

Multilayer networks can be used to explicitly consider habitat selection
and sociality across scales. Animal social systems can be parsed by
spatial contexts, defined, for example, by habitat types as in Figure
<a href="#fig:lcres">4</a>. The effect of seasonality of resources can
can be directly measured by differences in habitat selection and
sociality across temporal layers as in Figure
<a href="#fig:winpos">7</a> and Figure <a href="#fig:winlen">6</a>.
Habitat selection can be explicitly integrated using network layers
defined by selection coefficients for individuals. These examples of
explicit integrations of habitat selection and sociality across social,
spatial and temporal scales highlight the potential for novel insights
from multilayer networks.

# Conclusions

Multilayer networks remain a nascent but powerful tool in animal
behavioural ecology. We demonstrate the potential novel analyses that
vary social, spatial, and temporal scale within a multilayer framework.
In our caribou case study, we show that (1) multilayer social networks
can be, but are not always, scale-dependent, and (2) the use of
multilayer networks could be useful for identifying habitat or
season-specific social processes. Our analyses of social, spatial, and
temporal scales in a multilayer network framework highlight the
potential to identify scales at which different properties of layers
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
telemetry data and spatial landcover data is grounded in the context of
observed animal social networks, as the scales we chose to explore,
e.g., number of observations, sociality across space and time, are ones
that can be observed as has traditionally been done in ethology. We
highlight ways in which scale ought to be considered for both observed
and remotely-sensed data when building social networks. Furthermore, GPS
telemetry data provides a link between large scale landscape properties
and fine scale social interactions as animal movement occurs across the
landscape, and when taken into account with multiple individuals can
indicate association patterns. Thus, a layer incorporating relocation
data could be a great boon linking spatial and social layer in
multilayer networks.

<!-- JWT: I'm having a hard time getting to where I want to go, but basically I want to highlight that using GPS relocation data is reflective of more traditional observed networks like they wanted when they accepted our abstract, and this provides opportunities for social networks, particularly multilayer networks. It may be easier to scale relocation data and other landscape variables and can link to smaller scale observed interactions, providing a bridge between different types of data. -->

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

<!-- TODO: In summary, -->

# Acknowledgements

We thank all members of the Wildlife Evolutionary Ecology Lab, including
J. Hendrix, K. Kingdon, S. Boyle, C. Prokopenko, I. Richmond, J. Hogg,
and L. Newediuk for their comments on previous versions of this
manuscript as well as D. C. Schneider for inspiration and helpful
discussions about scale. Funding for this study was provided by a Vanier
Canada Graduate Scholarship to QMRW and a NSERC Discovery Grant to EVW.

<div class="figure">

<img src="../graphics/figure1.png" alt="(ref:spacetime)" width="\linewidth" />

<p class="caption">

Figure 1: (ref:spacetime)

</p>

</div>

<div class="figure">

\<img src=“../graphics/figure-2.png” alt=“Visualization of multilayer
network for social ungulate case study representing social association
of caribou (*Rangifer tarandus*) on Fogo Island, Newfoundland in summer
2017 and winter 2018. Individual caribou (n = 18 females) are show as
nodes and each individual is represented by a unique color. Six layers
represent combinations of two seasons (summer and winter) and three
habitat classes (open, forest and forage). Intralayer edges connect
pairs of individuals that associated according to spatial and temporal
thresholds described above, and are scaled in line thickness according
to strength of association (SRI). Interlayer edges connect individuals
to themselves across seasons and within habitat classes
(e.g. individual”A" in summer, forest and individual “A” in winter,
forest)." width=“” /\>

<p class="caption">

Figure 2: Visualization of multilayer network for social ungulate case
study representing social association of caribou (*Rangifer tarandus*)
on Fogo Island, Newfoundland in summer 2017 and winter 2018. Individual
caribou (n = 18 females) are show as nodes and each individual is
represented by a unique color. Six layers represent combinations of two
seasons (summer and winter) and three habitat classes (open, forest and
forage). Intralayer edges connect pairs of individuals that associated
according to spatial and temporal thresholds described above, and are
scaled in line thickness according to strength of association (SRI).
Interlayer edges connect individuals to themselves across seasons and
within habitat classes (e.g. individual “A” in summer, forest and
individual “A” in winter, forest).

</p>

</div>

<div class="figure">

<img src="../graphics/figure-spatialthreshold.png" alt="Varying scale in social threshold. For each social threshold, multilayer networks were constructed of caribou social associations (*Rangifer tarandus*, n = 18 females) on Fogo Island, Newfoundland in summer 2017 and winter 2018 across three habitat classes (forage, forest, and open). A) Mean graph strength across individuals showed an increase for winter network layers while summer network layers had consistently weak connections. B) Mean layer relevance was increased for winter layers between 5 m and 50 m, otherwise stable for all social thresholds >50
m for winter and all social thresholds for summer. C) Similarity of
network layers across seasons and within habitat classes (e.g. open
summer compared to open winter) was relatively stable for all habitat
class layers. D) Mean connective redundancy across individuals showed an
increase between 5 m and 50 m before remaining stable through all other
social thresholds." width=“” /\>

<p class="caption">

Figure 3: Varying scale in social threshold. For each social threshold,
multilayer networks were constructed of caribou social associations
(*Rangifer tarandus*, n = 18 females) on Fogo Island, Newfoundland in
summer 2017 and winter 2018 across three habitat classes (forage,
forest, and open). A) Mean graph strength across individuals showed an
increase for winter network layers while summer network layers had
consistently weak connections. B) Mean layer relevance was increased for
winter layers between 5 m and 50 m, otherwise stable for all social
thresholds \>50 m for winter and all social thresholds for summer. C)
Similarity of network layers across seasons and within habitat classes
(e.g. open summer compared to open winter) was relatively stable for all
habitat class layers. D) Mean connective redundancy across individuals
showed an increase between 5 m and 50 m before remaining stable through
all other social thresholds.

</p>

</div>

<div class="figure">

<img src="../graphics/figure-lcres.png" alt="Varying spatial scale in landcover resolution. For each landcover resolution, multilayer networks were constructed of caribou social associations (*Rangifer tarandus*, n = 18 females) on Fogo Island, Newfoundland in summer 2017 and winter 2018 across three habitat classes (forage, forest, and open). A) Mean graph strength of individuals in summer layers had consistent weak connections. Individuals in winter forest and open habitats increased consistently while winter forage varied with a peak at 250 m and valley at 500 m. B) Mean layer relevance showed sparse connectivity in summer compared to winter networks and a decrease in winter forage layer relevance at higher landcover resolutions. C) Similarity of landcover network layers between seasons (e.g. open summer compared to open winter) forage and forest habitats but showed more variation in open habitats with increasing social thresholds. Note that layer similarity in forage is not shown because individuals did not interact at landcover resolutions greater than 30 m during the summer in forage habitats, so layer similarity could not be calculated. D) Mean connective redundancy across individuals showed a slight decreasing trend with increasing landcover resolution." width="\linewidth" />

<p class="caption">

Figure 4: Varying spatial scale in landcover resolution. For each
landcover resolution, multilayer networks were constructed of caribou
social associations (*Rangifer tarandus*, n = 18 females) on Fogo
Island, Newfoundland in summer 2017 and winter 2018 across three habitat
classes (forage, forest, and open). A) Mean graph strength of
individuals in summer layers had consistent weak connections.
Individuals in winter forest and open habitats increased consistently
while winter forage varied with a peak at 250 m and valley at 500 m. B)
Mean layer relevance showed sparse connectivity in summer compared to
winter networks and a decrease in winter forage layer relevance at
higher landcover resolutions. C) Similarity of landcover network layers
between seasons (e.g. open summer compared to open winter) forage and
forest habitats but showed more variation in open habitats with
increasing social thresholds. Note that layer similarity in forage is
not shown because individuals did not interact at landcover resolutions
greater than 30 m during the summer in forage habitats, so layer
similarity could not be calculated. D) Mean connective redundancy across
individuals showed a slight decreasing trend with increasing landcover
resolution.

</p>

</div>

<div class="figure">

<img src="../graphics/figure-nobs.png" alt="Varying scale in number of observations. For each iteration, a number of observations (10-485 observations in steps of 25) were selected from the complete data set to construct multilayer networks of caribou social associations (*Rangifer tarandus*, n = 18 females) on Fogo Island, Newfoundland in summer 2017 and winter 2018 across three habitat classes (forage, forest, and open). A) Mean graph strength across individuals remained weak throughout for summer layers and varied for winter layers becoming relatively stable by 100 observations. B) Mean layer relevance across individuals in summer layers had consistent low layer relevance but increased sharply for winter layers between ~10 m and ~50 m observations before stabilizing. C) Similarity of network layers across habitat classes and between seasons (e.g. open summer compared to open winter) was relatively consistent across number of observations for forest and open habitats. Note, forage habitats are not shown given no individuals interacted in the summer forage layer. D) Mean connective redundancy across individuals increased rapidly between ~10 m and ~50 m observations and then remained constant." width="\linewidth" />

<p class="caption">

Figure 5: Varying scale in number of observations. For each iteration, a
number of observations (10-485 observations in steps of 25) were
selected from the complete data set to construct multilayer networks of
caribou social associations (*Rangifer tarandus*, n = 18 females) on
Fogo Island, Newfoundland in summer 2017 and winter 2018 across three
habitat classes (forage, forest, and open). A) Mean graph strength
across individuals remained weak throughout for summer layers and varied
for winter layers becoming relatively stable by 100 observations. B)
Mean layer relevance across individuals in summer layers had consistent
low layer relevance but increased sharply for winter layers between \~10
m and \~50 m observations before stabilizing. C) Similarity of network
layers across habitat classes and between seasons (e.g. open summer
compared to open winter) was relatively consistent across number of
observations for forest and open habitats. Note, forage habitats are not
shown given no individuals interacted in the summer forage layer. D)
Mean connective redundancy across individuals increased rapidly between
\~10 m and \~50 m observations and then remained constant.

</p>

</div>

<div class="figure">

<img src="../graphics/figure-winlength.png" alt="Varying temporal scale in time window length. For each time window length (40 to 100 days in length increasing by 5 days in sequence), multilayer networks were constructed of caribou social associations (*Rangifer tarandus*, n = 18 females) on Fogo Island, Newfoundland in summer 2017 and winter 2018 across three habitat classes (forage, forest, and open). A) Mean graph strength across individuals in summer layers was weak but stable across increasing lengths of time except for a slight increase in strength for open and forage habitats when the season lasted more than 70 days. Mean graph strength was relatively stable over increasing time window lengths for winter layers, though there was more variation in strength between landcover types as window length increased. B) Mean layer relevance increased for summer layers across habitat classes and was stable for winter layers. C) Similarity of layers across habitat classes and between seasons (e.g. open summer compared to open winter) was variable with increasing window lengths, particularly for forage and open habitat types. D) Mean connective redundancy across individuals increased marginally with increasing window length." width="\linewidth" />

<p class="caption">

Figure 6: Varying temporal scale in time window length. For each time
window length (40 to 100 days in length increasing by 5 days in
sequence), multilayer networks were constructed of caribou social
associations (*Rangifer tarandus*, n = 18 females) on Fogo Island,
Newfoundland in summer 2017 and winter 2018 across three habitat classes
(forage, forest, and open). A) Mean graph strength across individuals in
summer layers was weak but stable across increasing lengths of time
except for a slight increase in strength for open and forage habitats
when the season lasted more than 70 days. Mean graph strength was
relatively stable over increasing time window lengths for winter layers,
though there was more variation in strength between landcover types as
window length increased. B) Mean layer relevance increased for summer
layers across habitat classes and was stable for winter layers. C)
Similarity of layers across habitat classes and between seasons
(e.g. open summer compared to open winter) was variable with increasing
window lengths, particularly for forage and open habitat types. D) Mean
connective redundancy across individuals increased marginally with
increasing window length.

</p>

</div>

<div class="figure">

<img src="../graphics/figure-winpos.png" alt="Varying temporal scale in time window position. For each time window position (shifting the start date of the time window used to define seasons 1 to 48 days from the original), multilayer networks were constructed of caribou social associations (*Rangifer tarandus*, n = 18 females) on Fogo Island, Newfoundland in summer 2017 and winter 2018 across three habitat classes (forage, forest, and open). A) Mean graph strength across individuals increased in summer network layers at window position 25 and increased between window position 20 and 40 for winter network layers. B) Mean layer relevance increased for summer layers and slightly decreased for winter layers. C) Similarity of layers across habitat classes and between seasons (e.g. open summer compared to open winter) was relatively stable until window position ~28 where forage and open layer similarity decreased. D) Mean connective redundancy across individuals increased marginally with advancing time window position." width="\linewidth" />

<p class="caption">

Figure 7: Varying temporal scale in time window position. For each time
window position (shifting the start date of the time window used to
define seasons 1 to 48 days from the original), multilayer networks were
constructed of caribou social associations (*Rangifer tarandus*, n = 18
females) on Fogo Island, Newfoundland in summer 2017 and winter 2018
across three habitat classes (forage, forest, and open). A) Mean graph
strength across individuals increased in summer network layers at window
position 25 and increased between window position 20 and 40 for winter
network layers. B) Mean layer relevance increased for summer layers and
slightly decreased for winter layers. C) Similarity of layers across
habitat classes and between seasons (e.g. open summer compared to open
winter) was relatively stable until window position \~28 where forage
and open layer similarity decreased. D) Mean connective redundancy
across individuals increased marginally with advancing time window
position.

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

<div id="ref-Berger_2015">

Berger V, Lemaître J-F, Allainé D, Gaillard J-M, Cohas A. Early and
adult social environments have independent effects on individual fitness
in a social vertebrate. *Proceedings of the Royal Society B: Biological
Sciences* 2015;**282**:20151167.

</div>

<div id="ref-Bode_2011">

Bode NWF, Wood AJ, Franks DW. The impact of social networks on animal
collective motion. *Animal Behaviour* 2011;**82**:29–38.

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

<div id="ref-Cleasby_2019">

Cleasby IR, Wakefield ED, Morrissey BJ, Bodey TW, Votier SC, Bearhop S,
Hamer KC. Using time-series similarity measures to compare animal
movement trajectories in ecology. *Behavioral Ecology and Sociobiology*
2019;**73**, DOI:
[10.1007/s00265-019-2761-1](https://doi.org/10.1007/s00265-019-2761-1).

</div>

<div id="ref-Croft_2011">

Croft DP, Madden JR, Franks DW, James R. Hypothesis testing in animal
social networks. *Trends in Ecology & Evolution* 2011;**26**:502–7.

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

<div id="ref-Ellis_2019">

Ellis S, Snyder-Mackler N, Ruiz-Lambides A, Platt ML, Brent LJN.
Deconstructing sociality: The types of social connections that predict
longevity in a group-living primate. *Proceedings of the Royal Society
B: Biological Sciences* 2019;**286**:20191991.

</div>

<div id="ref-Farine_2015a">

Farine DR. Proximity as a proxy for interactions: Issues of scale in
social network analysis. *Animal Behaviour* 2015;**104**:e1–5.

</div>

<div id="ref-Farine_2017">

Farine DR. When to choose dynamic vs. Static social network analysis.
*Journal of Animal Ecology* 2017;**87**:128–38.

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

<div id="ref-Flack_2018">

Flack A, Nagy M, Fiedler W, Couzin ID, Wikelski M. From local collective
behavior to global migratory patterns in white storks. *Science*
2018;**360**:911–4.

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

<div id="ref-He_2019">

He P, Maldonado-Chaparro AA, Farine DR. The role of habitat
configuration in shaping social structure: A gap in studies of animal
social complexity. *Behavioral Ecology and Sociobiology* 2019;**73**,
DOI:
[10.1007/s00265-018-2602-7](https://doi.org/10.1007/s00265-018-2602-7).

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

<div id="ref-McGarigal_2016">

McGarigal K, Wan HY, Zeller KA, Timm BC, Cushman SA. Multi-scale habitat
selection modeling: A review and outlook. *Landscape Ecology*
2016;**31**:1161–75.

</div>

<div id="ref-Mourier_2019">

Mourier J, Lédée EJI, Jacoby DMP. A multilayer perspective for inferring
spatial and social functioning in animal movement networks. *bioRxiv*
2019, DOI: [10.1101/749085](https://doi.org/10.1101/749085).

</div>

<div id="ref-Muller_2018">

Muller Z, Cantor M, Cuthill IC, Harris S. Giraffe social preferences are
context dependent. *Animal Behaviour* 2018;**146**:37–49.

</div>

<div id="ref-Papageorgiou_2019">

Papageorgiou D, Christensen C, Gall GEC, Klarevas-Irby JA, Nyaguthii B,
Couzin ID, Farine DR. The multilevel society of a small-brained bird.
*Current Biology* 2019;**29**:R1120–1.

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

<div id="ref-Royle_2012">

Royle NJ, Pike TW, Heeb P, Richner H, Kölliker M. Offspring social
network structure predicts fitness in families. *Proceedings of the
Royal Society B: Biological Sciences* 2012;**279**:4914–22.

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

<div id="ref-Snijders_2017">

Snijders L, Naguib M. Communication in animal social networks. In.
*Advances in the Study of Behavior*. Elsevier, 2017, 297–359.

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

<div id="ref-Strandburg_Peshkin_2017">

Strandburg-Peshkin A, Farine DR, Crofoot MC, Couzin ID. Habitat and
social factors shape individual decisions and emergent group structure
during baboon collective movement. *eLife* 2017;**6**, DOI:
[10.7554/elife.19505](https://doi.org/10.7554/elife.19505).

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
