# TTR db - Mutações e Predições

Essa base de dados permite identificar uma variante dentro do arquivo VCF de um paciente e gerar um reporte sobre o diagnóstico molecular do paciente com ATTR indicando o grau de comprometimento do gene.

# Projeto de Conclusão
T1 2020 - Pós-Graduação em Bioinformática aplicada a Genômica Médica - Albert Einstein. 

**Site do Projeto**
* https://sites.google.com/view/ttr-db/pagina-inicial

**Grupo**
- Anelisie Santos
- Bruno Martinucci
- Carlos Eugênio
- Kelin Chen
- Rocío Cuaspa


# Instalando Docker Engine

O Docker Engine está disponível em diversas de plataformas Linux, macOS e Windows 10 por meio do Docker Desktop. Encontre seu sistema operacional preferido abaixo.

* https://docs.docker.com/engine/install/

Adicionando seu usuário no grupo do root
```bash
sudo usermod -aG docker $USER
```


# Anotando com VEP ensembl

1. Baixar a image do ensembl-vep (caso não tenha)
2. Clonar o git ttr-database
3. Executar o ensembl-vep com as opções:
  `--id "18 29172865 29172865 G/A 1"`
  `--species homo_sapiens`
  `--force`
  `--database`
  `--assembly GRCh37`
  `--refseq`
  `--tab` e
  `--custom /data/TTRdb_cureted.sort.vcf.gz,TTRdb,vcf,exact,0,REVEL,REVEL_TTMDB,REVEL_RISK`

### Download da imagem do ensembl-vep
```bash
docker pull ensemblorg/ensembl-vep
```

### git clone ou download (link abaixo)
```bash
git clone https://github.com/projetottr/ttr-database.git
```
ou
* Download: https://github.com/projetottr/ttr-database/archive/refs/heads/main.zip


### Executando um Exemplo
Neste exemplo vamos anotar a variante `18 29172865 29172865 G/A 1`, o resultado será salvo no arquivo `TTRdb_output.txt`.

1. No terminal, entre no diretório `ttr-database`
2. Execute o `docker run` (comando completo abaixo)


```bash
docker run -it -v $(pwd):/data  ensemblorg/ensembl-vep ./vep --id "18 29172865 29172865 G/A 1" --species homo_sapiens --force  --database --assembly GRCh37 --refseq --tab --custom /data/TTRdb_curated.vcf.gz,TTRdb,vcf,exact,0,REVEL,REVEL_TTMDB,REVEL_RISK -o /data/TTRdb_output.txt
```

As últimas colunas da tabela: `REVEL, REVEL_TTMDB e REVEL_RISK`.
### TTRdb_output.txt
```
## ENSEMBL VARIANT EFFECT PREDICTOR v104.3
## Output produced at 2021-08-19 01:44:03
## Connected to homo_sapiens_core_104_37 on ensembldb.ensembl.org
## Using API version 104, DB version 104
## ensembl-variation version 104.6154f8b
## ensembl version 104.1af1dce
## ensembl-funcgen version 104.59ae779
## ensembl-io version 104.1d3bb6e
## refseq version 2020-10-26 17:03:42 - GCF_000001405.25_GRCh37.p13_genomic.gff
## gencode version GENCODE 19
## assembly version GRCh37.p13
## genebuild version 2011-04
## Column descriptions:
## Uploaded_variation : Identifier of uploaded variant
## Location : Location of variant in standard coordinate format (chr:start or chr:start-end)
## Allele : The variant allele used to calculate the consequence
## Gene : Stable ID of affected gene
## Feature : Stable ID of feature
## Feature_type : Type of feature - Transcript, RegulatoryFeature or MotifFeature
## Consequence : Consequence type
## cDNA_position : Relative position of base pair in cDNA sequence
## CDS_position : Relative position of base pair in coding sequence
## Protein_position : Relative position of amino acid in protein
## Amino_acids : Reference and variant amino acids
## Codons : Reference and variant codon sequence
## Existing_variation : Identifier(s) of co-located known variants
## IMPACT : Subjective impact classification of consequence type
## DISTANCE : Shortest distance from variant to transcript
## STRAND : Strand of the feature (1/-1)
## FLAGS : Transcript quality flags
## REFSEQ_MATCH : RefSeq transcript match status
## REFSEQ_OFFSET : HGVS adjustment length required due to mismatch between RefSeq transcript and the reference genome
## SOURCE : Source of transcript
## TTRdb : /data/TTRdb_curated.vcf.gz (exact)
## TTRdb_REVEL : REVEL field from /data/TTRdb_curated.vcf.gz
## TTRdb_REVEL_TTMDB : REVEL_TTMDB field from /data/TTRdb_curated.vcf.gz
## TTRdb_REVEL_RISK : REVEL_RISK field from /data/TTRdb_curated.vcf.gz
#Uploaded_variation	Location	Allele	Gene	Feature	Feature_type	Consequence	cDNA_position	CDS_position	Protein_position	Amino_acids	Codons	Existing_variation	IMPACT	DISTANCE	STRAND	FLAGS	REFSEQ_MATCH	REFSEQ_OFFSET	SOURCE	TTRdb	TTRdb_REVEL	TTRdb_REVEL_TTMDB	TTRdb_REVEL_RISK
18_29172865_G/A	18:29172865	A	7276	NM_000371.4	Transcript	missense_variant	102	726	G/S	Ggt/Agt	-	MODERATE	-	1	-	-	-	-	NM_000371.4:c.76G>A	BENIGN	0.174	VERY LOW
```

