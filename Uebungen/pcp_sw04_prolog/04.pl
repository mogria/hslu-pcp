:- use_module(library(http/http_client)).                           % Import library (http client) Damit stehen Prädikate für http-Anfragen zur Verfügung --> http_get, http_post
:- use_module(library(http/json)).                                  % Import library (http json)
:- use_module(library(http/http_json)).                             % Import library (http_json)
:- [relationship].                                                  % Import Project Releationship (sw 02)
:- [sudoku].                                                        % Import Project sodoku (Bsp. Folien S.5 Prolog6)


% Concatenating all the urls used
baseurl('http://localhost:16316/problem/').                         % Basis URL als Fakt                    
problem_domain_url(ProblemDomain, ProblemDomainUrl) :-              % Prädikat (Soduku oder Relationship)
    baseurl(B),                                                     % Basis URL
    string_concat(B, ProblemDomain, TempUrl),                       % String concatination --> B + ProblemDomain --> Wird in TempURL gespeichert
    string_concat(TempUrl, '/', ProblemDomainUrl).                  % String concationaton --> TempUrl + / wird in PRoblemDomain gespeichert

problem_url(ProblemDomain, ProblemKey, ProblemUrl) :-               % Prädikat --> Problem Domain wird übergeben + ProblemKey --> Wird in ProblemURl gespeichert
    problem_domain_url(ProblemDomain, ProblemDomainUrl),            % Prädikat Erfüllung --> (Methodenaufruf ProblemDomainUrl)
    string_concat(ProblemDomainUrl, ProblemKey, ProblemUrl).        % String concatination ProblemDomainUrl + ProblemKey wird in ProbemUrl gespeichert


% Request a problem to solve
request_problem(ProblemDomain, ProblemKey, Problem) :-              % Prädikat mit ProblemDomäne (Relationship/Sodoku), ProblemKey, Problem (JSON-Struktur)
    problem_url(ProblemDomain, ProblemKey, ProblemUrl),             % Bekomme Problem URl
    http_get(ProblemUrl, Reply, []),                                % Prädikat (Aufruf-Getmethode auf), Reply Variable noch nicht instanziert, [] allfällige Header Attribut
    Reply = json(Problem).                                          % Reply (Json-String) = json(Problem)
    % Reply is json like
    % { "firstPerson":"mike", "problemKey":326, "relationship":"father", "secondPerson":"tina" }

% Post the solution to a problem
post_solution(ProblemDomain, Problem, Solution) :-                              % ProblemDomain, Problem und Lösung
    member(problemKey=K, Problem),                                              % Liest den Key aus dem Problem
    problem_domain_url(ProblemDomain, Url),                                     % Stellt die URL wieder zur Verfügung
    % solution is like an array for the sudoku one...
    http_post(Url, json(json([ problemKey=(K), solution=(Solution) ])), _, []). % Setzt den Post ab mit dem JSON (Key und Lösung vorhanden)



solve_problem_relationship(Problem, Solution) :-                                % Prädikat übergebe das Problem - Bekomme eine Lösung
    Problem = [firstPerson=P1, problemKey=_, relationship=R, secondPerson=P2],  % Auslesen der Wert vom Problem und abspeichern in den einzelen Variablen
    atom_string(PredicateName, R),                                              % Bekomme R als String und speichere es als Atom ab
    call(PredicateName, P1, P2),                                                % Rufe Predikat auf mit den beiden Strings (Persons)
    !,                                                                          % Cut --> Bricht Lösungssuche ab
    Solution = true.                                                            % Beide Seiten sind nun true    
solve_problem_relationship(_, Solution) :- Solution = false.                    % Wenn kein Problem vorhanden Solution ist false



copy_pre_filled_cells([], []).                                                  % Prädikat Sodoku leer (Problem Sodoku und Lösungssodoku) Zellen in einer Zeile ->Abbruchbedingung
copy_pre_filled_cells([ 0 | Filled ], [ Cs | Solution ]) :-                     % Split [Zelle 0 die Matched | Und die restlichen Zellen], Split [Zelle | Und restliche Solution]
    copy_pre_filled_cells(Filled, Solution).                                    % Prädikat Rekursiver Aufruf
copy_pre_filled_cells([ Cf | Filled ], [ Cs | Solution ]) :-                    % Füllt Felder ab, die auch im Probem Sodoku enhalten sind
    Cf > 0, Cf < 10,                                                            % Bedingungen
    Cs is Cf,                                                                   % Wert gesetzt
    copy_pre_filled_cells(Filled, Solution).                                    % Prädikat Rekursiver Aufruf

copy_pre_filled_rows([], []).                                                   % Prädikat Sodoku leer (Probelem Soduku und Lösungssodoku)
copy_pre_filled_rows([ Rf | Filled], [ Rs | Solution ]) :-                      % Split [Zeile | und der Rest], [Zeile | Und Rest der Lösung]
    copy_pre_filled_cells(Rf, Rs),                                              % Prädikat - Rekursiver Aufruf
    copy_pre_filled_rows(Filled, Solution).                                     % Prädikat - Rekursiver Aufruf
                                                                                % Ziel: Für jede Zelle soll ein Prädikat vorhanden sein
solve_problem_sudoku(Problem, Solution) :-
    Solution = [                                                                % Leere Liste für vorgegebene Werte
        [_, _, _, _, _, _, _, _, _],
        [_, _, _, _, _, _, _, _, _],
        [_, _, _, _, _, _, _, _, _],
        [_, _, _, _, _, _, _, _, _],
        [_, _, _, _, _, _, _, _, _],
        [_, _, _, _, _, _, _, _, _],
        [_, _, _, _, _, _, _, _, _],
        [_, _, _, _, _, _, _, _, _],
        [_, _, _, _, _, _, _, _, _]
    ],
    Problem = [problemKey=_, sudoku=Filled],                                     % Auslesen des abgefüllten Sodoku
    % Anstatt dies kann das JSON auch direkt als Prolog Term gelesen werden
    % Vorher müssen aber die nullen mit einem string replace
    % ersetzt werden
    copy_pre_filled_rows(Filled, Solution),                                      % Übergeben des abgefültlten Sodukus ins Leere Sodoku
    sudoku(Solution).                                                            % Importierte Funktion


% b.) Prädikat solve/2
solve(ProblemDomain, ProblemKey) :-                                             % Prädikat mit ProblemDomäne (soduku oder relationship) und ensprechendem Key
    request_problem(ProblemDomain, ProblemKey, Problem),                        % Problem Anfrage (wie Methodenaufruf)
    atom_concat(solve_problem_, ProblemDomain, PredicateName),                  % Concatetnation um MEthodenaufruf zu erhalten --> solve_problem + ProblemeDomäne  welche durch den Request mitgeben wird.
    call(PredicateName, Problem, Solution),                                     % Aufruf des korrekten Prädikat (oben erhaltener Aufruf in PredicateName), Erhaltenes Problem vom Request, Erhaltene Lösung
    post_solution(ProblemDomain, Problem, Solution).                            % Post-Aufruf Lösung geht zurück ans GUI

% ?- trace(solve).
% ?- trace(request_problem).
% ?- trace(post_solution).
% ?- trace(solve_problem_sudoku).
% ?- trace(sudoku).
% ?- trace(copy_pre_filled_rows).
% ?- trace(copy_pre_filled_cells).
%
% ?- solve(sudoku,656).
% true .
%
% ?- solve(relationship,23).
% true.