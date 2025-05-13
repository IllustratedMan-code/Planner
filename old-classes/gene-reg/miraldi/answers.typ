#import "@local/assignments:1.0.0": conf
#show: doc => conf(title: "", doc)

= Part 1
== Question 0

A transcriptional regulatory network is a directed graph representing the
interactions between different RNA transcripts created using transcriptome data

== Question 1
Transcription factor activities (TFA) are a latent variable pooling the effects of post-translational and post-transcriptional modifications. Latent, meaning that the TFA
cannot be directly measured.

TFA is estimated using the following relationship:

$ X = P A $

Where X is a matrix containing the transcriptional data, P is a matrix containing the known interactions (prior network), and A is the goal (TFA).

There are many possible As (an over determined system), but the method used in the paper is a minimization of:

$ || P accent(A, hat) - X||^2 $

$accent(A, hat)$ is the particular version of $A$ used in the paper.

== Question 2

=== Recall of known regulatory edges

AUPR is fairly low because the precision and recall are calculated based on edges not provided to the network from the gold standard (prior network).


=== Experimental evaluation of novel edges

Knock out experiments are used to assess the validity of novel edges (knock out of node)

=== Comparison to other techniques

AUPR is compared to CLR, and Genie3 mainly.

== Question 3

If the effect of the knockout is too severe, then the effect can not be accurately assessed. I.E. if the TRN predicts a node to have an effect on nodes related to survival, but in reality the actual interactions are different (but still related to survival), then
the experiment cannot be used as verification for predicted interactions (edges).

= Part 2

