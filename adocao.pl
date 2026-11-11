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
