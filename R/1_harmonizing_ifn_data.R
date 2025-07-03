# Harmonizes IFN data using package forestables
harmonize_ifn<-function(ifn, province) {
  cli::cli_h1(paste("Harmonizing ", ifn, " - Province:", province))
  file_out <- paste0("data/",ifn,"/",ifn,"_", province, ".rds")
  try({
    sf_prov <- forestables::ifn_to_tibble(province, versions = tolower(ifn), folder="data-raw/")
    saveRDS(sf_prov, file = file_out)
  })
  return(file_out)
}
