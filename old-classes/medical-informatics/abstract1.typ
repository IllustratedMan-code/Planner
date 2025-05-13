#import "@local/assignments:1.0.0": conf
#show: doc => conf(title: "Abstract 1: Why Doctors Hate Their Computers", doc)
#import "@preview/wordometer:0.1.2": word-count, total-words
#show: word-count

#let total = [
  #set align(center)
  #box(stroke: black, inset: 5pt, radius: 5pt, 
  [Word Count = #total-words]
  )
]

#let author_first = "Atul"
#let author_last = "Gawande"
#let author = [#author_first #author_last]

Large scale electronic health records present a radical change in the day-to-day practice of Doctors world-wide.
While welcomed by some, #author posits that most doctors, including himself, hate the change. 
He gives several potential reasons for this, central of which is the fact that doctors are 
spending much of their working hours filling out electronic records instead of caring for patients. 
#author_last links this directly with work satisfaction, marking it as much more important than long hours.
Additionally, #author_last shows that both the patients and the doctors prefer it when doctors do have a screen
in front of them.

One of the reasons that doctors are spending more time on patient charts than they were previously is that 
they are forced to fill out fields and questions that they simply left blank on paper charts. Many of the
mandatory fields present in an electronic health record (EHR) are for others, not the doctor who filled them out.
EHRs facilitate cooperation between medical institutions, something that is valuable for a patients care and bank account
as many tests no longer have to be done multiple times and other medical personnel have access to valuable details that
they did not have previously. While one could say that the benefits outweigh the costs for this reason alone, the
true picture is a little more complicated. Sometimes there is too much information available, leading to information fatigue.
There starts to become much more information associated with a single patient than any single person can comprehend, especially
under tight time constraints like a 30 minute appointment.

The main benefit of EHRs, according to #author_last, is that patient outcomes are improved. 
Since the benefit of EHRs is the easy access to patient data, as well as the presence of large quantities of it,
these features are directly responsible for better patient outcomes. One could argue that complaints from 
doctors are simply growing pains and that doctors will eventually adjust to the new systems. However, 
software is complicated, and the more complex it is, the more "brittle" it is as #author_last puts it. 
New features become more and more difficult to add, and bugs become more and more common with each update.
Technical debt only continues to get worse unless active steps are taken to alleviate it. One way that 
Developers could limit the "brittleness" of their software is by making it extensible. #author_last
refers to the idea as an "app store". The more extensible a piece of software becomes, the more flexible it becomes.
Hospitals would have more control over their EHR, while reducing the developmental load on the EHR companies.

The way the software world is going, I would be suprised if there was not mass adoption of AI, particularly large language
models within the world of EHRs. #author_last mentions a situation where doctors have assistants that help them 
fill out their charts during or after the actual appointment. LLMs are poised to take over this responsibility and may have
better accuracy than the typical scribe as described by #author_last.

#total

