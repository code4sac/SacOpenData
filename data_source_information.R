# App Title ----
# Set the title for the app, displayed in top left corner
title = "Sacramento Open Data"

# GitHub Link ----
# Provide the link to the GitHub repo for the app
github_link = "https://github.com/mvanbommel/SacOpenData"

# Map Bounds ----
# Set the bounds for points that will be displayed on the map
# To show all points, regardless of location, use values:
#  - latitude_bounds = c(-90, 90)
#  - longitude_bounds = c(-180, 180)
latitude_bounds = c(37, 42)
longitude_bounds = c(-125, -118)

# Map Defaults ----
# Set the default latitude, longitude, and zoom values for the map
# Larger zoom values zoom in the map more
map_center_latitude = 38.55
map_center_longitude = -121.5
map_zoom = 11

# Dataset List ----
# Define the datasets available in the app. Each list entry should include:
# - name: name of the dataset, displayed in the Select Dataset dropdown
# - api: link to the API for the ArcGIS REST feature server layer of the dataset
# - url: link to an information page for the dataset, linked in data_source_button
dataset_list = list(
  list(name = "City Maintained Trees",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/City_Maintained_Trees/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/b9b716e09b5048179ab648bb4518452b_0"),
  list(name = "Dispatch Data From Current Year",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/cad_calls_year3/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/9efe7653009b448f8d177c1da0cc068f_0"),
  list(name = "Dispatch Data From One Year Ago",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/cad_calls_year2/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/396e0bc72dcd4b038206f4a7239792bb_0"),
  list(name = "Dispatch Data From Two Years Ago",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/cad_calls_year1/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/1692315bba964832b235a76755928c06_0"),
  list(name = "Dispatch Data 2017",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/CAD_2017/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/d6c26871b5ca46dca132c7707d9e80e8_0"),
  list(name = "Dispatch Data 2016",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/Sacramento_Dispatch_Data_2016/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/4bdb47c80f844d779795f62b35b83984_0"),
  list(name = "Dispatch Data 2015",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/Sacramento_Dispatch_Data_2015/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/44ed3f7800c7479a910332b4b7795290_0"),
  list(name = "Dispatch Data 2014",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/CAD_2014/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/e5f7cee6406941ed97e8a3109a301431_0"),
  list(name = "EV Chargers",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/EV_Chargers/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/93efdbcdbc744210848dd7f601e622e3_0"),
  list(name = "Fire Department 911 Call Response",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/GetNFIRSRespondReport/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/0b32edde7b14480e82d0d746108431db_0"),
  list(name = "Fire Stations",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/Fire_Stations/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/614bdde2a4714b2098d4c2532fd2c6e7_0"),
  list(name = "GPS Static Survey",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/GPS_StaticSurvey/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/5a5fb0a127ff44ad98f8a48640e9529c_0"),
  list(name = "Hospitals",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/Hospitals/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/0363364d7ddb4ff4aadd7057187a7a05_0"),
  list(name = "On Street Parking",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/ONSTREETPARKING/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/0060469c57864becb76a036d23236143_0"),
  list(name = "Park Amenities",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/Public_Park_Amenities/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/f0773d98f269411f8c19de132596ac3d_0"),
  list(name = "Parks Public Restrooms",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/Parks_Public_Restrooms/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/b9e7fa6d1d104833b3f04268d7f682dc_0"),
  list(name = "Schools",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/Schools/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/fd3677bd8ff44a2cbe6b8cc67a3d2c1c_0"),
  list(name = "Signs",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/Signs/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/669f377150b74ae4863b5eefbdde39b7_0"),
  list(name = "Street Lights",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/Street_Lights/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/3dca1faa7e0a40f79f31f95c0b2ebd17_0"),
  list(name = "Streetcar Stops (Proposed)",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/Streetcar_Stops/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/5922bb984d8748d1a457164d4416dced_0"),
  list(name = "Survey Benchmarks",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/SurveyBenchmarks/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/53244a1d3ca447d8a890ad6bbc43621b_0"),
  list(name = "Traffic Signals",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/City_of_Sacramento_Traffic_Signals/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/ad6ad4ec348e4302b2432ba9078ac1fd_0"),
  list(name = "311 Calls",
       api = "https://services5.arcgis.com/54falWtcpty3V47Z/arcgis/rest/services/311Calls_OSC_View/FeatureServer/0",
       url = "http://data.cityofsacramento.org/datasets/08794a6695b3483f889e9bef122517e9_0")
)