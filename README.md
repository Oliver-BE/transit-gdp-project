# Gluskr Documentation
Oliver Baldwin Edwards, 
Nicole Frontero, &
Martin Glusker

 --- 
 
**Variable Definitions**

**`msa_id`**
Msa_id is a numeric code that uniquely identifies all metropolitan and micropolitan statistical geographic areas for which the Census Bureau tabulates data. This is identical to the census' 'GEOid.2'. 


**`msa`**
The name of the area associated with a particular metropolitan or micropolitan statistical geographic areas.


**`pop_estimate_msa`**
The estimated population for the area dilineated by a specific msa_id.  


**`year`**
The year for which the data associated in that row was collected. 


**`median_household_income_msa`**
Median household income is recorded in dollars.  It refers to the income and benefits for a household in inflation-adjusted dollars.  These data came from a table for each year, so the value was calculated in inflation-adjusted dollars for any given year. 


**`percent_workers_commuting_by_public_transit_msa`**
A percentage of the number of workers who commuted by public transportation (which excludes taxicabs) divided by the total number of workers 16 years and older.  Workers include members of the Armed Forces and civilians who were at work the week before the survey was given out.  

**`percent_unemployed_msa`**
A percentage of the number of unemployed individuals in the civilian labor force who are counted in the population 16 years and older.

**`percent_no_insurance_msa`**
Percentage of the noninstitutionalized civilian population without health insurance coverage.

**`percent_below_poverty_level`**
For the years 2010-2017, this variable exists.  This is the percentage of all people in the United States who have income below the poverty level.  

**`gdp_msa`**
A measure of gross domestic product across all industries in millions of current dollars.  

**`intptlat`**
Internal point latitude for each specific metropolitan and micropolitan statistical entity. 

**`intptlon`**
Internal point longitudefor each specific metropolitan and micropolitan statistical entity. 

**`ua_census_id`**
The census' unique id code for every urbanized area in the US. 

**`ua_sq_miles_2010`**
The size of the urbanized area in 2010

**`ua_fta_name`**
The urbanized area's name. 

**`transit_modes`**
The mode of transit categorized as rail, non-rail bus, and non-rail other. The following modes of transit are grouped into rail: Alaska Railroad (AR), Cable Car (CC), Commuter Rail (CR), Heavy Rail (HR), Hybrid Rail (YR), Inclined Plane (IP), Light Rail (LR), Monorail/Automated Guideway (MG), Streetcar Rail (SR). The following modes of transit are grouped into non-rail bus: Commuter Bus (CB), Bus (MB), Bus Rapid Transit (RB), Jitney (JT),  Público (PB), Trolleybus (TB). The following modes of transit are grouped into non-rail other: Ferryboat (FB), Aerial Tramway (TR), Vanpool (VP), Demand Response (DR), Demand Response – Taxi (DT). 

**total_transit_expenses**
Total expenses for all transit agencies in the urbanized area. 

**total_fares**
Total fares collected by all transit agencies in the urbanized area. 

**directional_route_miles**
Defined by the FTA as: "The mileage in each direction over which public transportation vehicles travel while in revenue service."

**`vehicle_hours`** 
Also known as Vehicle Revenue Hours. It is defined by the FTA as: "The hours that vehicles are scheduled to or actually travel while in revenue service."

**`vehicle_miles`**  
Also known as Vehicle Revenue Miles. It is defined by the FTA as: "The miles that vehicles are scheduled to or actually travel while in revenue service.""

**passenger_miles**
Defined by the FTA as: "The cumulative sum of the distances ridden by each passenger."

**`passenger_trips`**    
Also known as Unlinked Passenger Trips. It is defined by the FTA as: "The number of passengers who board public transportation vehicles. Passengers are counted each time they board vehicles no matter how many vehicles they use to travel from their origin to their destination."

**`total_stations_2017`**
The total number of stations within the given urbanized area in 2017.

**`total_funding`**  
Total funding of transit agencies in the given urbanized area for that year. It is the sum of federal_funding, state_funding, local_funding, other_funding. 

**`federal_funding`**
Funding for the transit agencies in the given urbanized area from the federal government. 

**`state_funding`**  
Funding for the transit agencies in the given urbanized area from the relevant state government.

**`local_funding`**  
Funding for the transit agencies in the given urbanized area from the relevant local government.

**`other_funding`**
Funding for the transit agencies in the given urbanized area that is derived from other sources. This can include fares, advertising, parking fees, etc. 

