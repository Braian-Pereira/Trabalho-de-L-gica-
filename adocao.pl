%% Trabalho de Prolog - Adocao de Animais
%5 Dupla : Braian e Kael
%% Contexto entendido pela equipe : dado o perfil de um interessado em adotar um animal, o sistema deve indicar quais animais são adequados para ele, considerando critérios como porte, energia, compatibilidade com crianças e alergias.
%%  Linguagem : Prolog



%% 1. Definição de fatos sobre os animais disponíveis para adoção, incluindo suas   características como espécie, porte e nível de energia.

% animal(Nome, Especie, Porte, Energia)
animal(husk,     cachorro, grande,  alta).
animal(tobi,    cachorro, medio,   media).
animal(bolinha, cachorro, pequeno, alta).
animal(mel,     cachorro, pequeno, baixa).
animal(ágata,     gato,     pequeno, media).
animal(sofia,     gato,     medio,   baixa).
animal(percival,    gato,     pequeno, alta).
animal(branca,  coelho,   pequeno, baixa).