#####################
# Wordcloud Goofery #
#####################

library(wordcloud); library(tm)

load("data/chuckLorreText.RData")

textCorp = VCorpus(VectorSource(vanityText$text))

cleanText = tm_map(textCorp, content_transformer(tolower))

# cleanText = tm_map(cleanText, stemDocument)

cleanText = tm_map(cleanText, removeWords, stopwords('english'))

cleanText = tm_map(cleanText, removePunctuation)

cleanText = tm_map(cleanText, removeNumbers)

pal = RColorBrewer::brewer.pal(7, "YlOrRd")

wordcloud(cleanText, min.freq = 20, max.words = 75, color = pal)
