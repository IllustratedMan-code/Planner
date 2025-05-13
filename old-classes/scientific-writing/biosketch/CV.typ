#let Address(Street: content, City: content, State: content, ZipCode: content) = (
  Street: Street,
  City: City,
  State: State,
  ZipCode: ZipCode,
)

#let Education(
  Institution: content,
  Location: Address,
  Degree: content,
  BeginDate: datetime,
  CompletionDate: datetime,
  FieldOfStudy: content,
) = {
  (
    Institution: Institution,
    Location: Location,
    Degree: Degree,
    BeginDate: BeginDate,
    CompletionDate: CompletionDate,
    FieldOfStudy: FieldOfStudy,
  )
}

#let Experience(
  BeginDate: datetime,
  EndDate: datetime,
  Institution: content,
  Location: Address,
  Description: content,
  Title: content,
) = (
  BeginDate: BeginDate,
  EndDate: EndDate,
  Institution: Institution,
  Location: Location,
  Description: Description,
  Title: Title,
)

#let Course(Date: datetime, Title: content, CourseCode: content, Grade: content) = (
  Date: Date,
  Title: Title,
  CourseCode: CourseCode,
  Grade: Grade,
)


#let Educations = (
  Education(
    Institution: [University of Cincinnati],
    Location: Address(City: [Cincinnati], State: ([Ohio], [OH]), ZipCode: 45221, Street: [2600 Clifton Ave]),
    Degree: [Bachelors of Science],
    BeginDate: datetime(year: 2019, month: 8, day: 26),
    CompletionDate: datetime(year: 2024, month: 4, day: 25),
    FieldOfStudy: [Computer Science],
  ),
  Education(
    Institution: [University of Cincinnati],
    Location: Address(City: [Cincinnati], State: ([Ohio], [OH]), ZipCode: 45221, Street: [2600 Clifton Ave]),
    Degree: [PhD],
    BeginDate: datetime(year: 2024, month: 5, day: 6),
    CompletionDate: datetime(year: 2029, month: 4, day: 25),
    FieldOfStudy: [Biomedical Informatics],
  ),
)

#let Experiences = (
  Experience(
    BeginDate: datetime(month: 8, day: 26, year: 2024),
    EndDate: [Present],
    Title: [Biomedical Informatics PhD Student],
    Institution: [Cincinnati Children's Hospital Medical Center],
    Location: Address(State: ([Ohio], [OH]), City: [Cincinnati], Street: [3333 Burnet Ave], ZipCode: [45229-3026]),
  ),
  Experience(
    BeginDate: datetime(day: 1, year: 2022, month: 7),
    Title: [Researcher/Software Engineer/Rotation Student],
    EndDate: [Present],
    Institution: [Weirauch Lab, Cincinnati Children's Hospital Medical Center],
    Location: Address(State: ([Ohio], [OH]), City: [Cincinnati], Street: [3333 Burnet Ave], ZipCode: [45229-3026]),
  ),
)

#let RelevantCourseWork = (
  Course(Title: [Introduction To Bioinformatics], Date: datetime.today(), Grade: [A]),
)

#Educations
#Experiences
