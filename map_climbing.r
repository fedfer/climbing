# leaflet map
# https://rstudio.github.io/leaflet/

#### DATA FRAME CLIMBING PLACES
df = data.frame(matrix(ncol = 5, nrow = 0))
colnames(df) = c("place","lat","lng","type","year")
df[1,] = c("Pilot Mountain",36.342716,-80.474407,"Lead Climbing",2019)
df[2,] = c("Arco",45.929563, 10.889770,"Multi-pitch",2019)
df[3,] = c("Pietra di Bismantova",44.422374, 10.413951,"Multi-pitch",2019)
df[4,] = c("Passo Fedaia",46.456491, 11.860149,"Lead Climbing",2019)
df[5,] = c("Sasso Bruno - Passo Pordoi",46.489010, 11.796582,"Lead Climbing",2019)
df[6,] = c("Sasso Malga - Passo Sella",46.512370, 11.758457,"Lead Climbing",2019)
df[7,] = c("Torri del Sella",46.511015, 11.779914,"Multi-pitch",2019)


#### DATA FRAME CLIMBING ROUTES
df_routes = data.frame(matrix(ncol = 9, nrow = 0))
colnames(df_routes) = c("place","name","type","year","month","grade",
                        "vertical_meters","vertical_feet","pitches")
df_routes[1,] = c("Arco","La Bellezza della Venere","Multi-pitch",2019,"May","IV+",320,1050,9)
df_routes[2,] = c("Arco","Due Piccoli Pilastri","Multi-pitch",2019,"May","V+",150,500,4)
df_routes[3,] = c("Pietra di Bismantova","Zuffa/Ruggiero","Multi-pitch",2019,"July","V",105,350,5)
df_routes[4,] = c("Pietra di Bismantova","Italia 90 - variante Penna","Multi-pitch",2019,"July","6a",125,410,4)
df_routes[5,] = c("Torri del Sella","Spigolo Steger","Multi-pitch",2019,"July","IV+",140,460,5)


library(leaflet)
library(magrittr)
df$lat = as.numeric(df$lat) ; df$lng = as.numeric(df$lng)
m = leaflet(df) %>% addTiles()
m %>% addCircleMarkers(fill = FALSE)


getColor <- function(data) {
  sapply(data$type, function(type) {
    if(type == "Lead Climbing") {
      "red"
    } else if(type == "Multi-pitch") {
      "green"
    } else {
      "orange"
    } })
}

icons <- awesomeIcons(
  icon = 'ios-close',
  iconColor = 'black',
  library = 'ion',
  markerColor = unname(getColor(df))
)

leaflet(df) %>% addTiles() %>%
  addAwesomeMarkers(~lng, ~lat, icon=icons, label=~as.character(type))


pal <- colorFactor(c("red", "green","orange"), 
                   domain = c("Lead Climbing", "Multi-pitch","Boulder"))
leaflet(df) %>% addTiles() %>%
  addCircleMarkers(
    color = ~pal(type),
    stroke = FALSE, fillOpacity = 0.5
  )




m = leaflet() %>% addTiles()
df = data.frame(
  lat = rnorm(100),
  lng = rnorm(100),
  size = runif(100, 5, 20),
  color = sample(colors(), 100)
)
m %>% addCircleMarkers(radius = ~size, color = ~color, fill = FALSE)
m %>% addCircleMarkers(radius = runif(100, 4, 10), color = c('red'))



data(quakes)

df.20 <- quakes[1:20,]

getColor <- function(quakes) {
  sapply(quakes$mag, function(mag) {
    if(mag <= 4) {
      "green"
    } else if(mag <= 5) {
      "orange"
    } else {
      "red"
    } })
}

icons <- awesomeIcons(
  icon = 'ios-close',
  iconColor = 'black',
  library = 'ion',
  markerColor = getColor(df.20)
)

leaflet(df.20) %>% addTiles() %>%
  addAwesomeMarkers(~long, ~lat, icon=icons, label=~as.character(mag))






