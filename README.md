# Sistema de Indicação de Animais para Adoção (Prolog)

**Dupla:** Braian e Kael  
**Disciplina:** Lógica para Ciências da Computação  
**Linguagem:** Prolog (SWI-Prolog)

---

## 1. Contexto do Projeto

Este projeto é o Projeto Avaliativo desenvolvido para a disciplina de Lógica para Ciências da Computação. O objetivo é desenvolver um sistema em Prolog capaz de representar conhecimentos e responder a consultas com base em fatos e regras lógicas.

O tema escolhido foi o **"Sistema de indicação de animais para adoção"**, que recomenda animais de acordo com o espaço disponível, o perfil e as características do interessado.

## 2. Objetivo do Sistema

Dado o perfil de um interessado em adotar um animal, o sistema indica quais animais cadastrados são **adequados** para ele. Para isso, cruza as informações do interessado com as características de cada animal:

| Perfil do interessado | Característica do animal | O que é verificado |
|---|---|---|
| Espécie preferida | Espécie | O animal é da espécie que a pessoa quer? |
| Espaço disponível | Porte | O animal cabe no espaço da pessoa? |
| Orçamento mensal | Custo mensal | A pessoa consegue arcar com os gastos? |
| Tempo livre | Temperamento (energia) | A pessoa tem tempo para o nível de agitação do animal? |
| Tem crianças em casa | Convive com crianças | O animal é compatível com crianças? |

Um animal só é recomendado se passar por **todos** os critérios.

## 3. Como Executar

