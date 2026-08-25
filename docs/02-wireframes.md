# Wireframes das Telas
## 1. Introdução

Este documento apresenta os wireframes das telas do aplicativo **Brick Breaker**. Os wireframes foram elaborados para definir a organização visual da aplicação e o fluxo de navegação entre as funcionalidades disponíveis.
As imagens utilizadas nesta documentação estão armazenadas na pasta [`wireframes/`](../wireframes/). Cada imagem representa uma tela ou um diálogo previsto para o aplicativo.

## 2. Organização da navegação
A tela inicial funciona como ponto de entrada para as demais funcionalidades. A partir dela, o jogador pode iniciar o jogo, consultar os desenvolvedores, alterar as configurações ou sair da aplicação.

O fluxo principal pode ser representado da seguinte maneira:
```text
					Tela inicial
				/        |        |        \
				   v         v        v         v
			  Iniciar   Configurações  Desenvolvedores  Sair
				  |
									v
								Jogo
```
## 3. Tela inicial

A tela inicial apresenta o menu principal do jogo e concentra as opções de navegação. Ela deve disponibilizar os seguintes botões:
| Botão | Função |
| ----- | ------ |
| Iniciar | Inicia uma partida do Brick Breaker. |
| Configurações | Abre a tela de configurações visuais do jogo. |
| Desenvolvedores | Exibe os integrantes responsáveis pelo projeto. |
| Sair | Abre a confirmação para encerrar o jogo. |
![Wireframe da tela inicial](../wireframes/tela-inicial.png)

_Imagem: `wireframes/tela-inicial.png`._
## 4. Tela de configurações

A tela de configurações permite alterar características visuais dos blocos antes ou durante o uso do jogo. Estão previstas as seguintes opções:
- cor dos blocos: cinza ou preto;
- tamanho dos tijolos: pequeno ou grande.

As escolhas realizadas pelo jogador devem ser consideradas na montagem da parede de blocos. O botão de voltar retorna à tela inicial.
![Wireframe da tela de configurações](../wireframes/tela-configuracoes.png)

_Imagem: `wireframes/tela-configuracoes.png`._
## 5. Tela de desenvolvedores

A tela de desenvolvedores apresenta o nome completo dos integrantes responsáveis pelo desenvolvimento do projeto. Essa tela possui um botão de voltar, que direciona o usuário novamente para a tela inicial.
![Wireframe da tela de desenvolvedores](../wireframes/tela-desenvolvedores.png)

_Imagem: `wireframes/tela-desenvolvedores.png`._
## 6. Confirmação para sair do jogo

Ao selecionar a opção **Sair** na tela inicial, o aplicativo exibe uma tela ou diálogo de confirmação. O jogador pode escolher uma das alternativas:
| Opção | Comportamento |
| ----- | ------------- |
| Sim | Encerra o jogo. |
| Não | Cancela a ação e retorna à tela inicial. |

![Wireframe da confirmação para sair do jogo](../wireframes/tela-sair-jogo.png)
_Imagem: `wireframes/tela-sair-jogo.png`._

## 7. Diretrizes de implementação
Durante a implementação, as telas devem respeitar a organização apresentada nos wireframes e manter uma navegação previsível para o usuário. Os botões devem possuir rótulos claros e executar as ações correspondentes, enquanto as configurações selecionadas devem ser preservadas para a montagem visual do jogo.
Os wireframes representam a estrutura inicial da interface. Cores, espaçamentos e dimensões podem ser ajustados durante o desenvolvimento para garantir boa visualização em dispositivos móveis, sem alterar o fluxo definido neste documento.

## 8. Conclusão
Os wireframes definem as telas iniciais, de configurações, de desenvolvedores e de confirmação para sair do jogo. Essa definição serve como referência para a construção da interface no Flutter e para a integração com a área de jogo do **Brick Breaker**.
tela-sair-jogo

Tela de confirmação para sair do jogo. Caso sim, o jogo encerra. Caso não, volta para a tela inifical.

tela-configuracoes

Mostra as configurações disponíveis e editáveis quanto ao design do jogo, incluindo duas opções de cores (cinza ou preto), além do tamanho dos tijolos (pequeno ou grande), variando conforme escolha do jogador.
Possui o botão de voltar que retorna para a tela inicial.

tela-desenvolvedores

Disponibiliza o nome completo dos integrantes que desenvolveram o projeto, possuindo o botão de voltar que retorna para a tela inicial.

tela-inicial

Tela inicial do jogo com os botõs iniciar, configurações, desenvolvedores e sair.
O botão iniciar iniciar o jogo, o configurações vai para a tela-configuracoes, o botão desenvolvedores para a tela-desenvolvedores e o sair para a tela-sair-jogo.