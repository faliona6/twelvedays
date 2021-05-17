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

