# To ensure all necessary packages are installed, run:
# source("install_package.R")
# install_packages()

`%>%` = dplyr::`%>%`

# DATA ----
# * Load Source Information ----
source("data_source_information.R")

# Combine dataset list
dataset_df = dplyr::bind_rows(lapply(dataset_list, data.frame, stringsAsFactors = FALSE))

dataset_picker_vector = dataset_df$api
names(dataset_picker_vector) = dataset_df$name

# Initialize data_information for load (will update with observeEvent)
data_information = NULL

range_variable_types = c("smallinteger", "integer", "single", "double", "oid", "date")

# FUNCTIONS ----
# * Utility ----
epoch_to_calendar_date = function(epoch) {
  as.Date(as.POSIXct(epoch / 1000, 
                     origin = '1970-01-01',
                     tz = 'America/Los_Angeles'),
          format = '%y-%m-%d')
}

geom_to_longitude_latitude = function(data) {
  if (!is.null(data)) {
    if ("geoms" %in% colnames(data)) {
      coordinates = do.call(rbind, sf::st_geometry(data$geoms)) %>% 
        as.data.frame(row.names = as.character(1:nrow(data))) %>% 
        setNames(c("longitude", "latitude"))
     
      # Values outside of bounds to NA
      coordinates$longitude[coordinates$longitude < longitude_bounds[1]] = NA
      coordinates$longitude[coordinates$longitude > longitude_bounds[2]] = NA
      coordinates$latitude[coordinates$latitude < latitude_bounds[1]] = NA
      coordinates$latitude[coordinates$latitude > latitude_bounds[2]] = NA
      
      data = cbind(data, coordinates) %>%
        dplyr::select(-geoms)
    }
  }
  
  data
  
}

# * Data ----
get_data_information = function(url) {
  json = tryCatch(jsonlite::fromJSON(txt = paste0(url, "/?f=pjson")),
                  error = function(err) {
                    NULL
                  })
  
  if (!is.null(json)) {
    information = list(name = json$name, 
                       max_record_count = json$maxRecordCount,
                       columns = json$fields)
  } else {
    information = NULL
  }
  
  return(information)
}

get_observation_count = function(url, where = "1=1") {
  count = tryCatch(R.utils::withTimeout(jsonlite::fromJSON(txt = paste0(url, "/query?where=", where, "&outFields=*&returnCountOnly=true&outSR=4326&f=json"))$count,
                                        timeout = 5,
                                        onTimeout = 'error'),
                   error = function(err) {
                     NULL
                   })
  
  return(count)
}

# * Filter ----
get_variable_type = function(variable_name, column_information) {
  variable_type = column_information %>%
    dplyr::filter(variable_name == name) %>%
    dplyr::mutate(type = tolower(stringr::str_replace(string = type, pattern = "esriFieldType", replacement = ""))) %>%
    dplyr::pull(type)
  
  return(variable_type)
}

get_filter_values = function(url, variable, variable_type) {
  if (variable_type %in% range_variable_types) {
    min_value = jsonlite::fromJSON(paste0(url, "/query?where=", variable, "%20IS%20NOT%20NULL&outFields=", variable, "&orderByFields=", variable, "&returnGeometry=false&resultRecordCount=1&outSR=4326&f=json"))$features$attributes[, 1]
    max_value = jsonlite::fromJSON(paste0(url, "/query?where=", variable, "%20IS%20NOT%20NULL&outFields=", variable, "&orderByFields=", variable, "%20DESC&returnGeometry=false&resultRecordCount=1&outSR=4326&f=json"))$features$attributes[, 1]
    
    if (variable_type == "date") {
      min_value = epoch_to_calendar_date(epoch = min_value)
      max_value = epoch_to_calendar_date(epoch = max_value)
    }
    
    values = c(min_value, max_value)
  } else {
    values = sort(jsonlite::fromJSON(paste0(url, "/query?where=1=1&outFields=", variable, "&returnGeometry=false&returnDistinctValues=true&outSR=4326&f=json"))$features$attributes[, 1])
  }
  
  return(values)
}

create_filter_input = function(filter_index, filters, url, column_information) {
  
  variable_type = get_variable_type(variable_name = filters[filter_index],
                                    column_information = column_information)
  
  filter_input_id = paste0("filter_", filter_index)
  filter_label = shiny::h4(filters[filter_index])
  filter_values = get_filter_values(url = url, variable = filters[filter_index], variable_type = variable_type)
  
  if (variable_type == "integer") {
    input = shinyWidgets::numericRangeInput(inputId = filter_input_id,
                                            label = filter_label,
                                            value = c(filter_values[1], filter_values[2]))
  } else if (variable_type == "date") { 
    input = shiny::dateRangeInput(inputId = filter_input_id, 
                                  label = filter_label,
                                  start = filter_values[1],
                                  end = filter_values[2],
                                  min = filter_values[1],
                                  max = filter_values[2])
  } else {
    input = shinyWidgets::pickerInput(inputId = filter_input_id,
                                      label = filter_label, 
                                      choices = filter_values,
                                      options = list(`none-selected-text` = "Select Filtering Values",
                                                     `selected-text-format` = "count > 1",
                                                     `actions-box` = TRUE,
                                                     `live-search` = TRUE), 
                                      multiple = TRUE)
  }
  
  return(input)
}