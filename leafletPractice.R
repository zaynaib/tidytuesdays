#' load leaflet library
#' leaflet widget leaflet
#' add map tile

# Code smells
#questions what I'm trying to do
#pivot_longer
#pivot_wider
#3rd normal form - tabluar - certain standardize
#one row per topic
#one topic per row


library(leaflet)

leaflet() %>%
  addTiles()


leaflet () %>%
  addProviderTiles("CartoDB") %>%
  addMarkers(lng = dc_hq$lon,
             lat = dc_hq$lat,
             popup = dc_hq$hq) 
  