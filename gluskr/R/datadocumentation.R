#' @title transit_qol_df
#' @description Data frame with quality of life and transit data from 2007-2017
#' @format A data frame with 3416 rows and 42 variables:
#' \describe{
#'   \item{\code{msa_id}}{double msa_id is a numeric code that uniquely identifies all metropolitan and micropolitan statistical geographic areas for which the Census Bureau tabulates data.}
#'   \item{\code{msa_name}}{character The name of the area associated with a particular metropolitan or micropolitan statistical geographic areas.}
#'   \item{\code{pop_estimate_msa}}{integer The estimated population for the area dilineated by a specific GEOID.  }
#'   \item{\code{year}}{double The year for which the data associated in that row was collected. }
#'   \item{\code{median_household_income_msa}}{integer Median household income is recorded in dollars.  It refers to the income and benefits for a household in inflation-adjusted dollars.  These data came from a table for each year, so the value was calculated in inflation-adjusted dollars for any given year.}
#'   \item{\code{percent_commuting_msa}}{double A percentage of the number of workers who commuted by public transportation (which excludes taxicabs) divided by the total number of workers 16 years and older.  Workers include members of the Armed Forces and civilians who were at work the week before the survey was given out.  }
#'   \item{\code{percent_unemployed_msa}}{double A percentage of the number of unemployed individuals in the civilian labor force who are counted in the population 16 years and older.}
#'   \item{\code{percent_no_insurance_msa}}{double Percentage of the noninstitutionalized civilian population without health insurance coverage.}
#'   \item{\code{percent_below_poverty_level}}{double For the years 2010-2017, this variable exists.  This is the percentage of all people in the United States who have income below the poverty level.  }
#'   \item{\code{gdp_msa}}{double A measure of gross domestic product across all industries in millions of current dollars. }
#'   \item{\code{intptlat}}{double Internal point latitude for each specific metropolitan and micropolitan statistical entity. }
#'   \item{\code{intptlon}}{double Internal point longitude for each specific metropolitan and micropolitan statistical entity.}
#'   \item{\code{ua_census_id}}{character The census' unique id code for every urbanized area in the US.}
#'   \item{\code{ua_sq_miles_2010}}{double The size of the urbanized area in 2010 in square miles.}
#'   \item{\code{ua_fta_name}}{character The urbanized area's name.}
#'   \item{\code{transit_modes}}{character The mode of transit categorized as rail, non-rail bus, and non-rail other. The following modes of transit are grouped into rail: Alaska Railroad (AR), Cable Car (CC), Commuter Rail (CR), Heavy Rail (HR), Hybrid Rail (YR), Inclined Plane (IP), Light Rail (LR), Monorail/Automated Guideway (MG), Streetcar Rail (SR). The following modes of transit are grouped into non-rail bus: Commuter Bus (CB), Bus (MB), Bus Rapid Transit (RB), Jitney (JT),  Público (PB), Trolleybus (TB). The following modes of transit are grouped into non-rail other: Ferryboat (FB), Aerial Tramway (TR), Vanpool (VP), Demand Response (DR), Demand Response – Taxi (DT).}
#'   \item{\code{total_transit_expenses}}{double Total expenses for all transit agencies in the urbanized area.}
#'   \item{\code{total_fares}}{double Total fares collected by all transit agencies in the urbanized area.}
#'   \item{\code{directional_route_miles}}{double Defined by the FTA as: "The mileage in each direction over which public transportation vehicles travel while in revenue service."}
#'   \item{\code{vehicle_hours}}{double Also known as Vehicle Revenue Hours. It is defined by the FTA as: "The hours that vehicles are scheduled to or actually travel while in revenue service."}
#'   \item{\code{vehicle_miles}}{double Also known as Vehicle Revenue Miles. It is defined by the FTA as: "The miles that vehicles are scheduled to or actually travel while in revenue service."}
#'   \item{\code{passenger_miles}}{double Defined by the FTA as: "The cumulative sum of the distances ridden by each passenger."}
#'   \item{\code{passenger_trips}}{double Also known as Unlinked Passenger Trips. It is defined by the FTA as: "The number of passengers who board public transportation vehicles. Passengers are counted each time they board vehicles no matter how many vehicles they use to travel from their origin to their destination."}
#'   \item{\code{total_stations_2017}}{double The total number of stations within the given urbanized area in 2017.}
#'   \item{\code{total_funding}}{double Total funding of transit agencies in the given urbanized area for that year. It is the sum of federal_funding, state_funding, local_funding, other_funding.}
#'   \item{\code{federal_funding}}{double Funding for the transit agencies in the given urbanized area from the federal government.}
#'   \item{\code{state_funding}}{double Funding for the transit agencies in the given urbanized area from the relevant state government.}
#'   \item{\code{local_funding}}{double Funding for the transit agencies in the given urbanized area from the relevant local government.}
#'   \item{\code{other_funding}}{double Funding for the transit agencies in the given urbanized area that is derived from other sources. This can include fares, advertising, parking fees, etc.}
#'   \item{\code{per_capita_gdp}}{double The 'gdp_msa' divided by 'pop_estimate_msa' to get a gdp per capita statistic.}
#'   \item{\code{pmt_per_vrm}}{double A metric. Defined as 'passenger_miles' divided by 'vehicle_miles'.}
#'   \item{\code{pmt_per_vrh}}{double A metric. Defined as 'passenger_miles' divided by 'vehicle_hours'.}
#'   \item{\code{upt_per_vrh}}{double A metric. Defined as 'passenger_trips' divided by 'vehicle_hours'.}
#'   \item{\code{per_capita_vrm}}{double A metric. Defined as 'vehicle_miles' divided by 'pop_estimate_msa'.}
#'   \item{\code{per_capita_vrh}}{double A metric. Defined as 'vehicle_hours' divided by 'pop_estimate_msa'.}
#'   \item{\code{per_capita_pmt}}{double A metric. Defined as 'passenger_miles' divided by 'pop_estimate_msa'.}
#'   \item{\code{per_capita_upt}}{double A metric. Defined as 'passenger_trips' divided by 'pop_estimate_msa'.}
#'   \item{\code{recovery_ratio}}{double A metric. Defined as 'total_fares' divided by 'total_transit_expenses'. Almost always below 1 as each individual fares doesn't cover the whole cost of public transit. Essentially measures the percent loss a transit agency takes per passenger trip.}
#'   \item{\code{fares_per_upt}}{double A metric. Defined as 'total_fares' divided by 'passenger_trips'.}
#'   \item{\code{cost_per_hour}}{double A metric. Defined as 'total_transit_expenses' divided by 'vehicle_hours'.}
#'   \item{\code{cost_per_trip}}{double A metric. Defined as 'total_transit_expenses' divided by 'passenger_trips'.}
#'   \item{\code{cost_per_pmt}}{double A metric. Defined as 'total_transit_expenses' divided by 'passenger_miles'.}
#'}
#' @source \url{}
"transit_qol_df"
