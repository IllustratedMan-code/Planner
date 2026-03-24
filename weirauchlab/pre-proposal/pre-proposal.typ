#let _ = ```typ
exec typst c "$0" --root "$(readlink -f "$0" | xargs dirname)/./"
⁠```
#set document(title: "David's Dissertation Pre-proposal", date: datetime(year: 2026, month: 3, day: 10))
#set text(lang: "en")
#import "@local/assignments:1.0.0": conf
#show: doc => conf(title: context{document.title}, date: context{if document.date == auto {datetime.today().display("[month repr:long] [day], [year]")} else {document.date.display("[month repr:long] [day], [year]")}}, doc)
#outline()
#set heading(numbering: "1.")
#heading(level: 1)[Commitee members] #label("org0683e02")
#list(list.item[Matthew Weirauch (Chair)])#list(list.item[Leah Kottyan])#list(list.item[Susan Wells])#list(list.item[Krishna Roskin])
#heading(level: 1)[Introduction] #label("orgfe45e23")
This document consists of a description of proposed dissertation aims,
submitted to the PhD committee for review. Assuming the aims are
satisfactory, this document will be converted to a \u{22}proposal\u{22}, which
would then be approved by the committee. If the document is not
satisfactory, feedback from the committee will be incorporated before
being converted to a proposal.
#heading(level: 1)[Aims] #label("orgd048a97")
The aims of the proposal are listed below. There are three aims, two
of which consist of analysis of bioinformatics datasets, while the
other aim is much more computer science related and is meant to
facilitate analysis.
#heading(level: 2)[Aim 1: PU.1 (Mostly Complete) ] #label("org28c6bd5")
A comprehensive analysis of all the ChIP\u{2d}seq data available for the
human transcription factor PU.1., determining cell\u{2d}type\u{2d}specific
differences in PU.1 binding. The analysis included:

#list(list.item[Differential protein binding peak analysis])#list(list.item[Gene ontology analysis, via
#link("https://github.com/jokergoo/rGREAT")[GREAT] #footnote(link("https://github.com/jokergoo/rGREAT"))])#list(list.item[Transcription factor motif enrichment analysis, via Homer
#list(list.item[Used to find potential cooperative binding with PU.1])])#list(list.item[Connections to GWAS studies via RELI, a tool created in the])
Weirauch lab
#list(list.item[Identification of allele\u{2d}dependent binding behavior via MARIO, a tool
developed in the Weirauch lab])#list(list.item[Comparison of Mario results to other methods including alphagenome])

This analysis resulted in a co\u{2d}first author manuscript, which has been sent out
for review.
#heading(level: 2)[Aim 2: Piper ] #label("org0565b44")
While performing the analysis for #link(label("org28c6bd5"))[Aim 1], it became clear that the
existing tools for creating bioinformatics analysis pipelines were
lacking. Particularly, once a project reaches a certain size, it
becomes very difficult to connect different analysis intermediates
without running into errors. This aim attempts to solve this problem
by creating a \u{22}pipeline manager\u{22}, a computational tool which can be
used to effectively string together other analyses.

This tool would simplify the creation of complicated analysis, while
also conferring a degree of reproducibility that wasn\u{27}t there
before. The tool, which has been tentatively named \u{22}Piper\u{22} would
facilitate the analysis in Aim 3. 

A more detailed description of Piper is located at the #link(label("org3d53177"))[end of this document].
#heading(level: 2)[Aim 3: VTR HPV] #label("org7f2d2e7")
Similar to #link(label("org28c6bd5"))[Aim 1], this aim would consist of bioinformatics analysis,
though the scope is different. Instead, this aim hopes to determine
the effect of viral transcriptional regulators (VTRs) from Human
Papillomavirus (HPV) on human cell lines.

To this end, the Weirauch lab has generated ATAC\u{2d}seq, RNA\u{2d}seq,
and ChIP\u{2d}seq data for three HPV VTRs [E2, E6, E7], from 4 different
HPV strains [HPV6a, HPV11, HPV16, HPV18] in two different cell lines
[Flp\u{2d}In 293, Flp\u{2d}In TREx HCT116], amounting to over a hundred distinct datasets.

This aim would consist of the analysis of these datasets to provide
insight into the effect of these VTRs on human cells. Many of the same
analyses from #link(label("org28c6bd5"))[Aim 1] may be done here, though must be adapted to fit the
data.

Currently, the analysis is in an exploratory phase, though input from
committee members is of course appreciated. 
#heading(level: 1)[Piper (extended) ] #label("org3d53177")
Below is a description of the current plans for the pipeline manager
\u{22}Piper\u{22}. Any thoughts or feedback are very much appreciated!
#heading(level: 2)[The problem] #label("org7fbcbb2")
Most bioinformatics analyses require connecting many computational
tools together across many \u{22}steps\u{22}. Many of these steps require
significant amounts of computational resources. The tools involved in
bioinformatics analysis specifically are often not well maintained or
require very specific computational environments to work correctly.

To solve the problem of computational resources, analysts often run
their analysis on high performance compute (HPC) clusters, such as the
one at CCHMC. Each HPC cluster has a \u{22}job scheduler\u{22}, a piece of
software used to manage the computational resources and assign those
resources to each analyst at the appropriate time. Each HPC cluster
may have a #emph[different] job scheduler which is operated by the analyst in
a different way. This is one of the problems that Piper aims to solve,
that is, create a consistent way to interact with all job schedulers
on any HPC. For example, the CCHMC cluster uses a job scheduler called
LSF, while the Ohio Supercomputer Center (OSC), uses a job scheduler
called slurm. An analyst wanting to run an analysis written for LSF
would have to convert all of the LSF commands to slurm command. A
pipeline developed in Piper would work in both places.

A typical bioinformatics analysis may use dozens of computational
tools, many of which are poorly maintained. As often occurs with
scientific software, developers and analysts are typically not financially
motivated to maintain their software, as the software is usually
developed to solve a problem for that specific
developer. Bioinformatics in particular suffers from this problem
because, as a cross\u{2d}disciplinary field, many developers do have formal
computer science backgrounds and do not practice, or are not aware of,
standard measures to ensure code quality. What does this mean for the
analyst? Most analysts will eventually run into the problem commonly
referred to as \u{22}dependency hell\u{22}. When a piece of software becomes
poorly maintained, its dependencies may not be updated, requiring
\u{22}old\u{22} versions of other software to function. When an analyst needs two
pieces of software that depend upon another, shared, piece of
software, if one of the required pieces of software is poorly
maintained, then it may need a different version of the shared piece
of software. The analyst then needs to find some way to install
multiple versions of the same software and ensure any dependent
software knows which version to look for. This phenomenon is known as
dependency hell.

Dependency hell is typically dealt with by \u{22}containers\u{22}, which effectively
\u{22}snapshot\u{22} a working dependency tree for one or more pieces of
software. Once a container has been created, it can be loaded to
create the environment the analyst needs. There are many different
container \u{22}runtimes\u{22} that each have different interfaces for use.
For example, Docker containers are different than Singularity
containers, but one or both may be available on the analyst\u{27}s HPC
cluster. Piper would create a unified interface. The user would
specify the container, and Piper would handle the rest.

The final problem that Piper aims to solve is one of organization. An analysis
\u{22}pipeline\u{22} is simply a set of steps that an analyst must perform to
create the analysis. This amounts to a set of programs or scripts, written by the
analyst, which create the desired output after running in a particular
order. This is not a problem if there are only a few steps, but
bioinformatics analysis tends to be complicated. For example, the
analysis performed in #link(label("org28c6bd5"))[Aim 1] required dozens if not hundreds of steps
and thousands of HPC jobs submitted to the scheduler. Some steps
required many hours to perform. When the analysis reaches this size,
it becomes difficult to make sure that every step has been run
appropriately. For example, if an analyst were to make several changes
to the pipeline and forgets which steps were changed, they may have to
rerun the entire analysis to ensure that the final results are
accurate. They also must ensure that each step runs successfully,
something which may not be guaranteed, especially on a HPC cluster.
Piper would keep track of which steps have been modified and run only
the appropriate steps based on those changes.
#heading(level: 3)[Current Solutions] #label("orge53d16f")
Currently, there are a few solutions that solve these problems, though
each come with their own set of problems. The two most common in
bioinformatics are #link("https://snakemake.readthedocs.io/en/stable/index.html")[Snakemake] #footnote(link("https://snakemake.readthedocs.io/en/stable/index.html")) and #link("https://www.nextflow.io/")[Nextflow] #footnote(link("https://www.nextflow.io/")), though more do exist, like
#link("https://docs.openwdl.org/overview.html")[WDL] #footnote(link("https://docs.openwdl.org/overview.html")), and #link("https://github.com/PapenfussLab/bionix")[BioNix] #footnote(link("https://github.com/PapenfussLab/bionix")). So why write another one? Nextflow, which was used to
complete #link(label("org28c6bd5"))[Aim 1], has a significant learning curve and subpar error
handling. The other alternatives are widely considered either equal or
inferior to Nextflow. Pipeline managers should be easy to use and
provide a tangible benefit over not using one. 
#heading(level: 2)[Piper\u{27}s design] #label("orgbb07b37")
The design of Piper is guided by 3 principles.

#enum(enum.item(1)[Piper should have at least all of the features that any alternative
would have],
enum.item(2)[Piper should be considerably easier to learn and use than any alternative],
enum.item(3)[Piper should be easy to maintain and take less effort to develop
than the alternatives],
)
#heading(level: 3)[Piper Lang] #label("org74a918f")
Workflow\u{2f}pipeline managers define \u{22}steps\u{22} in their pipelines with a
domain specific language (DSL). Maintaining a language takes
considerable effort. If Piper were to use a fully custom language, it
would violate design principle 3. To this end, Piper uses a language
called \u{22}scheme\u{22} to define pipelines in. Scheme is a type of Lisp, a
language with a very long history, but particularly well suited for
creating DSLs. Scheme, along with any Lisp, has a feature called
\u{22}macros\u{22} which allows a developer to add custom syntax onto the
language within the language. This makes any syntax features specific
to Piper easy to implement. The reason scheme is used here instead of
any other particular lisp is because
a particular variant of scheme called
#link("https://github.com/mattwparas/steel")[Steel] #footnote(link("https://github.com/mattwparas/steel")) is very easy to use in conjunction with a language called #link("https://rust-lang.org/")[Rust] #footnote(link("https://rust-lang.org/")).
Rust is used for piper\u{27}s \u{22}backend\u{22} for a few reasons. The central
reason to use rust is it allows the developer to handle every possible
error that could arise in the program, making good error handling easy
to implement. Otherwise, rust is an extremely fast language and the
binaries it creates are easy to build and use on many systems.

Pipelines might be defined like so:

#figure([#raw(block: true, lang: "lisp", ";; we will create some fastq files with this script
(define script (file! \u{22}create_fastqs.py\u{22}))
(define proc1
  (process!
   name : \u{22}process 1\u{22}
   container : \u{22}ubuntu:latest\u{22}
   time : (hours 5)
   memory : (GB 10)
   ;; the script writes the fastqs to the proc1 output path {{out}}
   script : #<<''
     python {{script}} --output {{out}}
   ''
 ))



(define script2 (file! \u{22}process_fastq.py\u{22}))
(define proc2
  (process!
   name : \u{22}process 2\u{22}
   container : \u{22}ubuntu:latest\u{22}
   time : (hours 2)
   memory : (GB 10)
   ;; the script processes the fastq and writes the analysis to the {{out}}
   script : #<<''
     python {{script2}} --fastq {{proc1}}/1.fastq --out {{out}}
   ''
   ))

;; the output of proc2 will be copied to my_results.txt in the pipeline results directory
(output!
 \u{22}my_results.txt\u{22} : proc2)")]) #label("orgc975c02")


Here, Piper would determine that the outputs requires #raw("proc2"), that
#raw("proc2") requires #raw("proc1") and #raw("script2"), and #raw("proc1") requires #raw("script"). It would
then run #raw("proc1") first, then #raw("proc2"), and finally copy the output of
#raw("proc2") into the results directory as #raw("my_results.txt").


Piper pipelines could be more complicated, but this is a basic
definition that would take little time to learn, while still being
useful when creating analyses. 
#heading(level: 3)[Piper\u{27}s model] #label("org9cdade3")
Piper models each \u{22}step\u{22} in a pipeline as a \u{22}process\u{22}, which can
utilize a container or request computational resources like time or
memory. The \u{22}script\u{22} attribute of a process is the code that will be
run in the pipeline. Anything inside a double bracket #raw("{{}}") is a
variable or expression defined in the scheme language. Piper checks
these variables for a particular type of object called a
\u{22}derivation\u{22}. #raw("process!") calls create derivations, along with #raw("file!")
calls. Each derivation is a node in a dependency graph.

Piper runs the entire scheme script before running the pipeline. This
way, Piper can determine if everything is in order in the pipeline
before running anything. The scheme script creates a directed a\u{2d}cyclic
graph (DAG) which Piper then interprets into a particular order to run
the processes.

Piper also keeps track of modifications to the derivations, so any
changes to any derivation, such as a change to #raw("create_fastqs.py") will
create a chain reaction that causes any dependent derivation to be
reevaluated. Piper does this by creating a cache of each derivation
that requires the caches of all of its dependent derivations.
