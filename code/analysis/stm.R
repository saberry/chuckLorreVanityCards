#####################
### Text Analysis ###
#####################

load("data/chuckLorreText.RData")

library(stm)

### Text Processing ###

# We will use textProcessor with additional stopwords coming from the SMART
# list in tm. We are also going to strip any remaining html out.

customWords = tm::stopwords(kind ="SMART")

processedText = textProcessor(documents = vanityText$text, 
                              metadata = vanityText, customstopwords = customWords,
                              striphtml = TRUE)

preppedDoc = prepDocuments(processedText$documents, processedText$vocab, 
                           processedText$meta)

docs = preppedDoc$documents

vocab = preppedDoc$vocab

meta = preppedDoc$meta

kMods = searchK(docs, vocab, K = c(2, 5, 10, 15, 20))

plot(kMods)


stmMod = stm(docs, vocab, K = 15)
