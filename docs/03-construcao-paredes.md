# Construção das Paredes de Blocos

## 1. Objetivo

Este documento descreve a estratégia para projetar e implementar as paredes de blocos do jogo **Brick Breaker**. A parede representa o conjunto de obstáculos localizado na parte superior da área de jogo e é um dos principais elementos da mecânica do jogo.

O projeto deve conter pelo menos cinco níveis distintos, com configurações diferentes para cada parede. Essas paredes podem ser definidas manualmente ou geradas com algum grau de aleatoriedade, desde que mantenham uma estrutura jogável.

A abordagem adotada é representar cada parede por meio de uma matriz bidimensional, em que cada célula indica se há ou não um bloco naquela posição.

---

## 2. Representação da parede

A parede será modelada como uma matriz composta por linhas e colunas.

Cada célula pode assumir dois valores:

- `1` — existe um bloco;
- `0` — a posição está vazia.

Essa estrutura facilita a criação de diferentes layouts, pois a alteração da matriz muda diretamente a disposição visual dos blocos.

### Exemplo de matriz preenchida

```text
1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1
```

### Exemplo de matriz parcialmente preenchida

```text
1 1 1 0 1 1 1 1 1 1
1 1 0 1 1 1 1 0 1 1
1 1 1 1 1 0 1 1 1 1
1 0 1 1 1 1 1 1 0 1
```

Os valores `0` representam espaços vazios dentro da parede.

---

## 3. Organização espacial dos blocos

A posição de cada bloco será determinada pela sua linha e coluna na matriz.

Considerando:

- `linha` = posição vertical;
- `coluna` = posição horizontal;
- `larguraBloco` = largura do bloco;
- `alturaBloco` = altura do bloco;
- `espacamento` = distância entre blocos.

A coordenada horizontal pode ser calculada por:

```text
x = margemHorizontal + coluna × (larguraBloco + espacamento)
```

A coordenada vertical pode ser calculada por:

```text
y = margemSuperior + linha × (alturaBloco + espacamento)
```

Com isso, a matriz não precisa armazenar coordenadas individuais; elas são derivadas automaticamente a partir da posição da célula. Essa abordagem também permite alterar o tamanho dos blocos sem reconstruir manualmente cada nível.

---

## 4. Definição dos níveis

Cada nível do jogo usará uma configuração diferente de parede. A proposta inicial é a seguinte:

| Nível | Estratégia                    | Preenchimento aproximado |
| ----- | ----------------------------- | -----------------------: |
| 1     | Parede completa               |                     100% |
| 2     | Poucos espaços vazios         |                      90% |
| 3     | Distribuição intermediária    |                      75% |
| 4     | Maior quantidade de lacunas   |                      60% |
| 5     | Parede mais aberta e variável |                      50% |

Esses percentuais são referências de projeto e podem ser ajustados durante os testes de jogabilidade.

### Nível 1 — Parede completa

```text
1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1
```

### Nível 2 — Pequenos espaços vazios

```text
1 1 1 1 1 1 1 1 1 1
1 1 1 0 1 1 1 1 1 1
1 1 1 1 1 1 0 1 1 1
1 1 0 1 1 1 1 1 1 1
```

### Nível 3 — Distribuição intermediária

```text
1 1 0 1 1 1 1 0 1 1
1 0 1 1 1 0 1 1 1 1
1 1 1 0 1 1 1 1 0 1
0 1 1 1 1 1 0 1 1 1
```

### Nível 4 — Maior quantidade de lacunas

```text
1 1 0 1 1 0 1 1 0 1
1 0 1 1 0 1 1 0 1 1
1 1 1 0 1 1 0 1 1 0
0 1 1 1 1 0 1 1 1 1
```

### Nível 5 — Parede mais aleatória

```text
1 0 1 1 0 1 0 1 1 0
1 1 0 0 1 1 1 0 1 1
0 1 1 0 1 0 1 1 0 1
1 0 1 1 1 1 0 1 0 1
```

Esses exemplos ilustram a variação de padrões que cada nível pode apresentar.

