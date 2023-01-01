%-------------------HECHOS-------------------
framework(react, frontend, javascript).
framework(react, backend, javascript).
framework(vue, frontend, javascript).
framework(angular, frontend, javascript).
framework(angular, backend, javascript).
framework(nodejs, backend, javascript).
framework(laravel, backend, php).
framework(pyramid, backend, python).
framework(bootstrap, frontend, css).
framework(materialize, frontend, javascript).
framework(bulma, frontend, css).
framework(express, backend, javascript).
framework(django, backend, python).
framework(flask, backend, python).
framework(semanticui, frontend, css).
framework(foundation, frontend, css).
framework(purecss, frontend, css).
framework(rubyonrails, backend, ruby).
framework(aspnet, backend, csharp).
framework(spring, backend, java).


%-------------------REGLAS-------------------

%si es frontend o backend
es_frontend(Nombre) :- framework(Nombre, frontend, _).
es_backend(Nombre) :- framework(Nombre, backend, _).

%si el framwork es popular o no
esPopular(Nombre) :- member(Nombre, [react, angular, vue, bootstrap, nodejs, django]).

%-------------------LISTAS-------------------

frontend(L) :- findall(Nombre, (framework(Nombre, frontend, _)), L).
backend(L) :- findall(Nombre, (framework(Nombre, backend, _)), L).

%regla que almacena los framworks con el mismo lenguaje en una lista
frameworks_lenguaje(Lenguaje, L) :- findall(Nombre, (framework(Nombre, _, Lenguaje)), L).



%-------------------ESTRUCTURAS-------------------

framework_info(
    nombre(react),
    anio(2013),
    calificacion(9),
    creador("Jordan Walke")
  ).
  
  framework_info(
    nombre(vue),
    anio(2014),
    calificacion(8),
    creador("Evan You")
  ).
  
  framework_info(
    nombre(angular),
    anio(2010),
    calificacion(7),
    creador("Google")
  ).
  
  framework_info(
    nombre(nodejs),
    anio(2009),
    calificacion(5),
    creador("Ryan Dahl")
  ).
  
  framework_info(
    nombre(laravel),
    anio(2011),
    calificacion(9),
    creador("Taylor Otwell")
  ).
  
  framework_info(
    nombre(pyramid),
    anio(2005),
    calificacion(10),
    creador("Chris McDonough")
  ).
  
  framework_info(
    nombre(bootstrap),
    anio(2011),
    calificacion(10),
    creador("Mark Otto and Jacob Thornton")
  ).
  
  framework_info(
    nombre(materialize),
    anio(2014),
    calificacion(9),
    creador("Alvin Wang")
  ).
  
  framework_info(
    nombre(bulma),
    anio(2017),
    calificacion(8),
    creador("Jeremy Thomas")
  ).
  
  framework_info(
    nombre(express),
    anio(2010),
    calificacion(9),
    creador("TJ Holowaychuk")
  ).
  
  framework_info(
    nombre(django),
    anio(2005),
    calificacion(10),
    creador("Adrian Holovaty and Simon Willison")
  ).
  
  framework_info(
    nombre(flask),
    anio(2010),
    calificacion(9),
    creador("Armin Ronacher")
  ).
framework_info(
    nombre(semanticui),
    anio(2013),
    calificacion(8),
    creador("Jack Lukic")
  ).
  
  framework_info(
    nombre(foundation),
    anio(2011),
    calificacion(9),
    creador("Zurb")
  ).
  
  framework_info(
    nombre(purecss),
    anio(2013),
    calificacion(9),
    creador("Yahoo!")
  ).
  
  framework_info(
    nombre(rubyonrails),
    anio(2004),
    calificacion(10),
    creador("David Heinemeier Hansson")
  ).
  
  framework_info(
    nombre(aspnet),
    anio(2002),
    calificacion(7),
    creador("Microsoft")
  ).
  
  framework_info(
    nombre(spring),
    anio(2003),
    calificacion(9),
    creador("Rod Johnson")
  ).  

%-------------------RECURSIVIDAD Y CONCATENACION-------------------

listar_frameworks_frontend_backend(Resultado) :-
    findall(Nombre, (framework(Nombre, frontend, _), framework(Nombre, backend, _)), Resultado).

% Define el caso base del predicado recursivo 'listar_frameworks_frontend_backend'
listar_frameworks_frontend_backend([], []).

% Define el caso recursivo del predicado 'listar_frameworks_frontend_backend'
listar_frameworks_frontend_backend([framework(Nombre, Tipo, _)|Resto], Resultado) :-
(Tipo = frontend, framework(Nombre, backend, _)),
listar_frameworks_frontend_backend(Resto, RestoResultado),
(member(Nombre, RestoResultado) -> Resultado = RestoResultado; Resultado = [Nombre|RestoResultado]).


%Consultas
%saber si un framework es frontend
%es_frontend(Nombre).
% saber si un framework es backend
% es_backend(Nombre).

% saber si un framework es popular o no
% esPopular(Nombre).

% obtener la lista de los framwork frontend
% frontend(L).

% obtener la lista de los framwork backend
% backend(L).

% obtener los framwork que tienen el lenguaje ingresado por teclado
% frameworks_lenguaje(Lenguaje, L).


% saber el año de creacion del framework
% framework_info(nombre(react), anio(Anio), calificacion(_), creador(_)).

% saber el creador del framework
% framework_info(nombre(react), anio(_), calificacion(_), creador(Creador)).

%buscar los datos de forma recursiva dentro de los registros
% encontrarInfo(react, Anio, Calificacion, Creador).

%saber los frameworks tanto de frontend como de backend
% listar_frameworks_frontend_backend(Resultado).