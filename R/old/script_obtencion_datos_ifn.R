#preparacion datos calibracion IFN2 e IFN3
library(curl)
library(readr)
library(furrr)
library(future)
library(forestables)
library(RCurl)


plan(multisession, workers = 2)

# Definir la función para crear filtros específicos para cada provincia
create_provincia_filter <- function(provincia) {
  filter_list <- forestables::show_plots_from(
    inventory = c("IFN"),
    #folder IFN_DB de filezilla
    folder = "C:/international_inventories_emf/data/Products/IFN_db",
    provinces = provincia,
    versions = c("ifn2", "ifn3")
  )
  forestables::create_filter_list(filter_list)
}

# Función para procesar y subir archivos para una provincia
process_province <- function(provincia) {
  
  # Crear el filtro específico para la provincia
  ifn_list <- create_provincia_filter(provincia)
  
  # Generar los datos para la provincia actual
  ifn_data <- forestables::ifn_to_tibble(
    provinces = provincia,
    versions = c("ifn2", "ifn3"),
    filter_list = ifn_list,
    folder = "C:/international_inventories_emf/data/Products/IFN_db",
    clean_empty = NULL,
    as_sf = FALSE,
    .parallel_options = furrr::furrr_options(scheduling = 1L, stdout = TRUE),
    .verbose = TRUE
  )
  
  # Nombre del archivo local para guardar los datos de la provincia
  local_file <- paste0("ifn_data/ifn_data_", provincia, ".RData")
  
  # Guardar los datos en un archivo .RData
  save(ifn_data, file = local_file)
  
  
  # Mensaje de verificación
  cat("Archivo subido a:", local_file, "\n")
  
  
  return(local_file)  
}

# Lista de provincias que deseas procesar
# 
provincias <- c( "27", "32", "36", "33", "39", "01", "20", "48", "31", "26", "22", "44", "50",
                 "28", "05", "09", "24", "34", "37", "40", "42", "47", "49", "02", "13", "16", "19",
                 "45", "06", "10", "08", "17", "25", "43", "03", "12", "46", "07", "04", "11", "14",
                 "18", "21", "23", "29", "41", "30", "35", "38", "51", "52", "15"
)


# Procesar provincias en paralelo
results <- future_map(provincias, process_province)





path <- "ifn_data" 

# Obtener la lista de archivos .RData
files <- list.files(path, pattern = "*.RData", full.names = TRUE)

# Inicializar una lista vacía para almacenar los datos cargados
data_list <- list()

# Iterar sobre los archivos y cargarlos en la lista
for (file in files) {
  load(file)
  data_list <- append(data_list, list(ifn_data))
}

# Combinar todos los objetos ifn_data en uno solo
ifn_data_ALL <- do.call(rbind, data_list)