---

## 5. Geração das paredes

O sistema pode trabalhar com dois tipos de parede:

### 5.1 Paredes fixas

A matriz de cada nível é definida diretamente no código. Essa abordagem garante que cada partida de um mesmo nível tenha a mesma estrutura.

Exemplo:

```text
nivel1 = [
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1]
]
```

### 5.2 Paredes geradas aleatoriamente

A aplicação também pode gerar a matriz de forma automática. Para cada célula, um valor aleatório determina se a posição receberá um bloco ou permanecerá vazia.

Exemplo conceitual:

```text
percentualPreenchimento = 0.75
```

Para cada célula:

```text
if numeroAleatorio <= 0.75:
    célula = 1
else:
    célula = 0
```

Essa estratégia gera paredes diferentes, mantendo o percentual de preenchimento definido.

### 5.3 Validação da geração

Para evitar níveis inviáveis, o sistema pode verificar:

1. se há pelo menos uma quantidade mínima de blocos;
2. se não existem linhas completamente vazias, quando isso não for desejado;
3. se a distribuição visual é adequada;
4. se a configuração não prejudica a jogabilidade.

---

## 6. Criação dos objetos de bloco

Depois que a matriz estiver definida, a aplicação percorre todas as células e cria um bloco somente quando o valor for `1`.

O processo é:

```text
Percorrer linha
Percorrer coluna
Verificar valor da célula
Se valor == 1:
    criar bloco
    calcular posição
    adicionar à parede
```

Cada bloco deve armazenar ou disponibilizar informações necessárias para a colisão, como:

- posição;
- largura;
- altura;
- estado ativo/inativo;
- aparência;
- identificação do nível.

---

## 7. Cores, tamanho e adaptação à tela

### Cores

A cor dos blocos pode ser definida por padrão ou por configuração do usuário, por exemplo:

- padrão colorido;
- tons de uma mesma cor;
- padrão personalizado.

### Tamanho

O tamanho dos blocos pode ser ajustado conforme a configuração do aplicativo:

- pequeno;
- médio;
- grande.

Esse ajuste deve refletir no cálculo das posições para manter a parede dentro da área de jogo.

### Responsividade

Como o projeto é voltado para dispositivos móveis, a parede deve ser dimensionada de forma responsiva. O sistema deve evitar que os blocos fiquem fora dos limites da tela, sobreponham o paddle ou interfiram na trajetória da bola.

---

## 8. Destruição dos blocos e progressão do nível

Quando a bola colide com um bloco, o objeto deve ser removido ou marcado como destruído. Após isso, a quantidade de blocos restantes deve ser atualizada e a direção da bola deve ser ajustada.

Se todos os blocos forem destruídos, o sistema deve:

```text
verificar quantidade de blocos restantes
se quantidade == 0:
    nível concluído
    carregar próximo nível
    iniciar nova parede
```

Essa lógica garante a progressão do jogo e a continuidade da partida.

---

## 9. Conclusão

A estratégia adotada para a construção das paredes de blocos consiste em representar a estrutura do nível por meio de uma matriz bidimensional. Essa abordagem permite criar níveis fixos ou aleatórios, controlar a quantidade de blocos, calcular automaticamente suas posições e manter a lógica de colisão e progressão do jogo organizada.

A matriz funciona como a base do projeto: ela define a aparência da parede, enquanto o sistema converte essas informações em objetos visuais do jogo. Dessa forma, a implementação fica mais simples de manter, expandir e ajustar conforme novas regras de design ou jogabilidade forem adicionadas.

- Flutter. **Cookbook**. Documentação oficial do Flutter.  
  https://docs.flutter.dev/cookbook

- Flutter. **Navigation basics**. Documentação oficial do Flutter.  
  https://docs.flutter.dev/cookbook/navigation/navigation-basics

- Flame Engine. **Documentação oficial**.  
  https://docs.flame-engine.org/latest/

- Google Developers. **Flutter Flame Brick Breaker Codelab**.  
  https://codelabs.developers.google.com/codelabs/flutter-flame-brick-breaker
