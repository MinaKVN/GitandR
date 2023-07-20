#GITHUB stuff
library(usethis)
use_github(protocol = 'https', auth_token = Sys.getenv("GITHUB_PAT"))

# Data manipulation and plotting
library(dplyr)
library(ggplot2)

# Checking data completeness
library(naniar)

# Spatial analyses
library(sf)
library(mapview)