1. Instale o [SWI-Prolog](https://www.swi-prolog.org/) (ou use o [SWISH](https://swish.swi-prolog.org/), online, colando o código).
2. No terminal, dentro da pasta do projeto, carregue o arquivo:

```bash
swipl adocao.pl
```

3. Faça as consultas no prompt `?-` (veja a seção 6):

```prolog
?- adequado(caio, A).
```

> Dica: ao receber uma resposta, digite `;` para pedir a próxima solução.

## 4. Base de Conhecimento

### 4.1 Interessados

Fatos usados: `interessado/1`, `espaco/2`, `tempo_livre/2`, `orcamento/2`, `tem_criancas/1` e `preferencia/2`.

| Interessado | Espaço | Tempo livre | Orçamento | Tem crianças | Preferência |
|---|---|---|---|---|---|
| braian | pequeno | medio | medio | sim | cachorro |
| caio | grande | muito | muito | sim | gato |
| pedro | pequeno | pouco | pouco | não | cachorro |
| felipe | medio | medio | medio | não | coelho |
| kael | medio | muito | muito | não | gato |

### 4.2 Animais

Fatos usados: `especie/2`, `porte/2`, `sexo/2`, `idade/2`, `temperamento/2`, `custo/2`, `vacinado/1`, `castrado/1` e `convive_com_criancas/1`.

| Animal | Espécie | Porte | Sexo | Idade (anos) | Temperamento | Custo | Vacinado | Castrado | Convive com crianças |
|---|---|---|---|---|---|---|---|---|---|
| ronaldo | cachorro | grande | macho | 5 | alta | baixo | sim | sim | não |
| carlos | gato | pequeno | macho | 2 | media | medio | sim | não | sim |
| bolinha | coelho | pequeno | femea | 1 | baixa | baixo | não | não | sim |
| sofia | gato | pequeno | femea | 3 | media | medio | sim | sim | sim |
| agata | gato | pequeno | femea | 4 | baixa | baixo | não | sim | sim |
| zeus | cachorro | grande | macho | 6 | alta | alto | sim | sim | não |
| toto | cachorro | medio | macho | 2 | media | medio | sim | sim | sim |
| foguinho | cachorro | medio | macho | 3 | media | medio | sim | não | sim |
| mel | cachorro | pequeno | femea | 3 | baixa | baixo | sim | sim | sim |

## 5. Regras Lógicas

O sistema possui **10 regras**: cinco regras de compatibilidade, uma regra principal que combina todas e quatro regras complementares.

### 5.1 `compat_especie(P, A)`

O animal `A` é da espécie que a pessoa `P` prefere.

```prolog
compat_especie(P, A) :- preferencia(P, E), especie(A, E).
```

### 5.2 `compat_porte(P, A)`

O porte do animal precisa caber no espaço da pessoa.

| Espaço da pessoa | Portes aceitos |
|---|---|
| pequeno | pequeno |
| medio | pequeno ou medio |
| grande | qualquer porte |

### 5.3 `compat_custo(P, A)`

O custo mensal do animal precisa caber no orçamento da pessoa.

| Orçamento da pessoa | Custos aceitos |
|---|---|
| pouco | baixo |
| medio | baixo ou medio |
| muito | qualquer custo |

### 5.4 `compat_energia(P, A)`

O nível de energia do animal precisa ser compatível com o tempo livre da pessoa.

| Temperamento do animal | Condição |
|---|---|
| alta | a pessoa precisa ter tempo livre `muito` |
| media | a pessoa não pode ter tempo livre `pouco` |
| baixa | qualquer pessoa pode adotar |

### 5.5 `compat_criancas(P, A)`

- Se a pessoa **tem crianças**, o animal precisa conviver bem com crianças (`convive_com_criancas/1`).
- Se a pessoa **não tem crianças**, essa condição não é exigida.

### 5.6 `adequado(P, A)` (regra principal)

Um animal `A` é adequado para o interessado `P` quando **todas** as compatibilidades são satisfeitas:

```prolog
adequado(P, A) :-
    interessado(P),
    compat_especie(P, A),
    compat_porte(P, A),
    compat_custo(P, A),
    compat_energia(P, A),
    compat_criancas(P, A).
```

### 5.7 Regras complementares

Quatro regras extras usam os fatos de vacinação e castração e organizam as respostas:

```prolog
saude_completa(A) :- vacinado(A), castrado(A).
indicacao_ideal(P, A) :- adequado(P, A), saude_completa(A).
pendencia(A, vacina)    :- especie(A, _), \+ vacinado(A).
pendencia(A, castracao) :- especie(A, _), \+ castrado(A).
recomendar(P, Lista) :- findall(A, adequado(P, A), Lista).
```

- `saude_completa(A)`: o animal está vacinado e castrado.
- `indicacao_ideal(P, A)`: o animal é adequado para `P` e tem saúde completa.
- `pendencia(A, Tipo)`: o que o adotante terá que custear (`vacina` ou `castracao`).
- `recomendar(P, Lista)`: lista todos os animais adequados para `P`.

## 6. Consultas de Exemplo

### Consulta 1: animais adequados para o Caio

```prolog
?- adequado(caio, A).
```

**Resultado:** `A = carlos ; A = sofia ; A = agata`

O Caio tem espaço grande, muito tempo, muito orçamento e crianças. Os três gatos cadastrados são compatíveis com crianças, então todos são indicados.

### Consulta 2: animais adequados para o Kael

```prolog
?- adequado(kael, A).
```

**Resultado:** `A = carlos ; A = sofia ; A = agata`

O Kael tem espaço médio e os gatos são de porte pequeno. Como tem muito tempo e muito orçamento, todos os gatos servem.

### Consulta 3: animais adequados para o Felipe

```prolog
?- adequado(felipe, A).
```

**Resultado:** `A = bolinha`

O Felipe prefere coelho e só existe um coelho cadastrado. Ele tem espaço médio, orçamento médio e não tem crianças, então a Bolinha é compatível.

### Consulta 4: animais adequados para o Braian

```prolog
?- adequado(braian, A).
```

**Resultado:** `A = mel`

O Braian prefere cachorro e tem espaço pequeno, então só serve um cachorro de porte pequeno. A Mel é a única, e também é compatível com o orçamento, o tempo livre e as crianças. O Pedro, que também prefere cachorro e tem espaço pequeno, recebe a Mel da mesma forma.

### Consulta 5: quais interessados podem adotar a Sofia?

```prolog
?- adequado(P, sofia).
```

**Resultado:** `P = caio ; P = kael`

A consulta também funciona "ao contrário": em vez de perguntar o animal para uma pessoa, perguntamos quais pessoas combinam com um animal.

### Consulta 6: lista com todos os animais adequados (findall)

```prolog
?- findall(A, adequado(caio, A), Lista).
```

**Resultado:** `Lista = [carlos, sofia, agata]`

### Consulta 7: combinando a regra com outros fatos (animal vacinado e castrado)

```prolog
?- adequado(kael, A), vacinado(A), castrado(A).
```

**Resultado:** `A = sofia`

Entre os gatos adequados para o Kael, só a Sofia é vacinada **e** castrada.

### Consulta 8: quais interessados têm pelo menos um animal adequado?

```prolog
?- setof(P, A^adequado(P, A), Lista).
```

**Resultado:** `Lista = [braian, caio, felipe, kael, pedro]`

### Consulta 9: verificando uma compatibilidade específica

```prolog
?- compat_criancas(braian, ronaldo).
```

**Resultado:** `false`

O Braian tem crianças em casa e o Ronaldo não convive bem com crianças.
