# final-project
Oliver Baldwin Edwards, 
Nicole Frontero, &
Martin Glusker

***Documentation regarding the variables included in FINAL_DF***

**msa_id**
Msa_id is a numeric code that uniquely identifies all metropolitan and micropolitan statistical geographic areas for which the Census Bureau tabulates data.

**msa**
The name of the area associated with a particular metropolitan or micropolitan statistical geographic areas.

**pop_estimate_msa**
The estimated population for the area dilineated by a specific GEOID.  

**year**
The year for which the data associated in that row was collected. 

***The following data has been obtained from:***

The United States Census Bureau, American Fact Finder website
Table ID = DP03
Table Title = "Selected Economic Characteristics"
Data Set = "ACS (American Community Survey) 1-year estimates" from years 2007-2017

**median_household_income_msa**
Median household income is recorded in dollars.  It refers to the income and benefits for a household in inflation-adjusted dollars.  These data came from a table for each year, so the value was calculated in inflation-adjusted dollars for any given year. 

**percent_workers_commuting_by_public_transit_msa**
A percentage of the number of workers who commuted by public transportation (which excludes taxicabs) divided by the total number of workers 16 years and older.  Workers include members of the Armed Forces and civilians who were at work the week before the survey was given out.  

**percent_unemployed_msa**
A percentage of the number of unemployed individuals in the civilian labor force who are counted in the population 16 years and older.

REVISIT **percent_no_insurance_msa**

**percent_below_poverty_level**
For the years 2010-2017, this variable exists.  This is the percentage of all people in the United States who have income below the poverty level.  

***The following data has been obtained from:***
The Bureau of Economic Analysis, U.S. Department of Commerce
Table: GDP and Personal Income/Gross Domestic Product (GDP)
Area/Statistic:
  Area: United States (Metropolitan Portion)
  Statistic: All industry total
  Unit of Measure: Levels
Period: 2007-2017

**gdp_msa**
A measure of gross domestic product across all industries in millions of current dollars.  

***The following data has been obtained from:***
The United Census Bureau, TigerWeb
Tab: Nation-Based DataFiles
Tables: Metropolitan Statistical Areas - Census 2010, Micropolitan Statistical Areas - Census 2010


*Centroid*
The centroids of census blocks are the smallest entity for which the Census Bureau collects and tabulates decennial census information within the United States; bounded by visible features such as streets, streams, and railroad tracks, and by nonvisible boundaries such as selected property lines and city, township, school district, and county limits. 

**CENTLAT**
Centroid latitude.  The centroid latitude of the census block that the metropolitan or micropolitan area is associated with.  

**CENTLON**
Centroid longitude. The centroid longitude of the census block that the metropolitan or micropolitan area is associated with.  

*Internal Points:* The Census Bureau calculates an internal point (latitude and longitude coordinates) for each geographic entity.  For many geographic entities, the internal point is at or near the geographic center of the entity.  For some irregularly shaped entities (such as those shaped like a crescent), the calculated geographic center may be located outside the boundaries of the entity.  In such instances, the internal point is identified as a point inside the entity boundaries nearest to the calculated geographic center and, if possible, within a land polygon (https://www.census.gov/geo/reference/gtc/gtc_area_attr.html).

**INTPTLAT**
Internal point latitude for each specific metropolitan and micropolitan statistical entity. 

**INTPTLON**
Internal point longitudefor each specific metropolitan and micropolitan statistical entity. 


