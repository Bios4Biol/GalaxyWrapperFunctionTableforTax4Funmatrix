# Galaxy Wrapper Function Table for Tax4Fun matrix

The BIOM output file from the step 4 of Frogs pipeline (« FROGS Affiliation OTU » tool) contains a abundance table of OTUs and their taxonomies. Thanks to these informations, a metabolic and functional prediction can be done with «Function Table for Tax4Fun matrix (Galaxy Version 1.0.0)» tool.

Three remarks:

- The database used for «Function Table for Tax4Fun matrix (Galaxy Version 1.0.0)» tool is Silva version 123. 
- FROGS team recommends a taxonomic affilation with blastn, then this generate multi-affiliations. OTUs whose taxonomy contains the term « multi-affiliation » won't find correspondences with KEGG organims. 
- «Function Table for Tax4Fun matrix (Galaxy Version 1.0.0)» tool take as input file a phyloseq object in rdata format.

Four intermediate steps must be performed before using the tool «Function Table for Tax4Fun matrix (Galaxy Version 1.0.0)», these steps allow: 
- Convert the BIOM file in a tabular file,
- Replace «multi-affiliation » terms by empty strings,
- Convert the tabular file in a BIOM file,
- Build a phyloseq object in rdata format from the previous BIOM file.

In order to achieve these steps quickly following the Frogs pipeline, the workflow «Function Table for Tax4Fun matrix » is available in .ga format
You can download this workflow from your Galaxy account, check tools parameters, and then run this pipeline on your own data.

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/1-wf_function_table.png)

Figure 1: Workflow "Function Table for Tax4Fun matrix".

# 1ère étape: convertir le fichier de format biom en format tabular.

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/2-biom-to-tsv.png)

Figure 2: “FROGS BIOM to TSV (Galaxy Version 2.1.0)” tool.

# 2ème étape:remplacer les termes « multi-affiliation » par des chaînes vides.

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/3-find-replace.png)

Figure 3: “Find and replace (Galaxy Version 1.0.0)” tool.

# 3ème étape: convertir le fichier de format tabular en format biom.

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/4-tsv_biom.png)

Figure 4: “FROGS TSV_to_BIOM (Galaxy Version 2.0.0)” tool.

# 4ème étape: construire un objet phyloseq de format rdata à partir du fichier de format biom.

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/5-phyloseq.png)

Figure 5: “FROGSSTAT Phyloseq Import Data (Galaxy Version 1.0.1)” tool.

A l’issue de ces 4 étapes, l’outil «Function Table for Tax4Fun matrix (Galaxy Version 1.0.0)» peut être utilisé:

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/6-function_table.png)

Figure 6 : “Function Table (Galaxy Version 1.0.0) ” tool.

A description of input and output files, references, links to the package R «themetagenomics» and manual are available on the tool form.

The arguments, described in the manual, are as follows:
t4f(otu_table=ABUND,rows_are_taxa=FALSE,tax_table=TAX,reference_path=tmp,type='uproc',short=TRUE,cn_normalize=TRUE,sample_normalize=TRUE,drop=TRUE)

The column headers of the output tables of the tool are shifted one column to the left.

# Description

Use of Tax4Fun with themetagenomics R package, otu_table and tax_table of phyloseq object to generate function table.

The David et al. time series dataset is used as example (source: https://cran.r-project.org/web/packages/themetagenomics/vignettes/functional_prediction.html).

# Input files

Data file (format rdata): One phyloseq object containing the OTU abundance table and their taxonomies. This file can be the result of FROGS Phyloseq Import Data tool.

The David dataset has an OTU abundance table with 1493 taxa and 746 samples, and a taxonomy table with 1493 taxa by 7 taxonomic ranks.

The OTU abundance table (taxa are rows):

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/a-OTU_abundance_table.png)

The taxonomy table (taxa are rows):

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/b-taxonomy_table.png)

# Output files

Output file is the function table that contains the KO term counts across samples, the KEGG metadata that describes the KO terms, and t4f specific metadata that has the FTU scores.

The function table «fxn_table» : The function table (format txt) contains the KO term counts across samples.

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/d-fnx_table.png)

The KEGG metadata « fxn_meta» : The KEGG metadata (format txt) describes the KO terms.

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/e-kegg.png)

Tax4Fun specific metadata «method_meta» : The Tax4Fun specific metadata (format txt) has the FTU quality control score for each sample. The FTU score is the fraction of OTUs that could not be mapped to KEGG organisms (KO terms).

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/f-ftu.png)


# Galaxy wrapper's authors

Helene Billard - UMR-1280 PhAN Inra-Universite de Nantes

Sarah Maman - Sigenae GenPhySE - Inra Occitanie

# Version Galaxy Tool : V1.0

# Contacts
support.sigenae@inra.fr

# Please cite

Depending on the help provided you can cite us in acknowledgements, references or both.
Examples

Acknowledgements :
<pre>
We wish to thank SIGENAE group and UMR-1280 PhAN Inra-Universite de Nantes.
</pre>

References :
<pre>
SIGENAE [http://www.sigenae.org/]
Package R "themetagenomics" (authors : Stephen Woloszynek): https://cran.r-project.org/web/packages/themetagenomics/
Manual ("t4f" : description, usage, arguments, sorties, references): https://cran.r-project.org/web/packages/themetagenomics/themetagenomics.pdf    
</pre>
