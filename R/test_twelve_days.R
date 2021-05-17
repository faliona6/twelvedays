
#' # Testing
#'
#' xmas <- read.csv("https://www.dropbox.com/s/e584pryn8evm1gz/xmas.csv?dl=1")
#' pluralize_gift("geese")
#' make_phrase(num = 1,
#'             num_word = "one",
#'             item = "lords",
#'             verb = "a-leaping",
#'             adjective = "",
#'             location = "in a pear tree")
#' map_chr(xmas$Gift.Item, pluralize_gift)
#'
#' # replace NA's with ""
#' xmas[is.na(xmas)] <- ""
#' xmas <- xmas %>%
#'           mutate(
#'             Full.Phrase = pmap_chr(xmas, ~make_phrase(..1, ..2, ..3, ..4, ..5, ..6))
#'           )
#'
#' sing_day(xmas, 3, Full.Phrase)
#' print(Y)
