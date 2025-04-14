#let preprocesHeadings(doc) = {
  let headings = ()
  let index = -1
  for i in doc.children {
    if i.func() == heading and i.depth == 1 {
      index = index + 1
      headings.push(())
    }
    if index >= 0 {
      headings.at(index).push(i)
    }
  }
  return headings
}


#let funbox(title, content) = {
  table(
    stroke: gray,
    inset: 0.5em,
    columns: 1fr,
    fill: (x, y) => if x == 0 and y == 0 { rgb("c0da83") },

    align(left, title),
    content,
  )
}

#let headingsToBoxes(headings) = {
  for i in headings {
    let head = i.at(0)
    let body = i.slice(1, i.len())
    funbox(head, body.join())
  }
}


#let conf(title: none, base_text_size: 36pt, height: 24in, width: 36in, ncolumns: 4, doc) = {
  let img = image("Picture1.png", width: 100%)
  let cchmclogo = image("cchmc-logo.png", width: 100%)
  set text(font: "Arial", size: base_text_size)
  let headings = preprocesHeadings(doc)
  set page(
    height: height,
    width: width,
    header: pad(
      right: 3em,
      grid(
        column-gutter: 3em,
        columns: (4fr, 1fr),
        block(
          fill: rgb("a1cc3a"),
          width: 100%,
          height: 100%,
          align(horizon, pad(text(size: 1.5em, weight: "bold", title), left: 3em, bottom: 1em)),
        ),
        pad(bottom: 0em, cchmclogo),
      ),
    ),
  )
  columns(ncolumns, headingsToBoxes(headings))
}
#show: doc => conf(doc)

= heading whwa
hello there
= heading
