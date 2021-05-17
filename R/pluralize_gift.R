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
