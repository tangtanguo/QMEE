# QMEE Assignment 2 - Reading in RDS File

library(irr)
library(dplyr)
library(tidyr)

## JD: Make sure your code runs from beginning to end in a new session.
## This won't because a library call is needed for %>%
## You didn't fix this, so I added dplyr above; probably better to just use the base pipe and take %>% out, though

## JD: Also need to add tidyr – make sure _each_ script runs in a new session. Your script can depend on the data file that it's reading explicitly, but shouldn't depend on other scripts

## JD: Better not to push the .rds file: it doesn't need to be under revision control, and often good to confirm that others can make it and use it.
MomPupBehav <- readRDS(file = "QMEE_MomPupInteractionBehav_Dataset.rds")

# Computing ICC scores between two raters: Easton and Emily
      # Easton and Emily scored the same videos, Ella scored different videos.
      # I will calculate ICC scores between Easton and Emily to see how similar
      # their scores are.

## JD What does this mean?:
# LET GO = 0.999

## JD: Prefer the base pipe (|>) instead of %>%
letgo <- MomPupBehav %>%
  filter(Behavior == "LET GO") %>%
  group_by(`Observation id`, Rater) %>%
  summarise(Time = mean(`Start (s)`, na.rm = TRUE), .groups = "drop") %>%
  pivot_wider(names_from = Rater, values_from = Time)

icc(letgo[, c("Easton", "Emily")],
    model = "twoway", type = "consistency", unit = "average")


# FIRST ATTACHMENT = 0.932
firstattachment <- MomPupBehav %>%
  filter(Behavior == "FIRST ATTACHMENT") %>%
  group_by(`Observation id`, Rater) %>%
  summarise(Time = mean(`Start (s)`, na.rm = TRUE), .groups = "drop") %>%
  pivot_wider(names_from = Rater, values_from = Time)

icc(firstattachment[, c("Easton", "Emily")],
    model = "twoway", type = "consistency", unit = "average")


# MOM/PUP INITIATION = = 0.822
initiation <- MomPupBehav %>%
  filter(Behavior %in% c("MOM INITIATION", "PUP INITIATION")) %>%
  mutate(Choice = ifelse(Behavior == "MOM INITIATION", 1, 0)) %>%  # 1 = mom, 0 = pup
  group_by(`Observation id`, Rater) %>%
  summarise(Choice = max(Choice), .groups = "drop") %>% 
  pivot_wider(names_from = Rater, values_from = Choice)

icc(initiation[, c("Easton", "Emily")],
    model = "twoway", type = "agreement", unit = "single")


# MOM ACCEPTANCE/RESISTANCE = 0.719
accept_resist <- MomPupBehav %>%
  filter(Behavior %in% c("ACCEPTANCE", "RESISTANCE")) %>%
  mutate(Choice = ifelse(Behavior == "ACCEPTANCE", 1, 0)) %>% # 1 = acceptance, 0 = resistance
  group_by(`Observation id`, Rater) %>%
  summarise(Choice = max(Choice), .groups = "drop") %>% 
  pivot_wider(names_from = Rater, values_from = Choice)

icc(accept_resist[, c("Easton", "Emily")],
    model = "twoway", type = "agreement", unit = "average")


# UNSUCCESSFUL ATTACHMENT (frequency) = 0.834
unsuccessful_attachment_freq <- MomPupBehav %>%
  filter(Behavior == "UNSUCCESSFUL ATTACHMENT") %>%
  group_by(`Observation id`, Rater) %>%
  summarise(Frequency = n(), .groups = "drop") %>%
  pivot_wider(names_from = Rater, values_from = Frequency, values_fill = 0)

icc(unsuccessful_attachment_freq[, c("Easton", "Emily")],
    model = "twoway", type = "consistency", unit = "average")


# SUCCESSFUL ATTACHMENT (frequency) = 0.899
successful_attachment_freq <- MomPupBehav %>%
  filter(Behavior == "SUCCESSFUL ATTACHMENT") %>%
  group_by(`Observation id`, Rater) %>%
  summarise(Frequency = n(), .groups = "drop") %>%
  pivot_wider(names_from = Rater, values_from = Frequency, values_fill = 0)

