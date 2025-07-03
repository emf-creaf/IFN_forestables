
# IFN harmonization using package forestables

## What the workflow does?

+ Downloads IFN data from Spanish Ministry.
+ Harmonizes IFN data using package **forestables**
+ Checks for missing species codes in tree/shrub data

## Data dependencies

No data dependencies

## EMF R packages dependencies

|  R package  |   Functionality  |
|-------------|------------------|
| **forestables** | Routines for download and harmonization |

## Outputs

+ `sf` objects using **forestables** format for each province and forest inventory edition (IFN2, IFN3, IFN4).
