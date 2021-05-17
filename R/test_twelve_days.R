# library(dplyr)
# library(stringr)
# library(purrr)
# library(english)
# library(glue)
#
# pluralize_gift <- function(gift){
#
#   gift <-
#     case_when(
#       str_detect(gift, "[^aeiou]y$") ~ str_replace(gift, "y$", "ies"),
#       str_detect(gift, "s$|ss$|sh$|ch$|x$|z$|o$") ~ str_c(gift, "es"),
#       str_detect(gift, "f$|fe$") ~ str_replace(gift, "f$|fe$", "ves"),
#       str_detect(gift, "oose$") ~ str_replace(gift, "oose$", "eese"),
#       TRUE ~ str_c(gift, "s")
#     )
#
#   return(gift)
#
# }
#
# make_phrase <- function(num, num_word, item, verb, adjective, location){
#
#   if (num == 1) {
#     phrase <- str_c("and an", adjective, item, verb, location, sep = " ")
#   }
#   else {
#     phrase <- str_c(as.english(num), adjective, pluralize_gift(item), verb, location, sep = " ")
#   }
#   phrase <- gsub("\\s+", " ", str_trim(phrase))
#   return(phrase)
# }
#
#
#
# sing_day <- function(dataset, line, phrase_col){
#
#   phrases <- dataset %>% pull({{phrase_col}})
#   phrases_for_day <- rev(phrases[1:line])
#   cat(glue("On the {dataset[line, 2]} day of Christmas, my true love sent to me,"))
#   cat("\n")
#   if (line == 1)
#     phrases_for_day <- str_replace(phrases_for_day, "and ", "")
#   phrases_for_day %>% cat(sep = "\n")
#   cat("\n")
#
#   return()
# }
#
#
#
#
# xmas2 <- read.csv("https://www.dropbox.com/s/ap2hqssese1ki4j/xmas_2.csv?dl=1")
# xmas2[is.na(xmas2)] <- ""
# xmas2 <- xmas2 %>%
#   mutate(
#     Full.Phrase = pmap_chr(xmas2, ~make_phrase(..1, ..2, ..3, ..4, ..5, ..6))
#   )
# #sing_day(xmas2, 2, Full.Phrase)
# y <- xmas2$Day %>% map(function(x) sing_day(xmas2, x, Full.Phrase))