# Resultado

| **Campos**          | **Valores**         |
| ------------------- | ------------------- |
| #Uploaded_variation | 18_29172865_G/A     |
| Location            | 18:29172865         |
| Allele              | A                   |
| Gene                | 7276                |
| Feature             | NM_000371.4         |
| Feature_type        | Transcript          |
| Consequence         | missense_variant    |
| cDNA_position       | 102                 |
| CDS_position        | 76                  |
| Protein_position    | 26                  |
| Amino_acids         | G/S                 |
| Codons              | Ggt/Agt             |
| Existing_variation  | -                   |
| IMPACT              | MODERATE            |
| DISTANCE            | -                   |
| STRAND              | 1                   |
| FLAGS               | -                   |
| REFSEQ_MATCH        | -                   |
| REFSEQ_OFFSET       | -                   |
| SOURCE              | -                   |
| TTRdb               | NM_000371.4:c.76G>A |
| TTRdb_REVEL         | BENIGN              |
| TTRdb_REVEL_TTMDB   | 0.174               |
| TTRdb_REVEL_RISK    | VERY LOW            |


# Risco - score e classificação

| **RISK (valores)** | **RISK (descrição)** |
| -------------- | ---------------- |
| <=0.559        | VERY LOW         |
| 0.559          | LOW              |
| >=0.711        | MODERATE         |
| >=0.929        | HIGH             |

# TTRdb - VCF formato

| **Colunas**                      | **Valores**                                         |
| -------------------------------- | --------------------------------------------------- |
| CHROM                            | 18                                                  |
| POS                              | 29172877                                            |
| ID                               | NM_000371.4:c.88T>C                                 |
| REF                              | T                                                   |
| ALT                              | C                                                   |
| HGVSC                            | NM_000371.4:c.88T>C                                 |
| HGVSP                            | NP_000362.1:p.Cys30Arg                              |
| AACHANGE                         | Cys10Arg (p.Cys30Arg)                               |
| VARIANT                          | c.88T>C                                             |
| EXON                             | Exon 2                                              |
| PHENOTYPE                        | AN, E, H, PN                                        |
| ETHNIC GROUP                     | American (Hungarian)                                |
| REFERENCE                        | Uemichi (1992) J Med Genet 29, 888                  |
| IMUTANT3                         | Destabilizing                                       |
| STRUM                            | Destabilizing                                       |
| ISTABLE                          | Destabilizing                                       |
| PROVEAN                          | Deleterious                                         |
| PREDICTSNP                       | Deleterious                                         |
| PHD-SNP                          | Deleterious                                         |
| POLYPHEN-2                       | Deleterious                                         |
| SIFT                             | Deleterious                                         |
| FATHMM                           | Damaging                                            |
| MCSM                             | Stabilizing                                         |
| SDM                              | Destabilizing                                       |
| DUET                             | Stabilizing                                         |
| DYNAMUT                          | Destabilizing                                       |
| CUPSAT                           | Destabilizing                                       |
| ENCOM                            | Destabilizing                                       |
| FOLDX_PROTEIN_STABILITY          | No effect                                           |
| TANGO_AGGREGATION_TENDENCY       | No effect                                           |
| WALTZ_AMYLOID_PROPENSITY         | No effect                                           |
| LIMBO_CHAPERONE_BINDING_TENDENCY | No effect                                           |
| REVEL                            | PATHOGENIC                                          |
| CLINVAR                          | Pathogenic/Likely pathogenic/Uncertain Significance |
| SEQUENCE_DESTABILIZING           | 3                                                   |
| SEQUENCE_DELETERIOUS             | 6                                                   |
| STRUCTURE                        | 4                                                   |
| AGGREGATION                      | 0                                                   |
| SCORE_RISK_TTMDB                 | MODERATE                                            |
| REVEL_TTMDB                      | 0.898                                               |
| START_SYMPTOMS_MIN               | 63                                                  |
| START_SYMPTOMS_MAX               | 68                                                  |
| REVEL_RISK                       | MODERATE                                            |
