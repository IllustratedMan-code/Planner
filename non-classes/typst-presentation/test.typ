
#show raw.where(block: true): it => {
  let style-number(number) = text(gray)[#number]
  let lang = none
  if it.lang != none {
    lang = [#upper(it.lang.first())#it.lang.slice(1)]
  }
  let codebox = block(
    outset: 0pt,
    stroke: black,
    radius: if lang != none {
      (
        top-left: 5pt,
        top-right: 0pt,
        bottom-right: 5pt,
        bottom-left: 5pt,
      )
    } else {
      5pt
    },

    inset: (x: 5pt, y: 5pt),
    grid(
      columns: 2,
      align: (right, left),
      gutter: 0.5em,
      ..it.lines.map(line => (style-number(line.number), line)).flatten()
    ),
  )
  let langbox = box(
    stroke: black,
    inset: 3pt,
    outset: 0pt,
    radius: (
      top-left: 5pt,
      top-right: 5pt,
      bottom-right: 0pt,
      bottom-left: 0pt,
    ),
    [
      #set text(8pt)
      #lang
    ],
  )
  set align(center)
  grid(
    columns: 1,
    align: (right),
    if lang != none {
      grid.header(langbox)
    },

    codebox,
  )
}

```python
hello
```
