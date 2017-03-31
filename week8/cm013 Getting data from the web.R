#---
# March 30, 2017
# cm013 Getting data from the web: API access
#---

library(rebird)
library(tidyverse)
ebirdhotspot(locID = "L1573785") %>% 
  as_tibble()
chibirds <- ebirdgeo(lat = 41.8781, lng = -87.6298)
frenchbirds <- ebirdregion("FR")
frenchbirds %>% as_tibble()
