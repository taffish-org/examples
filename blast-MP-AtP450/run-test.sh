#!/bin/sh

set -e
echo "[Start] $(date)"

taf-blast-v2.16.0 --cmd blastp --in Marchantia_polymorpha.MpTak1_v7.1.pep.all.fasta --dbin AtP450PROT.fasta
cd blast-out
cut -f 1 out.blastp_matches_my-blast-db.txt | sort | uniq > id.out.blastp_matches_my-blast-db.txt

echo '(Expect):'
echo '   34858 out.blastp_matches_my-blast-db.txt'
echo '     159 id.out.blastp_matches_my-blast-db.txt'

echo '(Results):'
wc -l out.blastp_matches_my-blast-db.txt
wc -l id.out.blastp_matches_my-blast-db.txt

echo '(Compare):'
diff -s out.blastp_matches_my-blast-db.txt ../out-debian12-amd64/out.blastp_matches_my-blast-db.txt
diff -s id.out.blastp_matches_my-blast-db.txt ../out-debian12-amd64/id.out.blastp_matches_my-blast-db.txt

echo ''
echo "[End] $(date)"
