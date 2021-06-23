#!/usr/bin/env bash
set -e
DIRECTORY=./src/environments/secret
#diretorio padrão que será gerado o arquivo
FILE_SECRET_SEED="$DIRECTORY/secret.seed.ts"
#garantindo que o diretório necessário exit no projeto
if ! mkdir -p $DIRECTORY; then
  echo "#========================================>Não foi possível criar o diretorio da seed!";
  exit 1;
else
  echo "#========================================>Diretorio da seed criado com sucesso!";
fi;
#gerando a seed
GENERATED_SECRET=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1);
#gerando um novo arquivo 'secret.seed.ts'
echo "export const SECRET_SEED: string = \"$GENERATED_SECRET\";" > $FILE_SECRET_SEED
echo "#========================================>Nova seed foi gerada com sucesso para o projeto!";
exit 0
