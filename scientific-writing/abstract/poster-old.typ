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
#let conf(title: none, base_text_size: 36pt, height: 24in, width: 36in, _columns: 4, doc) = {
  let img = image("Picture1.png", width: 100%)
  let cchmclogo = image("cchmc-logo.png", width: 100%)
  set text(font: "Arial", size: base_text_size)
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

    footer: align(bottom)[#img],
    margin: (top: 8em, left: 0pt, right: 0pt, bottom: 3em),
  )
  //pad(left: 3em, doc)
  let headings = ()
  for elem in doc.children {
    if elem == linebreak() or elem == parbreak() or elem == [ ] {
      continue
    }
    let heading-elem = (:)
    if repr(elem).starts-with("heading(depth: 1") {
      if headings.len() > 0 {
        if headings.last().elems.len() == 0 {
          headings.last().elems.push(parbreak())
        }
      }
      heading-elem.insert("heading", elem)
      heading-elem.insert("elems", ())
      headings.push(heading-elem)
    } else {
      if headings.len() == 0 {
        heading-elem.insert("heading", none)
        //heading-elem.insert("elems", ())
        headings.push(heading-elem)
      }

      // add the element to the last heading
      headings.last().elems.push(elem)
    }
  }
  show "(": " ("
  pad(
    left: 3em,
    right: 3em,
    columns(
      gutter: 1em,
      4,
      headings.map(it => funbox(it.heading, it.elems.join(""))).join(),
    ),
  )
}
