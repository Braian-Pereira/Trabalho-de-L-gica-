Sistema de Indicação de Animais para Adoção (Prolog)
Projeto avaliativo da disciplina Lógica para Ciências da Computação.
Descrição
O sistema recomenda animais disponíveis para adoção de acordo com o perfil do interessado (espaço disponível, tempo livre, experiência, crianças, alergia e outros animais em casa) e as características do animal (porte, energia, idade, saúde e convivência).
A recomendação é feita por regras lógicas: um animal só é indicado se todas as condições de compatibilidade forem verdadeiras. Também é possível pedir a explicação de por que um animal não foi indicado.
Como executar
Requer SWI-Prolog.
swipl adocao_animais.pl
?- demo.                        % roda todas as consultas de exemplo
?- adocao_recomendada(A, ana).  % consulta individual
Estrutura do código (adocao_animais.pl)
Base de conhecimento – animais: animal/5, temperamento/2, vacinado/1, castrado/1, adotado/1, convive_bem_com/2, hipoalergenico/1, necessita_cuidado_especial/1.
Base de conhecimento – interessados: interessado/1, espaco/2, tempo_livre/2, experiencia/2, tem_criancas/1, tem_outros_animais/1, alergico/1, prefere_especie/2, prefere_faixa/2.
Regras lógicas (veja abaixo).
Predicados de consulta: ranking/2, prontos_da_especie/2, prontos_da_faixa/2, prontos_com_temperamento/2, quem_pode_adotar/2, motivos/3.
Demonstração: demo/0.
Regras principais
Regra
O que faz
faixa_etaria/2
Classifica o animal em filhote (< 1 ano), adulto (1 a 7) ou idoso (≥ 8).
pronto_para_adocao/1
Animal não adotado, vacinado e castrado.
porte_compativel/2
O porte do animal cabe no espaço da pessoa.
energia_compativel/2
Quanto mais energia o animal tem, mais tempo livre é exigido.
compativel_criancas/2
Se há crianças em casa, o animal precisa conviver bem com elas.
compativel_outros_animais/2
Se há outros animais em casa, o animal precisa conviver bem com eles.
compativel_alergia/2
Pessoa alérgica só pode adotar animal hipoalergênico.
compativel_experiencia/2
Animais com cuidados especiais exigem tutor experiente.
adocao_recomendada/2
Regra principal: combina todas as anteriores.
pontuacao/3
Afinidade: +2 para a espécie preferida, +1 para a faixa etária preferida.
motivo_incompatibilidade/3
Explica por que um animal não é indicado a uma pessoa.
Exemplos de consultas
1. Quais animais são recomendados para a Ana?
?- adocao_recomendada(A, ana).
A = bolinha ;
A = nina ;
A = luna.
2. Ranking de afinidade para a Ana (prefere gatos adultos)
?- ranking(ana, R).
R = [3-luna, 1-bolinha, 0-nina].
3. Gatos prontos para adoção
?- prontos_da_especie(gato, L).
L = [luna, simba, branca].
(A gata mia não aparece porque ainda não foi castrada.)
4. Animais idosos prontos para adoção
?- prontos_da_faixa(idoso, L).
L = [thor, nina, branca].
5. Por que o Thor não é indicado para a Ana?
?- motivos(thor, ana, M).
M = ['porte maior que o espaco disponivel', 'exige tutor experiente'].
6. Quem pode adotar o Thor?
?- quem_pode_adotar(thor, P).
P = [bruno].
7. Ranking para a Carla (alérgica e com outros animais em casa)
?- ranking(carla, R).
R = [3-bolinha, 2-nina].
8. Animais carinhosos prontos para adoção
?- prontos_com_temperamento(carinhoso, L).
L = [mel, thor, bolinha, nina, luna, branca].
Saída de ?- demo.
--- Consulta 1: animais recomendados para ana ---
  [bolinha,nina,luna]

--- Consulta 2: ranking de afinidade para ana ---
  luna (3 pontos)
  bolinha (1 pontos)
  nina (0 pontos)

--- Consulta 3: gatos prontos para adocao ---
  [luna,simba,branca]

--- Consulta 4: animais idosos prontos para adocao ---
  [thor,nina,branca]

--- Consulta 5: por que thor nao e indicado para ana? ---
  - porte maior que o espaco disponivel
  - exige tutor experiente

--- Consulta 6: quem pode adotar thor? ---
  [bruno]

--- Consulta 7: ranking de afinidade para carla (alergica) ---
  bolinha (3 pontos)
  nina (2 pontos)

--- Consulta 8: animais carinhosos prontos para adocao ---
  [mel,thor,bolinha,nina,luna,branca]
Autor(es);
 Braian e Tais
