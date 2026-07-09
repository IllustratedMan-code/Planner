#set page(
  width: auto,
  height: auto,
  margin: 1mm,
)
#set table(
    stroke: (x, y) => if y == 0 {
      (bottom: black)
    },
  )
#import "@local/assignments:1.0.0": csvtable
#let data = csv("summary_sheet.csv")
#csvtable(data)


