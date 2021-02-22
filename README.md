
# mapthai

An R package storing the ligtweight geospatial polygon data of Thailand
administrative level 1-3 including province (Changwat), district
(Amphoe) and subdistrict (Tambon) in geojson and rda (`sf` class)
format.

**Notes:** - Thailand maps are downloaded from
[UNOCHA](https://data.humdata.org/dataset/thailand-administrative-boundaries)
- Source: Royal Thai Survey Department update 6 November 2019 - Maps are
simplified using [mapshaper](https://mapshaper.org) - Import Options :
detect line intersections - Simplification menu : check prevent shape
removal - Method : Visvalingam / effective area

# แผนที่ไทย

R package ที่มีไฟล์แผนที่ขนาดเล็กของไทย เหมาะสำหรับการทำ data
visualization มีไฟล์ทั้ง geojson และ rda (ในรูปแบบ class `sf`)
โดยแผนที่ไทยมี 3 ระดับ ได้แก่ จังหวัด อำเภอ และตำบล

**หมายเหตุ:** - แผนที่ไทยโหลดมาจาก
[UNOCHA](https://data.humdata.org/dataset/thailand-administrative-boundaries)
- แหล่งข้อมูล: กรมแผนที่ทหาร เมื่อวันที่ 6 พ.ย. 2562 - ลดขนาดของแผนที่
(simplify) ด้วย webtool ที่ชื่อ [mapshaper](https://mapshaper.org)
โดยเลือกปรับแต่งค่าต่าง ๆ ดังนี้ - Import Options : detect line
intersections - Simplification menu : check prevent shape removal -
Method : Visvalingam / effective area

## Installation

You can install the released version of mapthai from [github
repo](https://github.com/piyayut-ch/mapthai) with:

``` r
# remotes::install_github("piyayut-ch/mapthai")
```

## Example

### 1. Plot map using plot method of `sf` class

``` r
library(mapthai)
library(sf)

# basic example code
plot(tha2[, c('adm2_pcode', 'adm1_pcode')]) 
```

<img src="man/figures/README-example-1.png" width="100%" />

### 2. Plot interactive plot using leaflet

``` r
library(leaflet)
leaflet(tha2) %>%
  addProviderTiles(providers$CartoDB) %>%
  addPolygons(color = "grey", weight = 1)
```

### 3. Reference table

``` r
library(dplyr)
library(gt)

ref_tha %>%
  head() %>%
  gt() %>%
  tab_options(table.font.size = px(14))
```

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#amnfowvjks .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 14px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#amnfowvjks .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#amnfowvjks .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#amnfowvjks .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#amnfowvjks .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#amnfowvjks .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#amnfowvjks .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#amnfowvjks .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#amnfowvjks .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#amnfowvjks .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#amnfowvjks .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#amnfowvjks .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#amnfowvjks .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#amnfowvjks .gt_from_md > :first-child {
  margin-top: 0;
}

#amnfowvjks .gt_from_md > :last-child {
  margin-bottom: 0;
}

#amnfowvjks .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#amnfowvjks .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#amnfowvjks .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#amnfowvjks .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#amnfowvjks .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#amnfowvjks .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#amnfowvjks .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#amnfowvjks .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#amnfowvjks .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#amnfowvjks .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#amnfowvjks .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#amnfowvjks .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#amnfowvjks .gt_left {
  text-align: left;
}

#amnfowvjks .gt_center {
  text-align: center;
}

#amnfowvjks .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#amnfowvjks .gt_font_normal {
  font-weight: normal;
}

#amnfowvjks .gt_font_bold {
  font-weight: bold;
}

#amnfowvjks .gt_font_italic {
  font-style: italic;
}

#amnfowvjks .gt_super {
  font-size: 65%;
}

