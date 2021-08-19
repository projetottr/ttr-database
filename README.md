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


# Anotando com VEP ensembl


```bash
docker run -it -v $(pwd):/data  ensemblorg/ensembl-vep ./vep --id "18 29172865 29172865 G/A 1" --species homo_sapiens -o /data/output.txt --database --assembly GRCh37 --refseq --tab --custom /data/TTRdb_cureted.sort.vcf.gz,TTRdb,vcf,exact,0,REVEL --tab --force
```


