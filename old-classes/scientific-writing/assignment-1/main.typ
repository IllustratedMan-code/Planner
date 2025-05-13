#import "@local/assignments:1.0.0": conf
#show: doc => conf(title: "About Me", doublespaced: true, doc)

#set text(font: "Arial", size: 11pt)
#import "@preview/wordometer:0.1.2": word-count, total-words
#show: word-count.with(exclude: (quote))
#let total = [
  #set align(center)
  #box(stroke: black, inset: 5pt, radius: 5pt, [Word Count = #total-words])]

Transcription factors are proteins, little chemical machines that do the work to make life possible.
Genes are the blueprints for these machines, containing all the instructions necessary for their creation. In the same
way that a construction worker would be out of place in an emergency room, not all proteins are appropriate for every
situation. Transcription factors are the human resource managers in this metaphor; they control
the creation of proteins to ensure that the right thing happens at the right time.

Imagine an old clock on a wall. Each second, the pendulum swings, the clock ticks, and second hand moves. Inside the clock,
complex mechanisms are at play ensuring that the clock continues to swing the pendulum back and forth. One day, the clock falls
off of the wall and gears and springs come flying out in every direction. With no prior knowledge of a clock's inner workings, putting
the clock back together would be an almost impossible task. Yet, this is the objective of transcription factor research. The clock is a
cell, and the gears are transcription factors. One can measure the effect of the transcription factor by watching the cell tick.
Inspecting each transcription factor individually is also possible; however, measuring how all the transcription factors work together
at once is not currently possible.

There are many different types of cells in a human body and they owe these differences to transcription factors. One transcription factor that regulates
immune cells is called PU.1. This transcription factor is implicated in many diseases including leukemia. One way to determine how a transcription factor works is to
do an experiment called CHIP-Seq. This experiment shows how well a transcription factor binds to DNA. Unfortunately, one can only perform CHIP-Seq for one transcription
factor at a time.

To circumvent this limitation, researchers attempt to "guess" how other transcription factors interact with the transcription
factor of interest. "Guessing" these relationships requires prior knowledge of how transcription factors bind to DNA. Each transcription
factor prefers to bind to specific sequences of DNA. Researchers represent these preferences with a "motif" that shows the types of DNA sequences
a transcription factor will bind to. Transcription factor motifs often share certain sequences with each other. In the case of
PU.1, it appears some of the sequences that bind PU.1 are shared with another transcription factor, GATA-1, in eosinophils. Eosinophils are
a type of white blood cell. Other immune cells do not share this connection between PU.1 and GATA-1.

"Guessing" interactions by finding sequences shared within motifs doesn't seem very useful at first glance. Additional experiments can
be done to verify the "guess", but what is the point in finding these interactions? Diseases often disrupt these interactions
in a way that causes the complex machinery in one's cells to not function the way they are supposed to. Certain drugs
can target transcription factor interactions to reverse or prevent diseases. In this way, abstract research uncovering the
complex workings of cells can benefit people in tangible way.

#total

#quote()[
  I wasn't quite sure what voice to use so I didn't use 'I'.
  Typically in conversation I would talk about 'my research', but I tried not to do that here.
  Using my mom as a way to curate the audience was interesting.
  She does have a medical degree so I can assume some biological knowledge.
  I would likely break the terminology down further depending on the audience.

  Disclaimer, I did write half of this with a fever, so it might not be my best work.
]