#amnfowvjks .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="amnfowvjks" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm3_pcode</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm3_en</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm3_th</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm2_pcode</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm2_en</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm2_th</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm1_pcode</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm1_en</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm1_th</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">TH420803</td>
      <td class="gt_row gt_left">A Hi</td>
      <td class="gt_row gt_left">อาฮี</td>
      <td class="gt_row gt_left">TH4208</td>
      <td class="gt_row gt_left">Tha Li</td>
      <td class="gt_row gt_left">ท่าลี่</td>
      <td class="gt_row gt_left">TH42</td>
      <td class="gt_row gt_left">Loei</td>
      <td class="gt_row gt_left">เลย</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">TH940102</td>
      <td class="gt_row gt_left">A Noru</td>
      <td class="gt_row gt_left">อาเนาะรู</td>
      <td class="gt_row gt_left">TH9401</td>
      <td class="gt_row gt_left">Mueang Pattani</td>
      <td class="gt_row gt_left">เมืองปัตตานี</td>
      <td class="gt_row gt_left">TH94</td>
      <td class="gt_row gt_left">Pattani</td>
      <td class="gt_row gt_left">ปัตตานี</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">TH321305</td>
      <td class="gt_row gt_left">A Phon</td>
      <td class="gt_row gt_left">อาโพน</td>
      <td class="gt_row gt_left">TH3213</td>
      <td class="gt_row gt_left">Buachet</td>
      <td class="gt_row gt_left">บัวเชด</td>
      <td class="gt_row gt_left">TH32</td>
      <td class="gt_row gt_left">Surin</td>
      <td class="gt_row gt_left">สุรินทร์</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">TH950615</td>
      <td class="gt_row gt_left">A Song</td>
      <td class="gt_row gt_left">อาซ่อง</td>
      <td class="gt_row gt_left">TH9506</td>
      <td class="gt_row gt_left">Raman</td>
      <td class="gt_row gt_left">รามัน</td>
      <td class="gt_row gt_left">TH95</td>
      <td class="gt_row gt_left">Yala</td>
      <td class="gt_row gt_left">ยะลา</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">TH550711</td>
      <td class="gt_row gt_left">Ai Na Lai</td>
      <td class="gt_row gt_left">อ่ายนาไลย</td>
      <td class="gt_row gt_left">TH5507</td>
      <td class="gt_row gt_left">Wiang Sa</td>
      <td class="gt_row gt_left">เวียงสา</td>
      <td class="gt_row gt_left">TH55</td>
      <td class="gt_row gt_left">Nan</td>
      <td class="gt_row gt_left">น่าน</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">TH950204</td>
      <td class="gt_row gt_left">Aiyoe Weng</td>
      <td class="gt_row gt_left">อัยเยอร์เวง</td>
      <td class="gt_row gt_left">TH9502</td>
      <td class="gt_row gt_left">Betong</td>
      <td class="gt_row gt_left">เบตง</td>
      <td class="gt_row gt_left">TH95</td>
      <td class="gt_row gt_left">Yala</td>
      <td class="gt_row gt_left">ยะลา</td>
    </tr>
  </tbody>
  
  
</table></div>

``` r
ref_tha %>% 
  filter(adm2_pcode == "TH1015") %>% 
  gt() %>%
  tab_options(table.font.size = px(14))
```

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#pwvdddxffa .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 14px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#pwvdddxffa .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pwvdddxffa .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pwvdddxffa .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pwvdddxffa .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pwvdddxffa .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pwvdddxffa .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#pwvdddxffa .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#pwvdddxffa .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pwvdddxffa .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pwvdddxffa .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#pwvdddxffa .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#pwvdddxffa .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#pwvdddxffa .gt_from_md > :first-child {
  margin-top: 0;
}

#pwvdddxffa .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pwvdddxffa .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#pwvdddxffa .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#pwvdddxffa .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pwvdddxffa .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#pwvdddxffa .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pwvdddxffa .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pwvdddxffa .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pwvdddxffa .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pwvdddxffa .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pwvdddxffa .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#pwvdddxffa .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pwvdddxffa .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#pwvdddxffa .gt_left {
  text-align: left;
}

#pwvdddxffa .gt_center {
  text-align: center;
}

#pwvdddxffa .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pwvdddxffa .gt_font_normal {
  font-weight: normal;
}

#pwvdddxffa .gt_font_bold {
  font-weight: bold;
}

#pwvdddxffa .gt_font_italic {
  font-style: italic;
}

