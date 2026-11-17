% Trabalho de Prolog - Adocao de Animais
% Dupla : Braian e Kael
% Contexto entendido pela equipe: dado o perfil de um interessado em adotar um animal, o sistema deve indicar quais animais são adequados para ele, considerando critérios como porte, energia, compatibilidade com crianças. 
% Esse trabalho analisa o perfil do interessado e as características do animal com os seguintes parâmetros em destaque:
% Espaço disponível (define o porte)
% Custo (capacidade financeira para vacinas e cuidados)
% Espécie
% Saúde (se é vacinado)
% Convivência Familiar (compatibilidade com crianças)
% Idade do animal
% Sexo (macho ou fêmea)
% Castração (castrado ou não)
% Temperamento (nível de energia/agitação)
%============================================================================================================================================================================================================================================

% 1. Dados dos interessados : 

%---------- INTERESSADOS ----------

interessado(braian).
interessado(caio).
interessado(pedro).
interessado(felipe).
interessado(kael).

%espaco(pessoa, tamanho) :

espaco(braian,    pequeno).
espaco(caio,  grande).
espaco(pedro,  pequeno).
espaco(felipe, medio).
espaco(kael,  medio).

% tempo_livre(pessoa, tempo) tempo que a pessoa tem para dedicar ao animal:
% pouco, medio ou muito

tempo_livre(braian,    medio).
tempo_livre(caio,  muito).
tempo_livre(pedro,  pouco).
tempo_livre(felipe, medio).
tempo_livre(kael,  muito).

% orcamento(pessoa, valor) : valor que a pessoa tem para gastar com o animal por mês:
% pouco, medio ou muito

orcamento(braian,    medio).
orcamento(caio,  muito).        
orcamento(pedro,  pouco).
orcamento(felipe, medio).
orcamento(kael,  muito).

% tem_criancas(pessoa) : indica se a pessoa tem crianças em casa
tem_criancas(braian).
tem_criancas(caio).

%preferencia(pessoa, especie) : indica a espécie de animal que a pessoa prefere para adoção :

preferencia(braian, cachorro).
preferencia(caio, gato).
preferencia(pedro, cachorro).
preferencia(felipe, coelho).
preferencia(kael,gato).


% 2. Dados dos animais :
%---------- ANIMAIS ----------

especie(ronaldo, cachorro).
especie(carlos, gato).
especie(bolinha, coelho).
especie(sofia, gato).
especie(agata, gato).
especie(zeus, cachorro).
especie(toto, cachorro).
especie(foguinho, cachorro).
especie(mel, cachorro).

% porte(animal, tamanho): Indica o porte do animal.

porte(ronaldo, grande).
porte(carlos, pequeno).
porte(bolinha, pequeno).
porte(sofia, pequeno).
porte(agata, pequeno).
porte(zeus, grande).
porte(toto, medio).
porte(foguinho, medio).
porte(mel, pequeno).

% sexo(animal, sexo): Indica o sexo do animal.

sexo(ronaldo, macho).
sexo(carlos, macho).
sexo(bolinha, femea).
sexo(sofia, femea).
sexo(agata, femea).
sexo(zeus, macho).
sexo(toto, macho).
sexo(foguinho, macho).
sexo(mel, femea).

% idade(animal, idade): Indica a idade do animal em anos.

idade(ronaldo, 5).
idade(carlos, 2).
idade(bolinha, 1).
idade(sofia, 3).
idade(agata, 4).
idade(zeus, 6).
idade(toto, 2).
idade(foguinho, 3).
idade(mel, 3).

% temperamento(animal, nivel): Indica o nível de energia/agitação do animal.

temperamento(ronaldo, alta).
temperamento(carlos, media).
temperamento(bolinha, baixa).
temperamento(sofia, media).
temperamento(agata, baixa).
temperamento(zeus, alta).
temperamento(toto, media).
temperamento(foguinho, media).
temperamento(mel, baixa).

%custo(animal, valor): Indica o nível de custo mensal do animal.
%custo : baixo, medio ou alto

custo(ronaldo, baixo).
custo(carlos, medio).
custo(bolinha, baixo).
custo(sofia, medio).
custo(agata, baixo).
custo(zeus, alto).
custo(toto, medio).
custo(foguinho, medio).
custo(mel, baixo).

% vacinado(animal): indica que o animal esta com as vacinas em dia.