**`per_capita_gdp`**
The `gdp_msa` divided by `pop_estimate_msa` to get a gdp per capita statistic.

**`pmt_per_vrm`**
A metric. Defined as `passenger_miles` divided by `vehicle_miles`. 

**`pmt_per_vrh`**
A metric. Defined as `passenger_miles` divided by `vehicle_hours`. 

**`upt_per_vrh`**
A metric. Defined as `passenger_trips` divided by `vehicle_hours`. 

**`per_capita_vrm`**
A metric. Defined as `vehicle_miles` divided by `pop_estimate_msa`. 

**`per_capita_vrh`**
A metric. Defined as `vehicle_hours` divided by `pop_estimate_msa`. 

**`per_capita_pmt`**
A metric. Defined as `passenger_miles` divided by `pop_estimate_msa`. 

**`per_capita_upt`**
A metric. Defined as `passenger_trips` divided by `pop_estimate_msa`. 

**`recovery_ratio`**
A metric. Defined as `total_fares` divided by `total_transit_expenses`. Almost always below 1 as each individual fares doesn't cover the whole cost of public transit. Essentially measures the percent loss a transit agency takes per passenger trip. 

**`fares_per_upt`**
A metric. Defined as `total_fares` divided by `passenger_trips`. 

**`cost_per_hour`**
A metric. Defined as `total_transit_expenses` divided by `vehicle_hours`. 

**`cost_per_trip`**
A metric. Defined as `total_transit_expenses` divided by `passenger_trips`. 

**`cost_per_pmt`**
A metric. Defined as `total_transit_expenses` divided by `passenger_miles`.


 --- 

***Notes***


*Internal Points* 
The Census Bureau calculates an internal point (latitude and longitude coordinates) for each geographic entity.  For many geographic entities, the internal point is at or near the geographic center of the entity.  For some irregularly shaped entities (such as those shaped like a crescent), the calculated geographic center may be located outside the boundaries of the entity.  In such instances, the internal point is identified as a point inside the entity boundaries nearest to the calculated geographic center and, if possible, within a land polygon.  (https://www.census.gov/geo/reference/gtc/gtc_area_attr.html).

*Metrics*
The Federal Transit Adminastration uses all these metrics. The FTA's Small Transit Intensive Cities (STIC) Formula to determine funding allocation uses the following metrics: 1. Passenger miles traveled per vehicle revenue mile, 2. Passenger miles traveled per vehicle revenue hour 3. Vehicle revenue miles per capita, 4.Vehicle revenue hours per capita, 5.Passenger miles traveled per capita, and 6.Passengers per capita. 

The FTA's file called "Metrics" includes "Fare Revenues per Unlinked Passenger Trip", "Fare Revenues per Total Operating Expense (Recovery Ratio)", "Cost per
 Hour",	"Passengers per Hour",	"Cost per Passenger", and	"Cost per Passenger Mile." That was how we decided to use these statistics as metrics. 
 
 --- 

***Sources***

The variables `median_household_income_msa`, `percent_workers_commuting_by_public_transit_msa`, `percent_unemployed_msa`, `percent_no_insurance_msa`, `percent_no_insurance_msa` and `percent_below_poverty_level` were obtained from:

The United States Census Bureau, American Fact Finder website
Table ID = DP03
Table Title = "Selected Economic Characteristics"
Data Set = "ACS (American Community Survey) 1-year estimates" from years 2007-2017


 
The variable `gdp_msa` was obtained from: 

The Bureau of Economic Analysis, U.S. Department of Commerce
Table: GDP and Personal Income/Gross Domestic Product (GDP)
Area/Statistic:
  Area: United States (Metropolitan Portion)
  Statistic: All industry total
  Unit of Measure: Levels
Period: 2007-2017

The variables `ua_census_id`, `ua_pop_2010`, `ua_sq_miles_2010`, `ua_fta_name`, `transit_modes`, `passenger_trips`, `vehicle_miles` ,`vehicle_hours`, `total_stations_2017`, `total_funding`, `state_funding`, `local_funding`, `other_funding` were obtained from: 

The National Transportation Database, Federal Transit Administration
Period: 2007-2017

The variables `intptlat`, `intptlon` were obtained from: 

The United Census Bureau, TigerWeb
Tab: Nation-Based DataFiles
Tables: Metropolitan Statistical Areas - Census 2010, Micropolitan Statistical Areas - Census 2010


