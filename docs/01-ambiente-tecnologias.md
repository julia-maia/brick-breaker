# Ambiente de Desenvolvimento e Tecnologias

## 1. Introdução

Este documento apresenta a definição do ambiente de desenvolvimento, das tecnologias, das linguagens de programação e das ferramentas utilizadas no desenvolvimento do projeto **Brick Breaker**, elaborado para a disciplina **Projeto Integrador VI-A**.

A escolha das tecnologias foi realizada considerando os requisitos do projeto, especialmente a necessidade de desenvolver uma aplicação para dispositivos móveis, implementar elementos de um jogo 2D, controlar movimentação e colisões, utilizar recursos de áudio e disponibilizar diferentes telas de interação.

A solução adotada busca proporcionar uma estrutura adequada à implementação do jogo, além de favorecer a organização do código, o trabalho colaborativo e a manutenção do projeto.

---

## 2. Ambiente de Desenvolvimento

O desenvolvimento do aplicativo será realizado utilizando o **Flutter**, com a linguagem **Dart**.

O ambiente de desenvolvimento será composto pelas seguintes ferramentas:

| Ferramenta/Tecnologia | Finalidade                                          |
| --------------------- | --------------------------------------------------- |
| Flutter               | Desenvolvimento da aplicação móvel                  |
| Dart                  | Linguagem de programação                            |
| Flame Engine          | Implementação da lógica e dos componentes do jogo   |
| Visual Studio Code    | Edição e organização do código-fonte                |
| Android Studio        | Emulador, SDK Android e ferramentas de compilação   |
| Git                   | Controle de versão                                  |
| GitHub                | Hospedagem do código e desenvolvimento colaborativo |

Além dessas ferramentas, será utilizado um dispositivo Android físico e/ou um emulador Android para execução e validação da aplicação durante o desenvolvimento.

---

## 3. Framework Flutter

O **Flutter** será utilizado como principal framework de desenvolvimento da aplicação.

A escolha do Flutter está relacionada à possibilidade de desenvolver aplicações móveis utilizando uma base de código estruturada em Dart, além de oferecer recursos para construção de interfaces, navegação entre telas e integração com funcionalidades necessárias ao projeto.

No contexto deste trabalho, o Flutter será responsável principalmente por:

- estruturar a aplicação;
- criar as telas do sistema;
- realizar a navegação entre as telas;
- gerenciar as configurações do usuário;
- organizar os componentes da aplicação;
- integrar a camada do jogo à aplicação móvel;
- permitir a geração da aplicação para Android.

---

## 4. Linguagem de Programação

A linguagem escolhida para o desenvolvimento é a **Dart**, utilizada pelo Flutter.

A Dart será utilizada para implementar:

- regras de negócio;
- navegação;
- configurações;
- gerenciamento dos níveis;
- construção das paredes de blocos;
- movimentação dos elementos do jogo;
- controle das colisões;
- reprodução dos efeitos sonoros;
- fluxo de vitória e derrota;
- integração entre os componentes da aplicação.

A organização do código deverá priorizar separação de responsabilidades, reutilização de componentes e facilidade de manutenção.

---

## 5. Flame Engine

Para a implementação dos elementos específicos do jogo será utilizada a **Flame Engine**.

A Flame é uma engine voltada ao desenvolvimento de jogos utilizando Flutter e Dart. Neste projeto, sua utilização será direcionada principalmente ao gerenciamento da área de jogo e dos componentes responsáveis pela mecânica do Brick Breaker.

Entre os recursos que poderão ser utilizados estão:

- área de jogo;
- componente da bola;
- componente do paddle;
- componentes dos blocos;
- movimentação;
- detecção e tratamento de colisões;
- atualização do estado do jogo;
- controle do ciclo de execução;
- reprodução e gerenciamento de recursos utilizados durante o jogo.

A utilização da Flame permite separar a lógica específica do jogo da estrutura convencional das telas da aplicação.

---

## 6. Estrutura geral da aplicação

A aplicação será organizada em duas partes principais.

### 6.1. Interface da aplicação

A interface será responsável pelas telas convencionais do aplicativo, como:

- tela inicial;
- tela de integrantes;
- tela de configurações;
- telas e diálogos relacionados ao fluxo do jogo.

### 6.2. Área de jogo

A área de jogo será responsável pelos elementos e regras do Brick Breaker, incluindo:

- bola;
- paddle;
- blocos;
- paredes;
- colisões;
- controle dos níveis;
- condições de vitória e derrota;
- efeitos sonoros.

A separação entre essas responsabilidades tem como objetivo facilitar a manutenção do projeto e tornar o código mais organizado.

---

## 7. Navegação entre as telas

A aplicação deverá possuir uma navegação coerente entre suas funcionalidades.

A tela inicial deverá apresentar três opções principais:

1. **Integrantes** — apresenta o nome e o sobrenome dos membros da equipe;
2. **Iniciar Jogo** — inicia o primeiro nível;
3. **Configurações** — permite selecionar opções de cores e tamanhos dos blocos.

O fluxo principal poderá ser representado da seguinte maneira:

```text
                    Tela Inicial
                         |
          +--------------+--------------+
          |              |              |
          v              v              v
     Integrantes      Iniciar       Configurações
                         |              |
                         v              v
                      Nível 1       Ajustes
                         |
                         v
                      Nível 2
                         |
                         v
                      Nível 3
                         |
                         v
                      Nível 4
                         |
                         v
                      Nível 5
```

A navegação deverá permitir retorno às telas anteriores quando aplicável e respeitar o fluxo definido nos wireframes do projeto.

---

## 8. Controle de versão

O desenvolvimento será realizado utilizando **Git**, com o código hospedado em um **repositório público no GitHub**.

Todos os integrantes do grupo deverão possuir acesso ao repositório e participar do processo de desenvolvimento.

O controle de versão permitirá:

- registrar as alterações realizadas;
- acompanhar a evolução do projeto;
- identificar o responsável por cada modificação;
- recuperar versões anteriores;
- facilitar o trabalho simultâneo dos integrantes;
- documentar o processo de desenvolvimento.

---

## 9. Boas práticas de commits

Serão utilizados **commits incrementais**, evitando concentrar grandes quantidades de alterações em um único registro.

Sempre que possível, os commits seguirão a convenção **Conventional Commits**.

Exemplos:

```text
feat: cria estrutura inicial do aplicativo
feat: adiciona tela inicial
feat: adiciona tela de integrantes
feat: implementa tela de configuracoes
feat: adiciona componente da bola
feat: adiciona movimentacao do paddle
feat: implementa colisao entre bola e blocos
feat: adiciona nivel 1
feat: implementa geracao aleatoria das paredes
fix: corrige colisao com paddle
fix: ajusta posicionamento dos blocos
docs: adiciona documentacao dos wireframes
docs: documenta construcao das paredes
```

Essa organização contribui para a rastreabilidade das alterações e para a identificação das etapas do projeto.

---

## 10. Organização do repositório

A estrutura do repositório deverá separar código-fonte, documentação e recursos do projeto.

Uma estrutura recomendada é:

```text
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
├── pubspec.yaml
└── README.md
```

A organização exata poderá ser ajustada de acordo com a estrutura efetivamente utilizada durante o desenvolvimento.

---

## 11. Recursos utilizados no aplicativo

O aplicativo deverá utilizar recursos gráficos e sonoros necessários à execução do jogo.

### Recursos visuais

- imagem ou identidade visual do jogo;
- componentes da interface;
- blocos;
- bola;
- paddle;
- elementos de navegação.

### Recursos de áudio

De acordo com os requisitos do projeto, deverão existir pelo menos:

- um som associado ao início da fase;
- um som associado à colisão da bola com o paddle.

Os arquivos de áudio deverão ser armazenados nos diretórios de recursos do projeto e registrados adequadamente na configuração do aplicativo.

---

## 12. Configuração de cores e tamanhos

O aplicativo deverá oferecer ao usuário uma tela de configurações, conforme especificado no enunciado.

Nessa tela será possível selecionar:

- padrão de cores dos blocos;
- tamanho dos blocos.

As configurações deverão ser utilizadas posteriormente durante a construção da parede.

O sistema deverá garantir que a combinação escolhida continue adequada à área disponível da tela.

---

## 13. Compatibilidade com dispositivos móveis

Como o projeto será executado em dispositivos móveis, serão considerados aspectos relacionados às diferentes dimensões de tela.

A aplicação deverá buscar:

- ocupar a maior parte possível da área disponível;
- manter os elementos principais dentro dos limites da tela;
- adaptar o posicionamento dos blocos;
- evitar cortes ou sobreposição dos componentes;
- preservar a área de movimentação do paddle e da bola.

Durante os testes, serão verificadas diferentes resoluções e tamanhos de tela disponíveis no ambiente de desenvolvimento.

---

## 14. Testes durante o desenvolvimento

Os testes serão executados de forma incremental ao longo da implementação.

### Interface

- carregamento da tela inicial;
- navegação para a tela de integrantes;
- navegação para as configurações;
- retorno entre telas;
- apresentação correta dos componentes.

### Jogo

- movimentação do paddle;
- movimentação da bola;
- colisão com as paredes;
- colisão com o paddle;
- colisão com os blocos;
- destruição dos blocos;
- progressão para o próximo nível;
- reinício do nível;
- comportamento após perda da bola.

### Configurações

- alteração do padrão de cores;
- alteração do tamanho dos blocos;
- aplicação das configurações na parede.

### Áudio

- reprodução do som no início da fase;
- reprodução do som durante a colisão com o paddle.

---

## 15. Relação entre as tecnologias e os requisitos

A escolha tecnológica está diretamente relacionada aos requisitos do projeto:

| Requisito                    | Tecnologia/Solução                |
| ---------------------------- | --------------------------------- |
| Aplicação móvel              | Flutter                           |
| Linguagem                    | Dart                              |
| Jogo 2D                      | Flame Engine                      |
| Navegação entre telas        | Flutter                           |
| Blocos e níveis              | Dart + Flame                      |
| Colisões                     | Flame                             |
| Efeitos sonoros              | Recursos de áudio + Flame/Flutter |
| Configurações                | Flutter + Dart                    |
| Controle de versão           | Git                               |
| Desenvolvimento colaborativo | GitHub                            |
| Geração para Android         | Flutter + Android SDK             |

---

## 16. Justificativa da escolha tecnológica

A combinação de **Flutter, Dart e Flame** foi escolhida por atender de forma integrada às necessidades do projeto.

O Flutter fornece a base para a construção da aplicação móvel e das telas convencionais, enquanto a Flame oferece recursos mais adequados à implementação da dinâmica de um jogo 2D.

A utilização do Git e do GitHub complementa o ambiente tecnológico ao fornecer controle de versão e permitir que todos os integrantes trabalhem sobre o mesmo projeto.

Essa combinação proporciona uma estrutura adequada para implementar os requisitos definidos para o Brick Breaker, mantendo o projeto organizado e possibilitando a geração do aplicativo Android para entrega.

---

## 17. Considerações finais

O ambiente definido para o desenvolvimento do projeto é composto por **Flutter e Dart**, utilizando a **Flame Engine** para os elementos específicos do jogo, **Visual Studio Code** e **Android Studio** como ferramentas de desenvolvimento e teste, e **Git/GitHub** para controle de versão e colaboração.

A solução foi estruturada considerando os requisitos do Projeto Integrador VI-A e contempla a criação das telas, o desenvolvimento do jogo, o gerenciamento dos níveis, a construção das paredes de blocos, o tratamento das colisões, os efeitos sonoros e a geração do aplicativo Android.

Ao final do processo, será disponibilizado um APK de release correspondente à versão final do projeto, juntamente com o repositório público do GitHub e a documentação em arquivos Markdown.

---

## 18. Referências

- Flutter. **Cookbook**. Documentação oficial.  
  https://docs.flutter.dev/cookbook

- Flutter. **Navigation basics**. Documentação oficial.  
  https://docs.flutter.dev/cookbook/navigation/navigation-basics

- Flame Engine. **Documentação oficial**.  
  https://docs.flame-engine.org/latest/

- Google Developers. **Flutter Flame Brick Breaker Codelab**.  
  https://codelabs.developers.google.com/codelabs/flutter-flame-brick-breaker
