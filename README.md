# E-Andifes

> Trabalho para a disciplina de Projeto e Implementação de Banco de Dados (Grupo 3).

[![Abrir cópia no draw.io](https://img.shields.io/badge/abrir-abrir?logo=diagramsdotnet&label=draw.io&link=https%3A%2F%2Fapp.diagrams.net%2F%23Uhttps%3A%2F%2Fraw.githubusercontent.com%2FAlynva%2Frede-andifes-isf%2Fmain%2FProjeto%2520e%2520Implementa%25C3%25A7%25C3%25A3o%2520de%2520Banco%2520de%2520Dados.drawio)
](https://app.diagrams.net/#Uhttps://raw.githubusercontent.com/Lvght/e-andifes/main/der/Projeto%20e%20Implementa%C3%A7%C3%A3o%20de%20Banco%20de%20Dados.drawio)

## Como subir o ambiente de desenvolvimento?

Execute em seu terminal:

```bash
docker compose down -v && docker compose up
```

## Como adicionar novos artefatos?

Dentro de `database/sql`, há várias pastas e, em cada uma, um arquivo chamado `__create__`. Você deve adicionar à pasta correspondente o arquivo `.sql` e então mencionar o nome dele no arquivo create **na ordem em que o artefato deve ser criado**.

## Como adicionar novos dados?

Você pode adicionar dados de teste manualmente, mas é recomendado que você faça isso usando nosso mecanismo de *seeding*. Se optar por inserir manualmente, irá perder seus dados ao reconstruir o banco, operação comum durante o desenvolvimento.

Portanto, a maneira recomendada é inserir os dados criando um arquivo `nome_da_tabela.php` na pasta `interface/seed` e então mencionar o `nome_da_tabela` no arquivo `interface/seed/__create__.php`.

## Como visualizar o gráfico do banco de dados

Com o banco de dados em execução, rode os seguintes comandos:

### Linux

Execute em seu terminal:

```bash
./scripts/diagram.sh
```

Em seguida, abra o endereço http://localhost:8000 no seu navegador.

### Windows

Execute em seu PowerShell:

```powershell
.\scripts\diagram.ps1 -persistir $true
```

Seu navegador abrirá automaticamente. Se `-persistir` for `$true`, o programa reconstruirá o site automaticamente a cada alguns segundos. Útil se estiver fazendo alterações no banco de dados.
