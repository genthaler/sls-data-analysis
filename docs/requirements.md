# Project Requirements

## Document Status
- Status: Provisional
- Last updated: 2026-03-26
- Owner: bonj

## Purpose
Build a context-aware analysis system for surf lifesaving clubs, branches, and related services across Australia. The system shall support fair comparison, growth-opportunity analysis, and service-burden analysis while making data gaps and comparison limits explicit.

## Scope

### Confirmed
- The system shall support analysis at Australia, state, NSW Metro/Country, branch, and club levels.
- The system shall compare clubs and branches fairly rather than using raw, context-free rankings by default.
- The system shall include surf lifesaving clubs and branches.
- The system shall include branch Rescue Services assets and personnel where data is available.
- The system shall include professional services where identifiable, including council services and Australian Lifeguard Service (ALS).
- The system shall support patrol/service inventory, catchment analysis, travel analysis, visitation analysis, incident analysis, and map overlays.
- The system shall consider all club members as the base member population when member analysis is in scope.
- The system shall support progressive reporting under incomplete data.
- The system shall maintain data ownership, permission, and privacy controls for all datasets used in the project.

### Provisional
- The system should estimate growth opportunity using both structural factors and variable effort-related factors.
- The system should support probabilistic availability-to-club modelling rather than purely binary catchments.
- The system should model competing commitments such as sports clubs and volunteer organisations using a nationally applicable method.
- The system should incorporate swimming-capability or swimming-pipeline proxy measures where suitable data exists.

### Out of Scope
- Direct real-time SurfGuard integration is out of scope for the initial implementation.
- Automated operational rostering decisions are out of scope for the initial implementation.
- Prescriptive member redistribution is out of scope unless a later modelling phase explicitly adds it.

## Principles
- Fairness / neutrality: The analysis shall support balanced, context-aware comparison and shall not be framed to justify only one stakeholder position.
- Reproducibility: The system shall preserve raw inputs, normalized entities, and mapping/provenance logic where feasible.
- Interpretability: The first implementation should favour explainable comparisons and defensible assumptions over opaque optimisation.
- Incomplete-data handling: The system shall report the strongest defensible outputs possible from current data while identifying missing inputs and limits on comparison validity.
- Method traceability: The system shall record which methodology or modelling family has been applied to each material analytical output, with references to source documents or literature where appropriate.
- Data governance: Every dataset shall be attributable to an owner, documented with permission or usage basis for this project, and handled in a way that avoids storing private or personally identifiable information.