icc(successful_attachment_freq[, c("Easton", "Emily")],
    model = "twoway", type = "consistency", unit = "average")


# SUCCESSFUL ATTACHMENT (duration) = 0.914
successful_attachment_duration <- MomPupBehav %>%
  filter(Behavior == "SUCCESSFUL ATTACHMENT") %>%
  group_by(`Observation id`, Rater) %>%
  summarise(MeanDuration = mean(`Duration (s)`, na.rm = TRUE), .groups = "drop") %>%
  pivot_wider(names_from = Rater, values_from = MeanDuration)

icc(successful_attachment_duration[, c("Easton", "Emily")],
    model = "twoway", type = "consistency", unit = "average")


# GUIDANCE (duration) = 0.839
guidance_duration <- MomPupBehav %>%
  filter(Behavior == "GUIDANCE") %>%
  group_by(`Observation id`, Rater) %>%
  summarise(MeanDuration = mean(`Duration (s)`, na.rm = TRUE), .groups = "drop") %>%
  pivot_wider(names_from = Rater, values_from = MeanDuration)

icc(guidance_duration[, c("Easton", "Emily")],
    model = "twoway", type = "consistency", unit = "average")


# GUIDANCE (frequency) = 0.852
guidance_frequency <- MomPupBehav %>%
  filter(Behavior == "GUIDANCE") %>%
  group_by(`Observation id`, Rater) %>%
  summarise(Frequency = n(), .groups = "drop") %>%
  pivot_wider(names_from = Rater, values_from = Frequency, values_fill = 0)

icc(guidance_frequency[, c("Easton", "Emily")],
    model = "twoway", type = "consistency", unit = "average")


# SIBLING COOPERATION (duration) = 0.697
cooperation_duration <- MomPupBehav %>%
  filter(Behavior == "SIBLING COOPERATION") %>%
  group_by(`Observation id`, Rater) %>%
  summarise(MeanDuration = mean(`Duration (s)`, na.rm = TRUE), .groups = "drop") %>%
  pivot_wider(names_from = Rater, values_from = MeanDuration)

icc(cooperation_duration[, c("Easton", "Emily")],
    model = "twoway", type = "consistency", unit = "average")


# SIBLING COOPERATION  (frequency) = 0.675
cooperation_frequency <- MomPupBehav %>%
  filter(Behavior == "SIBLING COOPERATION") %>%
  group_by(`Observation id`, Rater) %>%
  summarise(Frequency = n(), .groups = "drop") %>%
  pivot_wider(names_from = Rater, values_from = Frequency, values_fill = 0)

icc(cooperation_frequency[, c("Easton", "Emily")],
    model = "twoway", type = "consistency", unit = "average")


# SIBLING INTERFERENCE (duration) = 0.76
interference_duration <- MomPupBehav %>%
  filter(Behavior == "SIBLING INTERFERENCE") %>%
  group_by(`Observation id`, Rater) %>%
  summarise(MeanDuration = mean(`Duration (s)`, na.rm = TRUE), .groups = "drop") %>%
  pivot_wider(names_from = Rater, values_from = MeanDuration)

icc(interference_duration[, c("Easton", "Emily")],
    model = "twoway", type = "consistency", unit = "average")


# SIBLING INTERFERENCE  (frequency) = 0.627
interference_frequency <- MomPupBehav %>%
  filter(Behavior == "SIBLING INTERFERENCE") %>%
  group_by(`Observation id`, Rater) %>%
  summarise(Frequency = n(), .groups = "drop") %>%
  pivot_wider(names_from = Rater, values_from = Frequency, values_fill = 0)

icc(interference_frequency[, c("Easton", "Emily")],
    model = "twoway", type = "consistency", unit = "average")


# This is definitely not FRY --> DRY its only FRY, but I just figured
# out how to do ICC scores and I still need to figure out how my df should change
# depending on if I'm looking at frequency, duration or binary variables.
# THEN, I will figure out how to simplify this code. 

## JD: Sounds very sensible. Grade 2.1/3
