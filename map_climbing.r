# leaflet map
# https://rstudio.github.io/leaflet/
library(leaflet)

df = data.frame(Lat = 1:10, Long = rnorm(10))
leaflet(df) %>% addCircles()


m <- leaflet() %>% setView(lng = -71.0589, lat = 42.3601, zoom = 2)
m %>% addTiles()
df = data.frame(
  lat = 36.342716,
  lng = -80.474407
)
m = leaflet(df) %>% addTiles()
m %>% addCircleMarkers(fill = FALSE)

m = leaflet() %>% addTiles()
df = data.frame(
  lat = rnorm(100),
  lng = rnorm(100),
  size = runif(100, 5, 20),
  color = sample(colors(), 100)
)
m %>% addCircleMarkers(radius = ~size, color = ~color, fill = FALSE)
m %>% addCircleMarkers(radius = runif(100, 4, 10), color = c('red'))