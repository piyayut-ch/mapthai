# load prerequisites
pkgs <- c(
  "sf", "geojsonio", "readxl", "writexl", "tidyverse", 
  "janitor", "leaflet", "here"
)
xfun::pkg_attach2(pkgs)
setwd(here())

# read simplified geojson files
tha1_sim <- st_read("data-raw/geojson/th_adm1.geojson") |> clean_names()
tha2_sim <- st_read("data-raw/geojson/th_adm2.geojson") |> clean_names()
tha3_sim <- st_read("data-raw/geojson/th_adm3.geojson") |> clean_names()
# worldsub_sim <- st_read("data-raw/geojson/worldsub.geojson") |> clean_names()

# create a new sf object by aggregating up from sub district
adm3 <- c("adm3_pcode", "adm3_en", "adm3_th")
adm2 <- c("adm2_pcode", "adm2_en", "adm2_th")
adm1 <- c("adm1_pcode", "adm1_en", "adm1_th")

tha3 <- tha3_sim |>
  select( all_of(c(adm3, adm2, adm1)) )

tha2 <- tha3 |>
  group_by( across(c(adm2, adm1)) ) |>
  summarise(
    geometry = st_union(geometry)
  ) |> ungroup()

tha1 <- tha2 |>
  group_by( across(adm1) ) |>
  summarise(
    geometry = st_union(geometry)
  ) |> ungroup()

# generate reference table
ref_tha <- tha3 |>
  st_drop_geometry()

ref_tha |> write_xlsx("data-raw/ref/ref_tha.xlsx")

# historical map
ref_tha1_change <- read_excel("data-raw/ref/ref_tha1_change.xlsx") |>
  mutate(year_change = stringr::str_sub(date_change, 1, 4))

years_changes <- ref_tha1_change |>
  count(year_change) |>
  pull(year_change)

years_changes

gen_tha1_hist <- function(.year) {
  tha2 |>
    left_join(
      ref_tha1_change |> filter(year_change >= .year),
      by = c("adm2_pcode" = "adm2_pcode_new")
    ) |>
    mutate(adm1_pcode_old = ifelse(
      is.na(adm1_pcode_old),
      adm1_pcode,
      adm1_pcode_old)
    ) |>
    group_by( across(adm1_pcode_old) ) |>
    summarise(
      geometry = st_union(geometry)
    ) |> ungroup()
}

tha1_2554 <- gen_tha1_hist(2554)
tha1_2536 <- gen_tha1_hist(2536)
tha1_2525 <- gen_tha1_hist(2525)
tha1_2520 <- gen_tha1_hist(2520)
tha1_2515 <- gen_tha1_hist(2515)
tha1_2490 <- gen_tha1_hist(2490)
tha1_2489 <- gen_tha1_hist(2489)

# write rda file into data folder
usethis::use_data(tha3, tha2, tha1, ref_tha, overwrite = TRUE)

usethis::use_data(
  tha1_2554, tha1_2536, tha1_2525, tha1_2520,
  tha1_2515, tha1_2490, tha1_2489,
  overwrite = TRUE)
usethis::use_data(ref_tha1_change, overwrite = TRUE)

rice_2562 <- read_excel("data-raw/rice_2562.xlsx")

usethis::use_data(rice_2562, overwrite = TRUE)
