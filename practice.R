#github instructions
#library(usethis)
#create_github_token(scopes = c("repo", "user", "gist", "workflow"),description = "DESCRIBE THE TOKEN'S USE CASE",host = NULL)
#edit_r_environ() #to save the token
#use_github(protocol = 'https', auth_token = "name of the token")


# Data manipulation and plotting
library(dplyr)
library(ggplot2)

# Checking data completeness
library(naniar)

# Spatial analyses
library(sf)
library(mapview)
#download weather data for all of Ontario
library(weathercan)

#see when the list got updated
stations_dl()
stations_meta()

# Get the list of all weather stations
all_stations <- stations()

# Filter stations for Ontario
on <-
	filter(stations(), interval == "day", prov == "ON") %>%
	select(-prov, -climate_id, -WMO_id, -TC_id)
on

# Fetch daily weather data for each station and store in a list for each year 
#(this way we will get more stations per year and it takes a while to get data for one year_be patient)
weather_data <-
	lapply(on$station_id, function(station_id) {
		daily_data <-
			weather_dl(station_id,
					   start = "2022-01-01",
					   end = "2022-12-31",
					   interval = "day")
		return(daily_data)
	})

# Combine the weather data for all stations into a single data frame
yr2022 <- do.call(rbind, weather_data)
head(yr2022)
