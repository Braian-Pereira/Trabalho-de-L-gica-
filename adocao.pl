%% Trabalho de Prolog - Adocao de Animais
%5 Dupla : Braian e Kael
%%Contexto entendido pela equipe: dado o perfil de um interessado em adotar um animal, o sistema deve indicar quais animais são adequados para ele, considerando critérios como porte, energia, compatibilidade com crianças. 
%%Esse trabalho analisa o perfil do interessado e as características do animal com os seguintes parâmetros em destaque:
%%Moradia (define o porte)
%%Custo (capacidade financeira para vacinas e cuidados)
%%Espécie
%%Saúde (se é vacinado)
%%Convivência Familiar (compatibilidade com crianças)
%%Tempo de vida do animal
%%Sexo (macho ou fêmea)
%%Castração (castrado ou não)
%%emperamento (nível de energia/agitação)
%============================================================================================================================================================================================================================================

%% 1. Dados dos interessados : 

%---------- INTERESSADOS ----------

interessado(braian).
interessado(caio).
interessado(pedro).
interessado(felipe).
interessado(kael).

% moradia(pessoa, tipo) :

moradia(braian,    apartamento).
moradia(caio,  casa_com_quintal).
moradia(pedro,  apartamento).
moradia(felipe, casa).
moradia(kael,  apartamento).

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

% orcamento(pessoa, valor) : valor que a pessoa tem para gastar com o animalpor mês:
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


%% 2. Dados dos animais :
%---------- ANIMAIS ----------

especie(ronaldo, cachorro).
especie(carlos, gato).
especie(bolinha, coelho).
especie(sofia, gato).
especie(agata, gato).
especie(zeus, cachorro).
especie(toto, cachorro).
especie(foguinho, cachorro).

% porte(animal, tamanho): Indica o porte do animal.

porte(ronaldo, grande).
porte(carlos, pequeno).
porte(bolinha, pequeno).
porte(sofia, pequeno).
porte(agata, pequeno).
porte(zeus, grande).
porte(toto, medio).
porte(foguinho, medio).

% sexo(animal, sexo): Indica o sexo do animal.

sexo(ronaldo, macho).
sexo(carlos, macho).
sexo(bolinha, femea).
sexo(sofia, femea).
sexo(agata, femea).
sexo(zeus, macho).
sexo(toto, macho).
sexo(foguinho, macho).

% idade(animal, idade): Indica a idade do animal em anos.

idade(ronaldo, 5).
idade(carlos, 2).
idade(bolinha, 1).
idade(sofia, 3).
idade(agata, 4).
idade(zeus, 6).
idade(toto, 2).
idade(foguinho, 3).

% temperamento(animal, nivel): Indica o nível de energia/agitação do animal.

temperamento(ronaldo, alta).
temperamento(carlos, media).
temperamento(bolinha, baixa).
temperamento(sofia, media).
temperamento(agata, baixa).
temperamento(zeus, alta).
temperamento(toto, media).
temperamento(foguinho, media).

%custo(animal, valor): Indica o custo mensal do animal em reais.
%custo : baixo, medio ou alto

custo(ronaldo, baixo).
custo(carlos, medio).
custo(bolinha, baixo).
custo(sofia, medio).
custo(agata, baixo).
custo(zeus, alto).
custo(toto, medio).
custo(foguinho, medio).
