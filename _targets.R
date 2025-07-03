# Load packages required to define the pipeline:
library(targets)
library(tarchetypes)

# Set target options:
tar_option_set(
  packages = c("tibble"),
  controller = crew::crew_controller_local(workers = 5, seconds_idle = 60)
)

# Run the R scripts in the R/ folder with your custom functions:
tar_source("R/1_harmonizing_ifn_data.R")

values <- tidyr::expand_grid(
  ifn = c("IFN2", "IFN3"),#, "IFN4"),
  province = c("01","02","03","04", "05","06", "07", "08", "09", as.character(10:50))
)

# Replace the target list below with your own:
mapped <- tar_map(
  values = values,
  tar_target(sf_harm, 
             harmonize_ifn(ifn, province),
             format = "file")
)
list(mapped)
