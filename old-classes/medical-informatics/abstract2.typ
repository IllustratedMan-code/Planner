#import "@local/assignments:1.0.0": conf
#show: doc => conf(title: "Abstract 2: Prompt Engineering", doc)
#import "@preview/wordometer:0.1.2": word-count, total-words

#word-count(total => [
  #let total-count = [
    #set align(center)
    #box(stroke: black, inset: 5pt, radius: 5pt, [Word Count = #total.words])]
  Biomedical informatics is a union of many fields of study, one of which is the study of genomics. Genomics can be defined as the study of genomes via computational methods. Precision medicine, a subfield of genomics which leverages the power of large datasets to elevate patient outcomes, is becoming a new frontier in medicine.
  In recent years, beginning with the human genome project @HumanGenomeProject, managing the large quantities of genomic data is becoming increasingly complex. Once a bottleneck for genomic analysis, acquiring genomic data has become easier than ever. Companies like 23andMe @23andmeDNAGeneticTesting are now able to provide cheap genomic sequencing for the average consumer, contributing to the absolutely massive number of genomic datasets, many of which are publically available. Precision medicine that utilizes these datasets for the benefit of individual patients has had great success, showing the ability to treat illnesses that are hard or impossible to treat using normal methods @rossCaseStudyPrecision2021 @philadelphiaCaseStudyPrecision. Unfortunately, the collection of genomic data is not without its problems. Large datasets are often difficult to interpret, and genomic datasets are no different. 

  Large datasets are not only hard to analyze, but also pose difficult ethical questions. Patients may not consent, or may not know they consented to have their data used by hospitals and other medical organizations. For-profit companies are even more likely to make unethical decisions regarding patient data. As one example, 23 and Me may sell customer genetic data without explicit consent. @23andMeFacesBankruptcy2024 Access to patient data is integral to research, but unethical data access, beyond being morally abhorrent also lowers the opinion of the public towards biomedical informatics as a whole. Individual data access is not the only ethical dilemma facing genomics and more broadly biomedical informatics research. Due to similarities in genetic code between families and relatives, one individual giving consent can infringe on the right of another individual to give consent. The average sibling, for example, shares roughly 50% of their genome with their other siblings. This means 50% of the identifying characteristics of one sibling can be acquired from the genetic data of the other sibling. If one of the siblings in a family signs up for genetic testing, they release genetic data pertaining to all of their family members, essentially consenting for them. Balancing the benefits of medical treatment that utilizes patient data and the ethical concerns of using that data is a difficult on-going problem.

  Looking forward, the future of genomics in biomedical informatics lies in enhanced integration with artificial intelligence (AI) and machine learning (ML) technologies. These advancements could help automate and optimize the interpretation of complex genomic data, enabling faster, more accurate diagnoses and treatment plans. Precision medicine, driven by the confluence of genomics and AI, is expected to grow as genomic data becomes more accessible and AI models more sophisticated. One emerging trend is the increased use of polygenic risk scores, which offer probabilistic assessments of a patient's likelihood to develop certain conditions based on their genomic profile. @PolygenicRiskScores By combining genomic information with other health data, such as environmental factors and lifestyle choices, AI systems could offer holistic, highly personalized care.

  #total-count
])
#pagebreak()
#bibliography(style: "american-medical-association", "Case Study 2.bib")

= Prompt
#quote()[
  I used ChatGPT with the customization feature, so the below prompt may give something significantly different if used on a "vanilla" version of ChatGPT. I also formatted citations to be consistent across the non-ChatGPT and ChatGPT paragraphs.
]

#block(
  stroke: gray,
  radius: 5pt,
  inset: 5pt,
  [

    This abstract will be a little different from the last one. Your abstract must be at least three paragraphs. One of those paragraphs must be written by ChatGPTLinks to an external site. (or equivalent) with NO editing by you. This means you need to have the large language model prompt produce an appropriate paragraph to fit in with your writing.

    Your essay should be at least 500 words (including the generated paragraph) that identifies the challenges and obstacles faced by biomedical informatics (in your chosen topic area), discusses ethical issues that may be raised including data privacy, security, and informed consent, and predicts the future trends and innovations in biomedical informatics. Please provide examples and case studies to illustrate these applications. I'm not concerned about your citation format, you can include them at the end. Your file must contain your LLM prompt at the end.

    Pick one of the following topics, create your own, or something else we discussed in class:

    Electronic Health Records (EHRs)
    Clinical Decision Support Systems
    Genomics and Personalized Medicine
    Medical Imaging and Analysis
    Bioinformatics
    Natural Language Processing
    Your response should be turned in by Tuesday 10/22 at midnight in a word or PDF document. If you have any questions, please ask.

    This assignment is worth 50 points. You get an extra 5 points (on top of the 50) if i can't figure out which paragraph ChatGPT wrote, so good luck!

    Write a 3-paragraph essay that fits these requirements, focusing on genomics. Make sure to sound the least like an AI as possible so I can get those bonus points!!

  ],
)