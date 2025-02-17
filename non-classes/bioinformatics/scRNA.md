---
title: "scRNA Analysis"
---

## Numbers

- Several hundred cell types in the human body
- Cell type specific genes (altered expression)
- housekeeping genes are not altered between cell types (5000)
  - constant between cell types

## Bulk RNA-seq

- Condition tissue vs Control tissue
- determine difference in expression between two tissues (not cell specific)
- often not valid for individual cell types

### Purified Bulk

- attempt to isolate specific cell types before bulk sequencing

  - Computational and Experimental purification (FACS antibodies/genetic
    drivers) methods

- Pseudo-bulk takes single cell RNA-seq data and combines it so that it can be
  analyzed with classic bulk RNA-seq tools.

## 10X genomics scRNA=seq platform

- droplets (aqueous in oil) are used to separate cells

  - droplets are controlled so that each droplet contains one cell
  - cells in droplets are given a barcode to allow for later identification

> [!info] GEM (gel beads in emulsions)
