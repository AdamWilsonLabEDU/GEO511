

library(terra)
library(spData)
library(tidyverse)
library(sf)


# download.file("https://crudata.uea.ac.uk/cru/data/temperature/absolute.nc","crudata.nc")

# read in the data using the rast() function from the terra package
tmean=rast("crudata.nc")
data(world)

max_temp <- tmean %>%
  max() %>%
  terra::extract(y=world, fun=max, na.rm=T, small=T)

world_clim=bind_cols(world,max_temp)

ggplot(world_clim,aes(fill=max))+
  geom_sf()+
  coord_sf(label_graticule="SW",label_axes="SW")+
  scale_fill_viridis_c(name="Maximum\nTemperature (C)")+
  theme(legend.position = 'bottom')


world_clim%>%
  group_by(continent)%>%
  slice_max(n=1,order_by=max) %>% 
  dplyr::select(name_long,continent,mux=max)%>%
  arrange(desc(min))%>%
  st_set_geometry(NULL)

