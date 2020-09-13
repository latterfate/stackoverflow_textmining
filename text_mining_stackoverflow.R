library(tidyverse)

data <- read_csv("C:/Users/Allen/Desktop/MSiA/kaggle project/stackoverflow_textmining/data.csv")
sum(is.na(data))

data = data %>%
    mutate(title2 = tolower(Title),
           body2 = tolower(Body))

# clean contractions
fix.contractions <- function(doc) {
    # "won't" is a special case as it does not expand to "wo not"
    doc <- gsub("won't", "will not", doc)
    doc <- gsub("can't", "can not", doc)
    doc <- gsub("n't", " not", doc)
    doc <- gsub("'ll", " will", doc)
    doc <- gsub("'re", " are", doc)
    doc <- gsub("'ve", " have", doc)
    doc <- gsub("'m", " am", doc)
    doc <- gsub("'d", " would", doc)
    doc <- gsub("what's", "what is", doc)
    doc <- gsub("doesn't", "does not", doc)
    doc <- gsub("don't", "do not", doc)
    # 's could be 'is' or could be possessive: it has no expansion
    doc <- gsub("'s", "", doc)
    return(doc)
}

data$title2 <- sapply(data$title2, fix.contractions)
data$body2 <- sapply(data$body2, fix.contractions)