## Related Work
- Surf Life Saving Australia's Beachsafe platform provides national beach coverage and exposes patrol status, hazards, facilities, and related beach/service information, making it a plausible backbone for national service-location discovery and patrol/service context. Source: [Beachsafe About](https://api.beachsafe.org.au/about), [Beachsafe App](https://beachsafe.org.au/apps).
- ABS Statistical Area Level 2 (SA2) geography is explicitly designed to represent communities that interact socially and economically and is a standard release unit for sub-state population statistics. This makes SA2 a strong candidate for the initial demographic and catchment geography. Source: [ABS SA2 standard](https://www.abs.gov.au/statistics/standards/australian-statistical-geography-standard-asgs-edition-3/jul2021-jun2026/main-structure-and-greater-capital-city-statistical-areas/statistical-area-level-2), [ABS regional population methodology](https://www.abs.gov.au/methodologies/regional-population-methodology/2023-24).
- Accessibility research commonly uses floating-catchment methods because people are not assigned to a single provider and multiple services may compete for the same population. This is directly analogous to overlapping club catchments and non-binary club availability. Sources: [2SFCA overview](https://pmc.ncbi.nlm.nih.gov/articles/PMC3520708/), [integrated catchment approach](https://pmc.ncbi.nlm.nih.gov/articles/PMC6164298/).
- Public-service accessibility work also shows that fixed catchments can misstate access, especially across urban and rural areas, supporting the need for travel-friction and variable-catchment methods rather than one national radius. Source: [urban-rural adapted catchment example](https://pmc.ncbi.nlm.nih.gov/articles/PMC7938828/).
- Travel-time benchmarking research in emergency services suggests generic GIS travel models can be useful for planning, but they may systematically under- or over-predict actual journeys depending on context. This supports validating any travel model used for club accessibility or service burden. Source: [ambulance journey time comparison](https://pubmed.ncbi.nlm.nih.gov/23739539/).
- Peer-grouping literature in transport benchmarking provides a useful analogue for context-aware club and branch comparison, especially where external environment, density, and service configuration affect observed performance. Source: [peer grouping methodology](https://www.sciencedirect.com/science/article/pii/S1077291X22000285).
- OECD accessibility benchmarking separates proximity from transport performance, which is useful for distinguishing nearby population from realistically reachable population in this project. Source: [OECD Benchmarking Accessibility in Cities](https://www.oecd.org/en/publications/benchmarking-accessibility-in-cities_4b1f722b-en.html).
- Volunteering research indicates that participation is shaped by structural barriers and broader exclusionary processes, not only by individual choice. This supports treating volunteer supply and growth potential as context-dependent rather than purely effort-driven. Source: [Rapid review of barriers to volunteering](https://link.springer.com/article/10.1007/s11266-019-00119-2).
- SLSA's own reporting confirms the national scale and mixed service model of the movement, including affiliated clubs, volunteer patrol hours, rescues, and the Australian Lifeguard Service. This supports modelling volunteer club service and professional/coordinated services together rather than as separate universes. Source: [SLSA Annual Report 2021-22](https://wpslsa.sls.com.au/wp-content/uploads/sites/13/2023/09/SLSA_AnnualReport_21.22_web.pdf).

## Comparable Emergency Service Analogues
- NSW SES provides a useful analogue for linking service demand, volunteer pipeline, and role diversity. Its public material distinguishes unit volunteers, Community Action Teams, Community First Responders, and spontaneous volunteers, which is relevant to modelling non-uniform participation and multiple pathways into service. Sources: [NSW SES Annual Report 2023-24](https://www.ses.nsw.gov.au/sites/default/files/document/nsw-ses-annual-report-2023-2024.pdf), [Volunteer](https://www.ses.nsw.gov.au/volunteer), [Community First Responder](https://www.ses.nsw.gov.au/volunteer/unit-volunteer/community-first-responder), [Spontaneous Volunteer](https://www.ses.nsw.gov.au/volunteer/spontaneous-volunteer).
- NSW RFS is a strong analogue for context-aware comparison because it publicly exposes brigade counts, district structures, incident volumes, and service standards, and it explicitly addresses volunteer availability through programs such as Supportive Employer. This supports treating daytime and contextual availability as real operational constraints rather than informal anecdotes. Sources: [Fast Facts](https://www.rfs.nsw.gov.au/about-us/fast-facts), [Annual Reports](https://www.rfs.nsw.gov.au/resources/publications/annual-reports), [Supportive Employer](https://www.rfs.nsw.gov.au/volunteer/supportive-employer), [Service Standards](https://www.rfs.nsw.gov.au/resources/publications/corporate-governance-and-planning/service-standards).
- Marine Rescue NSW is a close analogue for cross-service attribution because it combines assets, vessels, radio operations, crews, units, and training in a coordinated volunteer service. This is directly relevant to tracking branch Rescue Services assets/operators alongside club patrol contributions. Sources: [Our Work](https://www.marinerescuensw.com.au/our-story/our-work/), [Our Volunteers](https://www.marinerescuensw.com.au/our-story/our-volunteers), [Reports and Documents](https://www.marinerescuensw.com.au/organisation/reports-and-documents).
- VRA Rescue NSW is a useful analogue for specialist capability attribution across heterogeneous rescue functions including rescue squads, communications, flood rescue, cave rescue, ski patrols, and remotely piloted aircraft. This supports modelling contribution by capability type rather than flattening all volunteers into a single headcount measure. Sources: [VRA Rescue NSW](https://rescue.org.au/), [Volunteer information](https://testversion1.rescue.org.au/volunteering.html).
- VICSES and CFA provide useful Victorian analogues for unit/brigade-based capability, fit-for-role standards, and public reporting on volunteer emergency services. These are relevant for thinking about operational versus support roles and how like-for-like comparisons might be framed. Sources: [About VICSES](https://www.ses.vic.gov.au/about-us), [Volunteer Opportunities](https://www.ses.vic.gov.au/join-us/volunteer-opportunities), [Managing Units](https://www.ses.vic.gov.au/join-us/volunteer-opportunities/managing-units), [CFA Annual Report](https://www.cfa.vic.gov.au/about-us/publications/annual-report).
- Queensland SES and related state-based services are useful comparators because local support and resourcing arrangements differ by jurisdiction. This reinforces that organisational environment and support model may affect fair comparison and should not be ignored. Sources: [Queensland SES Who We Are](https://www.ses.qld.gov.au/who-we-are), [Queensland SES Join Us](https://www.ses.qld.gov.au/join-us).
- SA SES is particularly relevant because its public capability model spans marine rescue, road crash rescue, vertical rescue, community response teams, and remotely piloted aircraft. This makes it a strong analogue for multi-capability volunteer services that mix local units, specialist assets, and operator qualifications. Sources: [SA SES What We Do](https://www.ses.sa.gov.au/about-us/what-we-do/), [Marine Rescue](https://www.ses.sa.gov.au/about-us/what-we-do/marine-rescue/), [Remotely Piloted Aircraft](https://www.ses.sa.gov.au/about-us/what-we-do/remotely-piloted-aircraft/), [Annual Reports](https://www.ses.sa.gov.au/about-us/publications-and-reports/sa-ses-annual-reports/).
- WA DFES is a useful umbrella-model analogue because it spans multiple volunteer emergency service types under one departmental structure. This is relevant when comparing entities operating within different support and governance environments. Sources: [About DFES](https://www.dfes.wa.gov.au/about-us), [Emergency Services Levy](https://www.dfes.wa.gov.au/emergency-services-levy).
- Broader Australian research on emergency-service volunteering highlights the importance of volunteer value, retention, cohesion, and reporting quality. These sources support the project's emphasis on structural context, realistic expectations, and more nuanced measures than raw volunteer numbers alone. Sources: [Value of volunteers in State Emergency Services](https://knowledge.aidr.org.au/resources/ajem-may-2009-the-value-of-volunteers-in-state-emergency-services/), [When joining is not enough](https://knowledge.aidr.org.au/resources/ajem-oct-2018-when-joining-is-not-enough-emergency-services-volunteers-and-the-intention-to-remain/), [Retention of volunteers in the emergency services](https://knowledge.aidr.org.au/resources/ajem-jan-2011-retention-of-volunteers-in-the-emergency-services-exploring-interpersonal-and-group-cohesion-factors/), [Disclosing volunteers as human capital](https://knowledge.aidr.org.au/resources/ajem-oct-2018-disclosing-volunteers-as-human-capital-analysing-annual-reports-of-australian-emergency-services-organisations/).
- Taken together, these analogues suggest there is no single off-the-shelf model that already combines volunteer catchment overlap, travel friction, competing commitments, service burden, incident exposure, and contextual benchmarking in one framework. The project therefore appears methodologically novel, but it can borrow proven elements from adjacent emergency-service practice and research.

## Phased Methodological Approach
- Phase 1 should establish a descriptive and auditable baseline before any complex modelling is attempted.
  - outputs should include entity directories, Beachsafe normalization, coverage reconciliation, patrol/service inventories, Rescue Services asset/personnel inventories where available, and map-ready geographic layers.
  - this phase shall prioritise traceability, completeness reporting, and clear separation of observed versus inferred data.
- Phase 2 should introduce spatial accessibility and overlapping-catchment modelling using accepted service-access methods rather than ad hoc radius rules.
  - a 2SFCA-family approach is the preferred starting point because it naturally supports multiple reachable clubs/services and competition for the same population.
  - travel-time based accessibility should be preferred where feasible over fixed-distance catchments.
- Phase 3 should introduce contextual fairness modelling for club and branch comparison.
  - multilevel or hierarchical models are the preferred initial method because they can separate club-level effects from higher-level geographic and organisational context.
  - this phase should support expected-versus-actual comparisons while retaining interpretability.
- Phase 4 should introduce demand, burden, and incident modelling.
  - count-based models such as Poisson or negative binomial regression should be used for incidents, rescues, or other event-frequency outcomes.
  - these models should use explicit exposure terms where appropriate, such as visitation, service hours, patrol hours, or population-at-risk.
- Phase 5 may introduce advanced estimation where data remains sparse or comparisons require stronger normalization.
  - small area estimation may be used where local data is incomplete but defensible local inference is still needed.
  - Bayesian spatial smoothing may be used for sparse geographic incident/risk surfaces where unsmoothed maps would be unstable or misleading.
- Phase 6 may introduce advanced efficiency or frontier-style benchmarking only if simpler contextual models prove insufficient.
  - methods such as stochastic frontier analysis or data envelopment analysis should be treated as optional late-stage methods because they are harder to explain and easier to misuse in fairness-sensitive settings.
- Across all phases, methodological complexity should increase only when the simpler previous phase has produced stable, interpretable, and reviewable outputs.

## Methodological References
- Floating catchment area methods are a well-established family for modelling accessibility where populations may reach multiple services and services compete for overlapping catchments. These are the strongest methodological fit for club accessibility and overlapping catchment analysis. Sources: [2SFCA review and refinements](https://pmc.ncbi.nlm.nih.gov/articles/PMC3520708/), [comparative analysis of 2SFCA measures](https://www.tandfonline.com/doi/full/10.1080/13658816.2019.1591415), [integrated floating catchment area method](https://pmc.ncbi.nlm.nih.gov/articles/PMC6164298/), [comparison of 2SFCA configurations](https://pmc.ncbi.nlm.nih.gov/articles/PMC8141247/).
- Spatial interaction, gravity, and destination-choice models provide accepted ways to explain why people choose one reachable provider over another. These are relevant if the project later models club choice among multiple feasible options. Sources: [gravity model foundations and use](https://www.sciencedirect.com/science/article/pii/S0160738314000620), [destination choice theoretical foundations](https://tfresource.org/topics/Destination_Choice_Theoretical_Foundations).
- Multilevel and hierarchical models are accepted methods for separating entity-level outcomes from higher-level contextual effects. These are well suited to fair comparison between clubs/branches because they reduce the risk of attributing structural context to local performance alone. Sources: [multilevel modelling for public health and health services research](https://www.ncbi.nlm.nih.gov/books/NBK565720/), [general and specific contextual effects tutorial](https://www.sciencedirect.com/science/article/pii/S235282731830048X).
- Research on volunteering and geography supports using contextual rather than purely individual explanations for participation. This is relevant to hypotheses about volunteer ceilings, remoteness, and local community capacity. Sources: [volunteering, geography and welfare](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/A81368E46C81BF23B5FB5DA24418AA26/9781847421609c15_p267-284_CBO.pdf/volunteering_geography_and_welfare_a_multilevel_investigation_of_geographical_variations_in_voluntary_action.pdf), [contextual influences on participation](https://pubmed.ncbi.nlm.nih.gov/21203831/).
- Small area estimation is an accepted methodology for producing defensible local estimates when direct local data is incomplete or unstable. This may be relevant if some geographies lack direct membership, visitation, or capability observations. Sources: [small area estimation overview](https://pmc.ncbi.nlm.nih.gov/articles/PMC9451141/), [small-area estimation of spatial access](https://pmc.ncbi.nlm.nih.gov/articles/PMC4608938/).
- Count models such as Poisson and negative binomial regression are standard for incidents, rescues, and other event-frequency outcomes, especially when exposure differs across places or times. They are appropriate for modelling burden and risk using visitation, patrol hours, service hours, or other exposure measures. Sources: [regression analyses of counts and rates](https://www.researchgate.net/publication/15696846_Regression_Analyses_of_Counts_and_Rates_Poisson_Overdispersed_Poisson_and_Negative_Binomial_Models), [count data modelling overview](https://epi-perspectives.biomedcentral.com/articles/10.1186/1742-5573-3-3).
- Bayesian spatial models are accepted for smoothing sparse geographic rates and generating more stable area-level risk maps. They should be considered if raw incident maps prove too noisy for public interpretation. Source: [Bayesian disease mapping review](https://pmc.ncbi.nlm.nih.gov/articles/PMC8769562/).
- Frontier and efficiency methods such as stochastic frontier analysis and data envelopment analysis are accepted in benchmarking literature, but they should be treated cautiously in this project. They can support expected-versus-actual or efficiency-style comparisons, but they are less interpretable than the methods above and should only be introduced after simpler contextual models are exhausted. Sources: [stochastic DEA review](https://www.sciencedirect.com/science/article/pii/S0377221715007134), [stochastic frontier analysis under demand uncertainty](https://link.springer.com/article/10.1007/s11123-025-00758-2).

## Users and Decisions
- Primary users: project owner, analysts, surf lifesaving leadership, branch-level decision-makers, club-level decision-makers.
- Key decisions this document should support:
  - which clubs and branches are fairly comparable
  - whether service expectations are realistic in context
  - where growth opportunity is strongest
  - where structural constraints likely limit growth or service expansion
  - what additional data is required for valid comparison

## Requirements

### Functional Requirements
- `Confirmed`
  - The system shall maintain a reference structure for states, branches, and clubs.
  - The system shall ingest Beachsafe-derived beach and service data.
  - The system shall support crawl-based discovery from neighbouring Beachsafe links.
  - The system shall reconcile crawl-derived coverage against asserted/reference directories to identify missing, unmatched, duplicated, and ambiguous entities.
  - The system shall include a normalization layer for Beachsafe-derived entities, including service classification, duplicate resolution, and traceable mapping from raw records to normalized entities.
  - The system shall support extraction or ingestion of patrol dates and times where available.
  - The system shall track branch Rescue Services assets where available, including Rescue Water Craft (RWC), Unmanned Aerial Vehicles (UAVs), and Duty Officer (DO) vehicles.
  - The system shall track branch Rescue Services personnel where available, including RWC operators, UAV operators, and Duty Officers.
  - The system shall record home club attribution for Rescue Services assets and personnel where known.
  - The system shall support reporting of actual service provision by club members across both club patrol activity and branch Rescue Services activity.
  - The system shall support integration of ABS population and demographic data.
  - The system shall support contextual comparison at Australia, state, NSW Metro/Country, branch, and club levels.
  - The system shall support map overlays for core analytical layers.
  - The system shall distinguish observed data, inferred data, and unavailable data in outputs.
  - The system shall indicate whether comparisons are valid, provisional, or not yet comparable.
  - The system shall support both peer-group comparison and expected-versus-actual comparison.
  - The system shall maintain a register of datasets, data owners, permission status, and usage constraints.
  - The system shall record the legal, contractual, or policy basis on which each dataset is used.
  - The system shall identify datasets that are public, permissioned, restricted, or commercial-in-confidence.
  - The system shall avoid storing private or personally identifiable information.
  - The system shall use de-identified, aggregated, or otherwise privacy-preserving representations wherever member-linked analysis is required.
- `Provisional`
  - The system should support member travel-distance and travel-time analysis once member home-location data is available.
  - The system should estimate overlapping club catchments using travel-based accessibility rather than simple fixed-radius geography.
  - The system should incorporate historical and projected visitation data with the finest feasible temporal granularity, preferably hourly where available.
  - The system should align rescue and fatality incidents geographically and temporally with clubs and services.
  - The system should represent competing activities using a repeatable, broadly applicable classification and extraction method.
  - The system may later estimate growth opportunity scores and contextual expected performance scores.

### Non-Functional Requirements
- `Confirmed`
  - The requirements and outputs shall remain understandable to non-technical stakeholders.
  - The system shall make major assumptions and unresolved decisions explicit.
  - The system shall not treat missing data as zero or absence.
  - The system shall be extensible to new datasets over time.
  - The project shall maintain traceability between analytical outputs, implemented methods, and their documented methodological basis.
  - The project shall maintain traceability between each dataset, its owner, its permission status, and any usage restrictions.
  - The project shall be designed to minimize privacy risk and exclude unnecessary personal data from storage and reporting.
- `Provisional`
  - The system should support national-scale application with staged maturity by geography.
  - The system should preserve enough auditability to explain how each normalized entity and comparison was derived.

## Comparison and Evaluation Model
- Entities being compared: Australia, states, NSW Metro/Country groupings, branches, clubs, and relevant professional services where included.
- Service attribution basis: Comparison should account for service provision delivered through both club patrol structures and branch Rescue Services where personnel or assets can be linked back to clubs.
- Raw comparisons allowed?: Yes, but only as secondary descriptive outputs and not as the default evaluative basis.
- Context-adjusted comparisons required?: Yes.
- Peer-group comparisons required?: Yes.
- Expected-vs-actual comparisons required?: Yes.

## Data Sources

| Source | Purpose | Status | Notes / Gaps |
|---|---|---|---|
| Beachsafe API / related Beachsafe data | Beaches, services, patrol/service times, neighbouring-service links, professional service presence | Proposed | Requires entity normalization and coverage reconciliation |
| ABS datasets | Population, demographics, geographic context | Proposed | Geographic unit still TBD |
| SurfGuard extracts | Member home location, member club affiliation, possibly qualifications | Proposed | Direct feed unlikely; extract likely required |
| Branch Rescue Services asset/personnel data | RWC, UAV, DO assets and operators, home club attribution where known | Proposed | Source and completeness not yet confirmed |
| State / branch / club directories | Asserted national coverage baseline | Proposed | Needed to validate crawl completeness |
| Visitation datasets | Historical and projected beach visitation, preferably by period/hour | Proposed | Source and coverage not yet confirmed |
| Incident datasets | Rescue and fatality incidents | Proposed | Source and temporal granularity not yet confirmed |
| Alternative activity / commitment datasets | Competing options for volunteer time | Proposed | Methodology must be fair and broadly applicable |

## Data Ownership, Permission, and Privacy
- Every dataset used by the project shall have an identifiable owner or steward.
- The project shall maintain a dataset register that records for each dataset:
  - dataset name
  - owner or steward
  - acquisition source
  - permission or license basis
  - usage restrictions
  - confidentiality classification
  - whether the dataset contains, could contain, or has been derived from personal information
- Datasets should be classified at minimum as:
  - public
  - permissioned
  - restricted
  - commercial-in-confidence
- Restricted or commercial-in-confidence datasets shall have explicit documentation of permission to use them for this project and any limits on storage, transformation, sharing, publication, or retention.
- Public availability shall not be assumed to imply unrestricted reuse. Where public data has terms of use or attribution requirements, those shall be recorded and respected.
- The project shall avoid storing private or personally identifiable information.
- Where analysis requires member-linked data, the preferred approach shall be to use:
  - aggregation
  - de-identification
  - pseudonymisation only if aggregation is not sufficient
- Home-location analysis shall be designed to avoid retaining exact personal addresses if a coarser geography or derived distance/travel measure is sufficient.
- Outputs and visualisations shall not expose personal information or permit easy re-identification through overly granular reporting.
- Data ingestion and transformation steps should preserve enough provenance to show which derived outputs depend on which source datasets and permission basis.
- If a valid permission basis for a dataset is unknown, that dataset should not be treated as approved for project use.

## Outputs

| Output | Required Inputs | Optional Inputs | Status if Inputs Missing | Notes |
|---|---|---|---|---|
| Club / branch / service inventory | Directories or Beachsafe data | Coverage reconciliation data | Provisional if asserted directories are incomplete | Must distinguish discovered vs expected entities |
| Coverage completeness report | Crawl data, asserted directories | Classification mappings | Valid without all downstream datasets | Should identify missing, unmatched, duplicated, ambiguous entities |
| Patrol/service schedule extract | Beachsafe or other service schedule source | Classification mappings | Provisional if only partial geographies available | Must state source coverage |
| Rescue Services asset/personnel register | Branch Rescue Services asset/personnel data | Club directories, member extracts | Provisional if home club attribution or coverage is partial | Must distinguish known attribution from unknown attribution |
| Demographic catchment view | Club/service locations, ABS geography/population data | Travel-time matrix | Provisional if geography choice unresolved | Should not imply membership propensity without model basis |
| Member travel analysis | Member home-location extract, club affiliation, club locations | Travel-time matrix | Not yet comparable without member-location data | Must separate observed travel from inferred accessibility |
| Cross-service contribution view | Club patrol data, Rescue Services asset/personnel data, club/member attribution data | Incident and visitation data | Provisional if attribution is partial | Should report service provision by club members across club and branch channels |
| Contextual benchmarking view | Club/branch entities, contextual factors | Member, visitation, incident, service data | Provisional if major contextual layers missing | Must label comparison basis |
| Visitation / demand layer | Visitation data, service locations | Patrol schedules, weather or seasonal context | Provisional if temporal granularity varies | Use finest consistent period available |
| Incident overlay | Incident data, geography mapping | Visitation and patrol data | Provisional if geography or time alignment is partial | Must keep observed incidents distinct from inferred risk |
| Opportunity / constraint analysis | Contextual inputs, member/service data | Competing-commitment data | Not yet comparable until key explanatory inputs exist | Should favour explainability in early versions |
| Map overlays | Core geographic layers and entity coordinates | Any analytical layer | Valid with partial layers if coverage is disclosed | Should support multiple overlays, not a single baked map |

## Method Traceability and Reviewability
- Each material analytical component should identify its methodological basis in a design note, implementation note, or code-adjacent documentation.
- Where a recognised methodology family is used, the project should record:
  - the method name
  - the specific variant or simplification used
  - why it was chosen for this use case
  - key assumptions and limitations
  - principal references or source documents
- Where custom logic is introduced, the project should explicitly state that it is project-specific and record which accepted methods it borrows from, approximates, or departs from.
- Code implementing a material analytical method should include enough nearby documentation to let a reviewer answer:
  - what method is this implementing
  - where is the design/reference document
  - what inputs and outputs does it assume
  - what known limitations or caveats apply
- Design documents should map major outputs to methods. For example:
  - catchment overlap view -> 2SFCA-family accessibility method
  - contextual comparison -> multilevel or hierarchical model
  - incident burden model -> Poisson or negative binomial count model
  - sparse spatial risk surface -> Bayesian spatial smoothing
- The project should maintain a lightweight methodology register or equivalent reference list as methods are adopted.
- Method traceability should be treated as part of reviewability, not as optional commentary.

## Assumptions and Risks
- Assumption: Beachsafe data will provide enough structure to support service discovery and schedule extraction.
- Assumption: ABS data will provide usable population and demographic context for strategic comparison.
- Assumption: SurfGuard extracts may be obtainable periodically even if direct integration is unavailable.
- Assumption: Some required datasets will be unavailable at project start.
- Risk: Beachsafe responses may represent the same operational entity multiple ways, causing duplication or attribution errors.
- Risk: Incomplete reference directories may make completeness reporting appear stronger than it is.
- Risk: Travel, visitation, and incident datasets may differ in geography and time granularity, reducing comparability.
- Risk: Rescue Services asset and personnel data may have incomplete home-club attribution, limiting fair cross-service reporting.
- Risk: Alternative-activity data may be difficult to source consistently without introducing coverage bias.
- Risk: Overly complex modelling could reduce interpretability and trust.
- Risk: Publicly accessible datasets may still carry terms-of-use restrictions that limit scraping, storage, redistribution, or publication.
- Risk: Commercial-in-confidence or restricted datasets may impose constraints on analysis outputs, documentation, or reproducibility.
- Risk: Member-linked data could create privacy or re-identification risk if stored or reported at excessive granularity.

## Open Questions
- What is the primary growth target: all members, active members, qualified members, patrol capability, or patrol hours?
- What geographic unit should be primary: SA1, SA2, suburb, postcode, or LGA?
- How should NSW Metro and Country boundaries be operationally defined?
- Which visitation dataset will be used, and what temporal resolution is realistically available?
- Which incident datasets will be used, and what incident classes beyond rescues and fatalities should be included?
- Should travel modelling use road travel time, straight-line distance, or both?
- What is the first-phase methodology for identifying competing commitments and alternative options?
- Is there any historical recruitment-effort data that can help distinguish effort from structural context?
- What club-level capability or qualification data is available reliably enough for fair comparison?
- What authoritative source will provide Rescue Services asset/personnel data and how complete will home-club attribution be?
- What privacy-safe member-location representation is sufficient for travel and catchment analysis?
- What dataset register format should be used to track ownership, permissions, confidentiality, and privacy status?

## Decision Log
- 2026-03-26: The living requirements specification will be maintained as Markdown in the repository rather than as a separate formal governance document.
- 2026-03-26: A project-local skill will be used to enforce structure and guardrails for the requirements document.
- 2026-03-26: Repository-local skills will live under `.agents/skills`.
- 2026-03-26: The default git branch for the repository was changed from `master` to `main`.
- 2026-03-26: Cross-service reporting shall include branch Rescue Services assets and personnel, with home-club attribution where known.
- 2026-03-26: Methodology usage shall be traceable in design documentation and, where relevant, code-adjacent documentation.
- 2026-03-27: Data ownership, permission status, confidentiality classification, and privacy controls shall be treated as core project requirements.

## Change Log
- 2026-03-26: Created initial provisional requirements document from elicitation notes and provisional formal specification.