#pwvdddxffa .gt_super {
  font-size: 65%;
}

#pwvdddxffa .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="pwvdddxffa" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm3_pcode</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm3_en</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm3_th</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm2_pcode</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm2_en</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm2_th</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm1_pcode</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm1_en</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">adm1_th</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">TH101503</td>
      <td class="gt_row gt_left">Bang Yi Ruea</td>
      <td class="gt_row gt_left">บางยี่เรือ</td>
      <td class="gt_row gt_left">TH1015</td>
      <td class="gt_row gt_left">Thon Buri</td>
      <td class="gt_row gt_left">ธนบุรี</td>
      <td class="gt_row gt_left">TH10</td>
      <td class="gt_row gt_left">Bangkok</td>
      <td class="gt_row gt_left">กรุงเทพมหานคร</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">TH101504</td>
      <td class="gt_row gt_left">Bukkhalo</td>
      <td class="gt_row gt_left">บุคคโล</td>
      <td class="gt_row gt_left">TH1015</td>
      <td class="gt_row gt_left">Thon Buri</td>
      <td class="gt_row gt_left">ธนบุรี</td>
      <td class="gt_row gt_left">TH10</td>
      <td class="gt_row gt_left">Bangkok</td>
      <td class="gt_row gt_left">กรุงเทพมหานคร</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">TH101506</td>
      <td class="gt_row gt_left">Dao Khanong</td>
      <td class="gt_row gt_left">ดาวคะนอง</td>
      <td class="gt_row gt_left">TH1015</td>
      <td class="gt_row gt_left">Thon Buri</td>
      <td class="gt_row gt_left">ธนบุรี</td>
      <td class="gt_row gt_left">TH10</td>
      <td class="gt_row gt_left">Bangkok</td>
      <td class="gt_row gt_left">กรุงเทพมหานคร</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">TH101502</td>
      <td class="gt_row gt_left">Hiranruchi</td>
      <td class="gt_row gt_left">หิรัญรูจี</td>
      <td class="gt_row gt_left">TH1015</td>
      <td class="gt_row gt_left">Thon Buri</td>
      <td class="gt_row gt_left">ธนบุรี</td>
      <td class="gt_row gt_left">TH10</td>
      <td class="gt_row gt_left">Bangkok</td>
      <td class="gt_row gt_left">กรุงเทพมหานคร</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">TH101507</td>
      <td class="gt_row gt_left">Samre</td>
      <td class="gt_row gt_left">สำเหร่</td>
      <td class="gt_row gt_left">TH1015</td>
      <td class="gt_row gt_left">Thon Buri</td>
      <td class="gt_row gt_left">ธนบุรี</td>
      <td class="gt_row gt_left">TH10</td>
      <td class="gt_row gt_left">Bangkok</td>
      <td class="gt_row gt_left">กรุงเทพมหานคร</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">TH101505</td>
      <td class="gt_row gt_left">Talat Phlu</td>
      <td class="gt_row gt_left">ตลาดพลู</td>
      <td class="gt_row gt_left">TH1015</td>
      <td class="gt_row gt_left">Thon Buri</td>
      <td class="gt_row gt_left">ธนบุรี</td>
      <td class="gt_row gt_left">TH10</td>
      <td class="gt_row gt_left">Bangkok</td>
      <td class="gt_row gt_left">กรุงเทพมหานคร</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">TH101501</td>
      <td class="gt_row gt_left">Wat Kanlaya</td>
      <td class="gt_row gt_left">วัดกัลยาณ์</td>
      <td class="gt_row gt_left">TH1015</td>
      <td class="gt_row gt_left">Thon Buri</td>
      <td class="gt_row gt_left">ธนบุรี</td>
      <td class="gt_row gt_left">TH10</td>
      <td class="gt_row gt_left">Bangkok</td>
      <td class="gt_row gt_left">กรุงเทพมหานคร</td>
    </tr>
  </tbody>
  
  
</table></div>

### 4. Join `sf` object with data and plot

``` r
tha1 %>%
  left_join(rice_2562, by = c("adm1_th" = "location")) %>%
  select(production, area_plant, yield_plant) %>%
  plot()
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />
