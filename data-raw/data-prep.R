# load prerequisites
pkgs <- c(
  "sf", "geojsonio", "readxl", "writexl", "tidyverse", 
  "janitor", "leaflet", "here"
)
xfun::pkg_attach2(pkgs)
setwd(here())

# read raw geojson files
tha1_sim <- st_read("data-raw/geojson/th_adm1.geojson") %>% clean_names()
tha2_sim <- st_read("data-raw/geojson/th_adm2.geojson") %>% clean_names()
tha3_sim <- st_read("data-raw/geojson/th_adm3.geojson") %>% clean_names()
# worldsub_sim <- st_read("data-raw/geojson/worldsub.geojson") %>% clean_names()

# create a new sf object by aggregating up from sub district
adm3 <- c("adm3_pcode", "adm3_en", "adm3_th")
adm2 <- c("adm2_pcode", "adm2_en", "adm2_th")
adm1 <- c("adm1_pcode", "adm1_en", "adm1_th")

tha3 <- tha3_sim %>%
  select( all_of(c(adm3, adm2, adm1)) )

tha2 <- tha3 %>%
  group_by( across(c(adm2, adm1)) ) %>%
  summarise(
    geometry = st_union(geometry)
  ) %>% ungroup()

tha1 <- tha2 %>%
  group_by( across(adm1) ) %>%
  summarise(
    geometry = st_union(geometry)
  ) %>% ungroup()

# generate
ref_tha <- tha3 %>%
  st_drop_geometry()

ref_tha %>% write_xlsx("data-raw/ref/ref_tha.xlsx")

usethis::use_data(tha3, tha2, tha1, ref_tha, overwrite = TRUE)

rice_2562 <- read_excel("data-raw/rice_2562.xlsx")

usethis::use_data(rice_2562, overwrite = TRUE)
