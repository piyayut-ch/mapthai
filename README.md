
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mapthai

<!-- badges: start -->
<!-- badges: end -->

The goal of mapthai is to provide mapdata of Thailand and world in
geojson and rda (`sf`) format.

## Installation

You can install the released version of mapthai from
[github](https://github.com/piyayut-ch) with:

``` r
# remotes::install_github("piyayut-ch/mapdata")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(mapthai)
library(leaflet)

# basic example code
plot(th2) 
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r
# leaflet(th2) %>%
#  addProviderTiles(providers$CartoDB.DarkMatter) %>%
#  addPolygons(color = "white", weight = 1)
```
