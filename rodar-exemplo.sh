docker run -it -v $(pwd):/data  ensemblorg/ensembl-vep ./vep --id "18 29172865 29172865 G/A 1" --species homo_sapiens --force  --database --assembly GRCh37 --refseq --tab --custom /data/TTRdb_curated.vcf.gz,TTRdb,vcf,exact,0,REVEL,REVEL_TTMDB,REVEL_RISK -o /data/TTRdb_output.txt

