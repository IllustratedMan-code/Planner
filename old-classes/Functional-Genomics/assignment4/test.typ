
#import "@local/assignments:1.0.0": conf
#import "@preview/neoplot:0.0.2" as gp
#import "@preview/drafting:0.2.0": *
#import "@preview/colorful-boxes:1.3.1": *
#show: doc => conf(title: "This is a title", doc)
hellle
ds
#set-page-properties()
#lorem(30)
#quote(attribution: "david")[#lorem(50)]
#stickybox(rotation: 5deg, width: 10cm)[#quote()[#lorem(50)]]
#lorem(100)
#margin-note("I'm not very cool", [lol])
#lorem(100)
