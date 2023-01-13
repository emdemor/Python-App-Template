# Cookiecutter Python App Template

Esse template é um projeto pessoal, que sintetiza e preconfigura as ferramentas que utilizo quando vou construir um app em Python.

--- 

## Requerimentos

Para utilizá-lo, garanta que tenha o `conda` e `pip` instalados e configurados.

--- 

## Instalação

Em primeiro lugar, instale o `cookiecutter` através de:

```bash
pip install -U cookiecutter
```

Gere o projeto com o template do git

```bash
cookiecutter https://github.com/emdemor/python-app-template.git
```

Preencha os metadados do projeto conforme solicitado:

```bash
app_name [Application Name]: MeuApp
app_slug [meuapp]: 
app_version [0.0.0]: 
author_name [A. U. Thor]: 
author_email [author@email.com]: 
description []: Aplicativo para teste
year [2023]: 
```
> :warning: **_ATENÇÃO:_**  Para o versionamento, utilize o formato [MAJOR].[MINOR].[PATCH], padronizado pela [PEP 440](https://peps.python.org/pep-0440).

--- 
 
## Makefile

Deixei algumas regras úteis definidas no Makefile que podem ser úteis no desenvolvimento do projeto

* `make build`: roda os comando para o empacotamento do aplicativo e faz o update do patch da versão
* `release`: faz o empacotamento e faz o update do release
* `pypi`: faz o upload do build de pacote para o PyPI
* `release-up`: faz o update do release
* `patch`: inicia um patch de versão
* `test-build`: empacota e instala localmente
* `doc`: executa o build da documentação
* `clear`: remove os arquivos do build do pacote
* `uninstall`: desinstala localmente o pacote
* `env-create`: criação do embiente conda
* `env-clear`: remoção do ambiente conda

---

## Ambiente virtual

Entre na pasta do projeto e crie o ambiente virtual com

```bash
make env-create
```

Caso você não utilize o conda, pode ser feito com o `virtualenv` também. Independente da ferramenta utilizada, ative o ambiente virtual.

Quando o ambiente no conda não for mais útil, desative o ambiente e rode:

```bash
make env-clear
```

---

## Forma de uso do versionamento

1. Inicie o git para esse projeto

```bash
git init
git add .
git commit -m "init: start project"
```

2. Inicie um patch

```bash
make patch
```

Depois desse comando, verifique que a versão do projeto em `_version.py` mudo de `0.0.0` para `0.0.1dev0`. Isso indica que estamos na versão de major 0, minor 0 e patch 1, no build 0. 

3. Faça os builds de desenvolvimento

Depois disso, crie uma build. **Lembre-se de comitar todas as suas alterações antes**

```bash
make build
```

Esse comando vai executar os seguintes passos:
* mudar a versão de 0.0.1.dev0 para 0.0.1.dev1 e fazer um commit para essa alteração
* empacotar o projeto
* executar a geração da documentação

Você pode testar o funcionamento rodado

```bash
make test-build
```

Cada `make build` que você der, teremos um acréscimo na contagem de builds depois da tag da versão. Por exemplo, fazendo isso agora, a versão passará de `0.0.1.dev1` para `0.0.1.dev2`.

3. Releases

Quando você fechar todo os builds de desenvolvimento para esse patch, é hora de fazer um release local. Para isso, rode:

```bash
make release
```
Esse comando irá realizar as seguintes etapas

* mudar a versão de `0.0.1.dev2` para `0.0.1.rc0`
* comitar a mudança de versão e criar uma git tag `v0.0.1.rc0`
* empacotar o projeto com a versão nova
 
É possível gerar quantos builds forem necessários para a versão em release. Por exemplo, rodando `make build` novamente, a versão passará de `v0.0.1.rc0` para `v0.0.1.rc1`. Quando todas as alterações forem implementadas, rode `make release` outra vez que a versão passará de `v0.0.1.rc5` (por exemplo) para simplesmente `v0.0.1`, que é o build final para esse patch.

> :warning: **_ATENÇÃO:_**  So use o `make release` quando quiser lançar um pré-release (versões com a tag rc) e quando for lançar a versão final.

Quando for implementar novas features, recomece criando um novo patch `v0.0.2.dev0` rodando `make patch`.