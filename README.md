# E-Andifes

Solução 3

[![Abrir no draw.io](https://img.shields.io/badge/abrir-abrir?logo=diagramsdotnet&label=draw.io&link=https%3A%2F%2Fapp.diagrams.net%2F%23Uhttps%3A%2F%2Fraw.githubusercontent.com%2FAlynva%2Frede-andifes-isf%2Fmain%2FProjeto%2520e%2520Implementa%25C3%25A7%25C3%25A3o%2520de%2520Banco%2520de%2520Dados.drawio)
](https://app.diagrams.net/#Uhttps://raw.githubusercontent.com/Alynva/rede-andifes-isf/main/Projeto%20e%20Implementa%C3%A7%C3%A3o%20de%20Banco%20de%20Dados.drawio)

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

## Como visualizar o gráfico do banco de dados

### Linux

Execute em seu terminal:

```bash
./diagram.sh
```

Em seguida, abra o endereço http://localhost:8000 no seu navegador.

### Windows

Execute em seu PowerShell:

```powershell
.\diagram.ps1 -persistir $true
```

Seu navegador abrirá automaticamente. Se `-persistir` for `$true`, o programa reconstruirá o site automaticamente a cada alguns segundos. Útil se estiver fazendo alterações no banco de dados.