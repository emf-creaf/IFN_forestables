
# Check codes with missing names in forestable output ---------------------

check_missing_tree_codes <- function(x) {
  tree_codes_mis_all <- character()
  for(i in 1:nrow(x)) {
    if(nrow(x$tree[[i]])) {
      sp <- x$tree[[i]]$sp_name
      codes <- x$tree[[i]]$sp_code
      tree_codes_mis_all <- unique(c(tree_codes_mis_all,codes[is.na(sp)]))
    }
  }
  return(tree_codes_mis_all)
}
check_missing_shrub_codes <- function(x) {
  shrub_codes_mis_all <- character()
  for(i in 1:nrow(x)) {
    if(nrow(x$understory[[i]]$shrub[[1]])) {
      sp <- x$understory[[i]]$shrub[[1]]$sp_name
      codes <- x$understory[[i]]$shrub[[1]]$sp_code
      shrub_codes_mis_all <- unique(c(shrub_codes_mis_all,codes[is.na(sp)]))
    }
  }
  return(shrub_codes_mis_all)
}

check_missing_codes <- function(x) {
  tree_codes_mis_all <- character()
  for(i in 1:nrow(x)) {
    if(nrow(x$tree[[i]])) {
      sp <- x$tree[[i]]$sp_name
      codes <- x$tree[[i]]$sp_code
      tree_codes_mis_all <- unique(c(tree_codes_mis_all,codes[is.na(sp)]))
    }
  }
  print(tree_codes_mis_all)
  shrub_codes_mis_all <- character()
  for(i in 1:nrow(x)) {
    if(nrow(x$understory[[i]]$shrub[[1]])) {
      sp <- x$understory[[i]]$shrub[[1]]$sp_name
      codes <- x$understory[[i]]$shrub[[1]]$sp_code
      shrub_codes_mis_all <- unique(c(shrub_codes_mis_all,codes[is.na(sp)]))
    }
  }
  print(shrub_codes_mis_all)
}

provinces <- c("01","02","03","04", "05","06", "07", "08", "09",
               as.character(10:50))

tree_codes_mis_all <- character()
shrub_codes_mis_all <- character()
for(p in provinces) {
  file_out <- paste0("Products/IFN4/", p, ".rds")
  if(file.exists(file_out)) {
    x <- readRDS(file_out)  
    tree_codes_mis_all <- sort(unique(c(tree_codes_mis_all, check_missing_tree_codes(x))))
    shrub_codes_mis_all <- sort(unique(c(shrub_codes_mis_all, check_missing_shrub_codes(x))))
  }
}
