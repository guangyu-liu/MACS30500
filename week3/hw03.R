#---
# March 22, 2017
# hw03
#---

library(tidyverse)
library(rcfss)

# Part 1: Tidying messy data
dadmom %>% 
  unite(col = "Dad", named, incd) %>% 
  unite(col = "Mom", namem, incm) %>% 
  gather(`Dad`, `Mom`, key = "Parents", value = name_income) %>% 
  separate(col = name_income, into = c("name", "income"), sep = "_") %>% 
  arrange(famid)

# Part 2: Joining data frames
HIV <- read_excel("HIV prevalence.xlsx")
# --- No Data >_< ---

# Part 3: Wrangling and exploring messy(ish) data
file1 <- read_csv("SCDB_2016_01_justiceCentered_Citation.csv")
file2 <- read_csv("SCDB_Legacy_03_justiceCentered_Citation.csv", 
                  col_types = cols(
                    docket = col_integer(), 
                    adminAction = col_integer(), 
                    adminActionState = col_integer()))
new_file <- bind_rows(file2, file1) %>% 
  select(caseIssuesId, term, justice, justiceName, decisionDirection, majVotes, 
         minVotes, majority, chief)

# 1. Percentage of cases in each term are decided by a one-vote margin
new_file %>% 
  group_by(term) %>% 
  mutate(diff = abs(majVotes - minVotes)) %>% 
  count(diff) %>% 
  mutate(percentage = paste0(round(100*n/sum(n), 2), "%")) %>% 
  filter(diff == 1) %>% 
  select(term, percentage)

# 2. Percentage of cases that Justice Antonin Scalia was in the majority
new_file %>% 
  filter(justiceName == "AScalia") %>% 
  group_by(term) %>% 
  count(majority) %>% 
  mutate (percentage = paste0(round(n*100/sum(n), 2), "%")) %>% 
  filter(majority == 2) %>% 
  select(term, percentage)

# 3. Compares the percentage for all cases versus non-unanimous cases
new_file %>% 
  filter(justiceName == "AScalia") %>% 
  group_by(term) %>% 
  mutate(non_unanimous = (minVotes > 0)) 
#--- to be continue...---

# 4. In each term, what percentage of cases were decided in the conservative direction
new_file %>% 
  group_by(term) %>% 
  count(decisionDirection) %>% 
  mutate(percentage = paste0(round(n*100/sum(n), 2), "%")) %>% 
  filter(decisionDirection == 1) %>% 
  select(term, percentage)

