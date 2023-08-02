# E-Andifes

Solução 3

## Como subir o ambiente de desenvolvimento?

Execute em seu terminal:

```bash
docker compose up -d
```

No Linux, na primeira execução, é possível que seja necessário criar um diretório para os logs do banco. Faça isso com o comando:

```bash
mkdir logs
chmod 777 logs
```

Para remover o ambiente, execute:

```bash
docker compose down -v
```

## Como adicionar novas tabelas

Adicione os scripts SQL à pasta `sql`. Em seguida, adicione os nomes dos arquivos ao arquivo [__create__.txt](sql/__create__.txt) **na ordem em que devem ser criados**.

Você deve recriar o ambiente de desenvolvimento para que as mudanças nas tabelas tenham efeito.