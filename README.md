
# IFN harmonization using package forestables

## What the workflow does?

+ Downloads IFN data from Spanish Ministry (MAGRAMA).
+ Harmonizes IFN data using package **forestables**
+ Checks for missing species codes in tree/shrub data

## Where it can be run?
+ The workflow has been developed for Miquel's **laptop**, but can be run at **EMF server** without modification


## Data dependencies

No data dependencies but download should be done using `O_obtaining_ifn_data.R` (not in targets)

## EMF R packages dependencies

|  R package  |   Functionality provided  |
|-------------|------------------|
| **forestables** | Routines for download and harmonization (main branch produces problems with IFN2 province 42)|

## Outputs

+ `sf` objects using **forestables** format for each province and forest inventory edition (IFN2, IFN3, IFN4).
