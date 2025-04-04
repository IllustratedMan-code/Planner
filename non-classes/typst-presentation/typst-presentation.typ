#set document(title: [Typesetting with Typst], author: ("David Lewis",))
#import "@preview/colorful-boxes:1.4.2": stickybox
#import "@local/assignments:1.0.0": code
#import "@preview/touying:0.5.5": *
#import "@preview/metalogo:1.2.0": TeX, LaTeX
#import themes.simple: *
#show: simple-theme.with(aspect-ratio: "16-9")
#show: code

= #context document.title
#context document.author.at(0)

#pagebreak()


#outline(title: none)


== What is Typesetting?
#grid(
  columns: 2,
  column-gutter: 60pt,
  [
    - A way to arrange text and images
    - Often used to mean the conversion of code-like text to printable formats e.g. #LaTeX
  ],
  [
    #stickybox(
      rotation: -5deg,
      width: 14cm,
      quote(attribution: "wikipedia")[
        Typesetting is the composition of text for publication, display, or distribution by means of arranging physical type in mechanical systems or glyphs in digital systems representing characters. Stored types are retrieved and ordered according to a language's orthography for visual display.
      ],
    )],
)
== Why Typst

- Consistent and easy formatting
- It isn't Word#super[TM]
- Open Source
- Easy To Learn

== Why not #LaTeX?

#alternatives[
  #align(
    (center + top),
    grid(
      columns: 2,
      column-gutter: 30pt,
      [
        ```LaTeX
        \begin{document}
            Hello World!
        \end{document}
        ```
      ],
      [
        ```typst
        Hello world!
        ```
      ],
    ),
  )
][
  #set text(size: 20pt)
  ```LaTeX
  \begin{document}
      \newcounter{x}
      \newcounter{y}
      \forloop{y}{0}{\value{y} < 5}{     % y goes from 0 to 4
      \forloop{x}{0}{\value{x} < 10}{ % x goes from 0 to 9
      (\arabic{x},\arabic{y})     % print out tuples
      }
      }
  \end{document}
  ```
  #figure(image("forlooptuples.svg"))
][

  #set text(size: 20pt)
  #grid(
    column-gutter: 30pt,
    columns: 2,
    [
      ```typst
        #{
            for y in range(5){
                for x in range(10){
                    repr((x, y))
                }
            }
        }
      ```],
    [
      #{
        let a = ()
        for y in range(5) {
          for x in range(10) {
            a.push(repr((x, y)))
          }
        }
        grid(columns: 5, column-gutter: 5pt, row-gutter: 10pt, ..a)
      }],
  )
][
  #align(
    (left + top),
    [

      - Faster compile times
      - Easy to understand errors
      - Easier language
      - Less technical debt
    ],
  )
]


== Zotero With typst
- Better BibTeX Extension @BetterBibTeXZotero
#grid(
  columns: 2,
  column-gutter: 20pt,
  [
    #figure(image("betterbiblatex.png", width: 70%))],
  [
    #set text(size: 20pt)
    ```typst
    #bibliography(
        "bibliography.bib",
        "american-medical-association"
        )
    ```
  ],
)
#[
  #set text(15pt)
  #bibliography(title: none, "typst-presentation.bib", style: "american-medical-association")
]

== Give it a try!
#figure(image("tryit.png"))

- https://typst.app
