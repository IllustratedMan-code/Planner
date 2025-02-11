#import "@preview/wordometer:0.1.2": word-count, total-words
#show: word-count
#let total = [
  #set align(center)
  #box(stroke: black, inset: 5pt, radius: 5pt, [Word Count = #total-words])]


#lorem(500) 

// type something here to see delay
The quick brown fox jumpst over the lazy dog
#total