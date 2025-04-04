#import "./CV.typ": Educations, RelevantCourseWork, Experiences
#let hline() = {
  line(length: 100%)
}

#let conf(
  Name: "David Lewis",
  eRACommonsUserName: "N/A",
  PositionTitle: "N/A",
  EducationTraining: Educations,
  PersonalStatement: none,
  Positions: Experiences,
  ScientificAppointments: none,
  Honors: none,
  ContributionsToScience: none,
  RelevantCourseWork: RelevantCourseWork,
  Date: datetime.today(),
  doc,
) = {
  set page("us-letter", margin: (right: 2in, left: 0.5in, top: 0.5in, bottom: 0.5in))

  let content_or_date(content, display) = {
    if type(content) == datetime {
      return content.display(display)
    }
    return content
  }
  hline()
  [
    #align(center)[
      #text(12pt, weight: "bold")[BIOGRAPHICAL SKETCH] \
      #text(8pt)[
        Provide the following information for the Senior/key personnel and other significant contributors. \
        Follow this format for each person. *DO NOT EXCEED FIVE PAGES*
      ]
    ]

  ]
  hline()
  [NAME: #Name]
  hline()
  [eRA COMMONS USER NAME (credential, e.g., agency login): #eRACommonsUserName]
  hline()
  [EDUCATION/TRAINING <edu>]
  {
    let date_display = "[Month]/[Year]"
    set table(
      stroke: (x, y) => (
        left: if x > 0 { 1pt },
        top: if y >= 0 { 1pt },
      ),
    )
    table(
      columns: (1fr, 1fr, 1fr, 1fr), table.header(
        [INSTITUTION AND LOCATION],
        [DEGREE (if applicable)],
        [Completion Date MM/YYYY],
        [FIELD OF STUDY],
      ), ..(
        EducationTraining.map(it => {
          if it.CompletionDate <= datetime.today() {
            return (
              [#it.Institution \ #it.Location.City, #it.Location.State.at(0) ],
              it.Degree,
              {
                if (type(it.CompletionDate) == datetime) { it.CompletionDate.display(date_display) } else {
                  it.CompletionDate
                }
              },
              it.FieldOfStudy,
            )
          } else {
            return none
          }
        })
      )
        .filter(it => it != none)
        .flatten()
    )
  }
  set heading(numbering: "A.1.")
  if PersonalStatement != none {
    heading("Personal Statement")
    PersonalStatement
  }

  heading("Positions, Scientific Appointments, and Honors")
  heading("Positions and Employment", depth: 2)
  {
    set par(leading: 0.52em)
    grid(
      columns: 2,
      column-gutter: 2em,
      row-gutter: 1em,
      ..Positions
        .map(it => (
          [#content_or_date(it.BeginDate, "[Year]") - #content_or_date(it.EndDate, "[Year]")],
          [#it.Title, #it.Institution, #it.Location.City, #it.Location.State.at(1)],
        ))
        .flatten(),
    )
  }

  if ContributionsToScience != none {
    heading("Contributions To Science")
    ContributionsToScience
  }
  if RelevantCourseWork != none {
    heading("Relevant Course Work")
    set table(
      align: (x, y) => (
        if y == 0 { center } else { left }
      ),
    )
    table(
      columns: (0.3fr, 1fr, 0.3fr),
      table.header([YEAR], [COURSE TITLE], [GRADE])
      , ..RelevantCourseWork.map(it => (it.Date.display("[year]"), it.Title, it.Grade)).flatten()
    )
  }
  doc
}