vacinado(ronaldo).
vacinado(carlos).
vacinado(sofia).
vacinado(zeus).
vacinado(toto).
vacinado(foguinho).
vacinado(mel).

% castrado(animal): indica que o animal e castrado.

castrado(ronaldo).
castrado(sofia).
castrado(agata).
castrado(zeus).
castrado(toto).
castrado(mel).

% convive_com_criancas(animal): indica que o animal e compativel com criancas.

convive_com_criancas(carlos).
convive_com_criancas(bolinha).
convive_com_criancas(sofia).
convive_com_criancas(agata).
convive_com_criancas(toto).
convive_com_criancas(foguinho).
convive_com_criancas(mel).

% 3. Regras de compatibilidade

% Espécie: o animal é da espécie que o interessado prefere.
compat_especie(P, A) :- preferencia(P, E), especie(A, E).

% Porte: o porte do animal precisa caber no espaço do interessado
% (espaço pequeno -> animal pequeno; médio -> pequeno ou médio; grande -> qualquer porte).
compat_porte(P, A) :- espaco(P, pequeno), porte(A, pequeno).
compat_porte(P, A) :- espaco(P, medio), (porte(A, pequeno) ; porte(A, medio)).
compat_porte(P, _) :- espaco(P, grande).

% Custo: o custo mensal do animal precisa caber no orçamento do interessado
% (orçamento pouco -> custo baixo; medio -> baixo ou médio; muito -> qualquer custo).
compat_custo(P, A) :- orcamento(P, pouco), custo(A, baixo).
compat_custo(P, A) :- orcamento(P, medio), (custo(A, baixo) ; custo(A, medio)).
compat_custo(P, _) :- orcamento(P, muito).

% Energia: quanto mais agitado o animal, mais tempo livre o interessado precisa ter
% (energia alta -> muito tempo; media -> tempo médio ou muito; baixa -> qualquer tempo).
compat_energia(P, A) :- temperamento(A, alta), tempo_livre(P, muito).
compat_energia(P, A) :- temperamento(A, media), (tempo_livre(P, medio) ; tempo_livre(P, muito)).
compat_energia(_, A) :- temperamento(A, baixa).

% Crianças: se o interessado tem crianças em casa, o animal precisa conviver bem com elas;
% se não tem crianças, essa condição não se aplica.
compat_criancas(P, A) :- tem_criancas(P), convive_com_criancas(A).
compat_criancas(P, _) :- \+ tem_criancas(P).

% 4. Regra principal

% O animal A é adequado ao interessado P quando todas as compatibilidades acima são verdadeiras ao mesmo tempo.
adequado(P, A) :-
    interessado(P),
    compat_especie(P, A),
    compat_porte(P, A),
    compat_custo(P, A),
    compat_energia(P, A),
    compat_criancas(P, A).

% 5. Regras complementares (usam os fatos de vacinação e castração)

% Animal com saúde completa: vacinado e castrado.
saude_completa(A) :- vacinado(A), castrado(A).

% Indicação ideal: adequado ao perfil do interessado E com saúde completa.
indicacao_ideal(P, A) :- adequado(P, A), saude_completa(A).

% Pendências do animal (o que o adotante terá que custear).
% O especie(A, _) liga A a um animal existente antes da negação (\+).
pendencia(A, vacina)    :- especie(A, _), \+ vacinado(A).
pendencia(A, castracao) :- especie(A, _), \+ castrado(A).

% Lista todas as indicações adequadas de um interessado.
recomendar(P, Lista) :- findall(A, adequado(P, A), Lista).

% 6. Consultas de exemplo (com os resultados)

% Quais animais são adequados para o Braian?
% ?- adequado(braian, A).
% A = mel.

% Quais animais são adequados para o Kael? (digitar ; para ver as próximas respostas)
% ?- adequado(kael, A).
% A = carlos ;
% A = sofia ;
% A = agata.

% Todos os animais adequados para o Caio, em lista:
% ?- findall(A, adequado(caio, A), Lista).
% Lista = [carlos, sofia, agata].

% Quais animais são a indicação ideal (adequados + vacinados e castrados) para o Kael?
% ?- indicacao_ideal(kael, A).
% A = sofia.

% Qual a lista de indicações para o Felipe?
% ?- recomendar(felipe, Lista).
% Lista = [bolinha].

% Quais pendências a coelha Bolinha tem?
% ?- pendencia(bolinha, P).
% P = vacina ;
% P = castracao.
