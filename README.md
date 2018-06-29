# GalaxyWrapperFunctionTableforTax4Funmatrix

Le BIOM sortant de l’étape 4 de la pipeline FROGS (Outil « FROGS Affiliation OTU ») contient la table d’abondance des OTUs et leurs taxonomies. A partir de ces informations, une prédiction métabolique et fonctionnelle peut être réalisée avec l’outil «Function Table for Tax4Fun matrix (Galaxy Version 1.0.0)».

Trois remarques:

- La base de données utilisée pour l’outil «Function Table for Tax4Fun matrix (Galaxy Version 1.0.0)» est Silva version 123. 
- L’équipe FROGS recommande une affiliation taxonomique avec blastn, ce qui génère des multi-affiliations. Les OTUs dont la taxonomie contient un terme « multi-affiliation » ne trouveront pas de correspondance avec les organismes KEGG. 
- L’outil «Function Table for Tax4Fun matrix (Galaxy Version 1.0.0)» prend en entrée un objet phyloseq de format rdata.

4 étapes intermédiaires doivent être effectuées avant l’utilisation de l’outil «Function Table for Tax4Fun matrix (Galaxy Version 1.0.0)», et permettent de :
- convertir le fichier de format biom en format tabular,
- remplacer les termes «multi-affiliation » par des chaînes vides,
- convertir le fichier de format tabular en format biom,
- construire un objet phyloseq de format rdata à partir du fichier de format 
biom.

Afin de réaliser ces étapes rapidement à la suite du pipeline FROGS, le workflow «Function Table for Tax4Fun matrix » est disponible au format .ga 
Vous pourrez l’importer dans votre espace Galaxy, vérifier les paramètres des outils détaillés ci-dessous, et l’exécuter sur vos données. 

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/1-wf_function_table.png)

Figure 1: Workflow "Function Table for Tax4Fun matrix".

# 1ère étape: convertir le fichier de format biom en format tabular.

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/2-biom-to-tsv.png)

Figure 2: Formulaire de l’outil “FROGS BIOM to TSV (Galaxy Version 2.1.0)”.

# 2ème étape:remplacer les termes « multi-affiliation » par des chaînes vides.

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/3-find-replace.png)

Figure 3: Formulaire de l’outil “Find and replace (Galaxy Version 1.0.0)”.

# 3ème étape: convertir le fichier de format tabular en format biom.

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/4-tsv_biom.png)

Figure 4: Formulaire de l’outil “FROGS TSV_to_BIOM (Galaxy Version 2.0.0)”.

# 4ème étape: construire un objet phyloseq de format rdata à partir du fichier de format biom.

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/5-phyloseq.png)

Figure 5: Formulaire de l’outil “FROGSSTAT Phyloseq Import Data (Galaxy Version 1.0.1)”.

A l’issue de ces 4 étapes, l’outil «Function Table for Tax4Fun matrix (Galaxy Version 1.0.0)» peut être utilisé:

![alt text](https://github.com/Bios4Biol/GalaxyWrapperFunctionTableforTax4Funmatrix/blob/master/6-function_table.png)

Figure 6 : Formulaire de l’outil “Function Table (Galaxy Version 1.0.0) ”.

Une description des fichiers en entrée et en sortie, ainsi que les références avec des liens vers le package R «themetagenomics
» et le manuel sont disponibles sur le formulaire de l’outil.

Les arguments, décrits dans le manuel, sont les suivants:
t4f(otu_table=ABUND,rows_are_taxa=FALSE,tax_table=TAX,reference_path=tmp,type='uproc',short=TRUE,cn_normalize=TRUE,sample_normalize=TRUE,drop=TRUE)

Les en-têtes des colonnes des tables en sortie de l'outil sont décalés d'une colonne vers la gauche.

