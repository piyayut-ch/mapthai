# load prerequisites
pkgs <- c(
  "sf", "geojsonio", "readxl", "writexl", "tidyverse", 
  "janitor", "leaflet", "here"
)
xfun::pkg_attach2(pkgs)
setwd(here())

# read raw geojson files
th1_sim <- st_read("data-raw/geojson/th_adm1.geojson") %>% clean_names()
th2_sim <- st_read("data-raw/geojson/th_adm2.geojson") %>% clean_names()
th3_sim <- st_read("data-raw/geojson/th_adm3.geojson") %>% clean_names()
# worldsub_sim <- st_read("data-raw/geojson/worldsub.geojson") %>% clean_names()

# create a new sf object by aggregating up from sub district
adm3 <- c("adm3_pcode", "adm3_en", "adm3_th")
adm2 <- c("adm2_pcode", "adm2_en", "adm2_th")
adm1 <- c("adm1_pcode", "adm1_en", "adm1_th")

th3 <- th3_sim %>%
  select( all_of(c(adm3, adm2, adm1)) )

th2 <- th3 %>%
  group_by( across(c(adm2, adm1)) ) %>%
  summarise(
    geometry = st_union(geometry)
  ) %>% ungroup()

th1 <- th2 %>%
  group_by( across(adm1) ) %>%
  summarise(
    geometry = st_union(geometry)
  ) %>% ungroup()

# generate
ref_th <- th3 %>%
  st_drop_geometry()

ref_th %>% write_xlsx("data-raw/ref/ref_th.xlsx")

usethis::use_data(th3, th2, th1, ref_th, overwrite = TRUE)
