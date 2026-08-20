# Brick Breaker
 
Aplicativo móvel do jogo **Brick Breaker** (Breakout), desenvolvido para a disciplina **Projeto Integrador VI-A**.
 
O jogo consiste em controlar uma plataforma (paddle) para rebater uma bola e destruir uma parede de blocos, com progressão entre 5 níveis distintos.
 
## Equipe
 
- Gabriel Souza
- Luís Carlos Gomes Lopes Filho
- Julia Brambatti Pereira
- Maicon Casagranda Pinto
- Ayla Djan Anjos Abreu

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
│   ├── 00-geracao-apk.md
│   ├── 01-ambiente-tecnologias.md
│   ├── 02-wireframes.md
│   └── 03-construcao-paredes.md
├── wireframes/
│   ├── tela-inicial.png
│   ├── tela-integrantes.png
│   ├── tela-configuracoes.png
│   ├── tela-jogo.png
│   ├── nivel-01.png
│   ├── nivel-02.png
│   ├── nivel-03.png
│   ├── nivel-04.png
│   └── nivel-05.png
├── assets/
│   ├── images/
│   └── audio/
├── lib/
├── android/
├── test/
└── pubspec.yaml
```
 
## Como rodar o projeto
 
```bash
flutter pub get
flutter run
```
 
Para gerar o APK de release, veja [04 - Geração do APK](docs/40-geracao-apk.md).