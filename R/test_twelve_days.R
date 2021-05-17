library(dplyr)
library(purrr)
library(tibble)
library(stringr)
library(english)
library(glue)
library(usethis)

#' Takes a noun and makes it plural
#'
#' @param gift A string or vector of strings
#'
#' @return A string or vector of strings with the pluralized words
#'
#' @import stringr
#' @import dplyr
#' @import glue
#' @import purrr
#'
#' @export
pluralize_gift <- function(gift){

  gift <-
    case_when(
      str_detect(gift, "[^aeiou]y$") ~ str_replace(gift, "y$", "ies"),
      str_detect(gift, "s$|ss$|sh$|ch$|x$|z$|o$") ~ str_c(gift, "es"),
      str_detect(gift, "f$|fe$") ~ str_replace(gift, "f$|fe$", "ves"),
      str_detect(gift, "oose$") ~ str_replace(gift, "oose$", "eese"),
      TRUE ~ str_c(gift, "s")
    )

  return(gift)

}

#' Puts the various parts of speech together into a full phrase.
#'
#' @param num An integer
#' @param num_word A string corresponding to the integer
#' @param item A string
#' @param verb A string
#' @param adjective A string
#' @param location A string
#'
#' @return A string containing the words in grammatical order.
#'
#' @import stringr
#' @import glue
#' @import dplyr
#' @import purrr
#' @import english
#'
#' @export



make_phrase <- function(num, num_word, item, verb, adjective, location){

  if (num == 1) {
    phrase <- str_c("and a", adjective, item, verb, location, sep = " ")
  }
  else {
    phrase <- str_c(as.english(num), adjective, pluralize_gift(item), verb, location, sep = " ")
  }
  phrase <- gsub("\\s+", " ", str_trim(phrase))
  return(phrase)
}


#' Produces the string for one day of the song.
#'
#' @param dataset A data frame containing information about gifts
#' @param line The number of the line for the day you want to sing about
#' @param phrase_col The variable name for the column in the dataset that
#' contains the gift phrases
#'
#' @return A string singing the line of the song with all gifts for the given day.
#'
#' @import stringr
#' @import dplyr
#' @import glue
#' @import purrr
#'
#' @export
sing_day <- function(dataset, line, phrase_col){
  phrases <- dataset %>% pull({{phrase_col}})
  phrases_for_day <- rev(phrases[1:line])
  print(glue("On the {dataset[line, 2]} day of Christmas, my true love sent to me,"))
  phrases_for_day %>% cat(sep = "\n")
  print("")

  return("result")
}

# Testing

xmas <- read.csv("https://www.dropbox.com/s/e584pryn8evm1gz/xmas.csv?dl=1")
pluralize_gift("geese")
make_phrase(num = 1,
            num_word = "one",
            item = "lords",
            verb = "a-leaping",
            adjective = "",
            location = "in a pear tree")
map_chr(xmas$Gift.Item, pluralize_gift)

# replace NA's with ""
xmas[is.na(xmas)] <- ""
xmas <- xmas %>%
          mutate(
            Full.Phrase = pmap_chr(xmas, ~make_phrase(..1, ..2, ..3, ..4, ..5, ..6))
          )

sing_day(xmas, 3, Full.Phrase)
print(Y)
