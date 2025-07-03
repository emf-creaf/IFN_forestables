
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

checkmissing_codes_ifn <- function(sf_harm) {
  x <- readRDS(sf_harm)  
  tree_codes_mis_all <- sort(check_missing_tree_codes(x))
  shrub_codes_mis_all <- sort(check_missing_shrub_codes(x))
  return(list(tree_codes = tree_codes_mis_all, shrub_codes = shrub_codes_mis_all))
}
