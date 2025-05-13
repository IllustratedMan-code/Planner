#import "./biosketch-template.typ": conf

#import "@preview/drafting:0.2.1": margin-note, set-page-properties

#let placenote(message, qry, dx: 0em, dy: 0em) = {
  context {
    let Edu = query(qry)
    let pos = Edu.at(0).location().position()
    place([#margin-note(message)], dx: -here().position().x + pos.x + dx, dy: -here().position().y + pos.y + dy)
    //place(Edu.at(0).location(), margin-note([So I don't put the PhD here?]))
  }
}

#set page(
  height: 100pt,
  margin: 20pt,
  footer: context [
    #set align(right)
    #set text(8pt)
    #counter(page).display(
      "1 of 1",
      both: true,
    ) <pagenumber>
  ],
)

#show: doc => conf(
  PersonalStatement: [
    #placenote([So I don't put my PhD here?], <edu>, dy: 1em)
    At the start of my graduate career as a Biomedical informatics PhD student, I rotated with Matthew Weirauch's Transcription factor research lab as well as Krishna Roskin's Immunology Research lab.
    - Any Publications I happen to be an author on

    In my undergraduate career I spent the equivalent of a year in Matthew Weirauch's Transcription Factor Research lab.#margin-note([Is this worth mentioning if I didn't get any publications out of it?])


    Also in my undergraduate career, I spent time in Joshua Benoit's insect physiology lab, where I performed bulk RNA-seq analysis and circadian rhythm analysis of ticks.
    - Publications #margin-note([Need to go and find all of these (I think there are 4?)])

  ],
  ContributionsToScience: [
    #set enum(indent: 2em)
    1. *RNA-seq analysis* - In my work with Joshua Benoit, I performed novel RNA-seq analysis on ticks to acertain gene expression during pesticide exposure.

      a. Citation TBD

    2.
  ],
  doc,
)


#placenote([Do I need page numbers? Where should I put them?], <pagenumber>, dx: 39em, dy: -2em)
