# Brick Breaker

Aplicativo móvel do jogo **Brick Breaker** (Breakout), desenvolvido para a disciplina **Projeto Integrador VI-A**.

O jogo consiste em controlar uma plataforma (paddle) para rebater uma bola e destruir uma parede de blocos, com progressão entre 5 níveis distintos.

## Equipe

- Ayla Djan Anjos Abreu
- Gabriel Souza
- Julia Brambatti Pereira
- Luís Carlos Gomes Lopes Filho
- Maicon Casagranda Pinto

## Documentação

Toda a documentação do projeto está organizada na pasta [`docs/`](docs/):
 
| Documento | Descrição |
|---|---|
| [01 - Ambiente e Tecnologias](docs/01-ambiente-tecnologias.md) | Ambiente de desenvolvimento, linguagens e ferramentas utilizadas |
| [02 - Wireframes](docs/02-wireframes.md) | Wireframes em alta definição de todas as telas e níveis do jogo |
| [03 - Construção das Paredes](docs/03-construcao-paredes.md) | Estratégia e métodos utilizados para construir as paredes de blocos |
| [04 - Geração do APK](docs/04-geracao-apk.md) | Passo a passo para compilar e gerar o APK de release |
 
## Tecnologias principais

- **Flutter** + **Dart**
- **Flame Engine** (lógica do jogo)
- **Git** / **GitHub** (controle de versão)
  Mais detalhes em [01 - Ambiente e Tecnologias](docs/01-ambiente-tecnologias.md).

## Estrutura do repositório

```
brick-breaker/
│
├── README.md
├── docs/
│   ├── 01-ambiente-tecnologias.md
│   ├── 02-wireframes.md
│   ├── 03-construcao-paredes.md
│   └── 04-geracao-apk.md
├── releases/
│   └── brick-breaker.apk
├── wireframes/
│   ├── tela-inicial.png
│   ├── tela-desenvolvedores.png
│   ├── tela-configuracoes.png
|   ├── tela-sair-jogo.png
│   ├── tela-jogo.png
│   ├── nivel-01.png
│   ├── nivel-02.png
│   ├── nivel-03.png
│   ├── nivel-04.png
│   └── nivel-05.png
├── flutter_application/
|   ├── lib/
|        ├── assets/ 
|        │   ├── fonts/
|        │   ├── images/
|        │   ├── sounds/
|        ├── src/
|   ├── android/
|   ├── test/
└── └── pubspec.yaml
```

## Como rodar o projeto

```bash
flutter pub get
flutter run
```
Para instalar o arquivo APK do aplicativo Brick Breaker já em processo final e funcional, clique no link abaixo:

Instalar arquivo APK [brick-breaker.apk](releases/brick-breaker.apk).

Em caso de dúvida siga os passos da documentação abaixo:

Para gerar o APK de release, veja [04 - Geração do APK](docs/04-geracao-apk.md).