#!/usr/bin/env bash
set -e

#diretorio padrão que será gerado o arquivo
FILE_SECRET_SEED=./src/environments/secret/secret.seed.ts
#é pra gerar uma nova seed?
RENEW_FILE_SECRET_SEED=$1

#o arquivo de secret exist?
if test -f "$FILE_SECRET_SEED"; then
    echo "#========================================>Já existe uma seed para o projeto!";
else
    #se chegou aqui é sinal que não existe
    #gerando a seed
    sh ./_scripts/secret/generate-new-secret-file.sh
    #GENERATED_SECRET=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1);
    #gerando um novo arquivo 'secret.seed.ts'
    #echo "export const SECRET_SEED: string = \"$GENERATED_SECRET\";" > $FILE_SECRET_SEED
    #echo "$FILE_SECRET_SEED GERADO."
fi
exit 0
