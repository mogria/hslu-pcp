:- use_module(library(http/http_client)).
:- use_module(library(http/json)).
:- use_module(library(http/http_json)).
:- [relationship].
:- [sudoku].


% Concatenating all the urls used
baseurl('http://localhost:16316/problem/').
problem_domain_url(ProblemDomain, ProblemDomainUrl) :-
    baseurl(B),
    string_concat(B, ProblemDomain, TempUrl),
    string_concat(TempUrl, '/', ProblemDomainUrl).

problem_url(ProblemDomain, ProblemKey, ProblemUrl) :-
    problem_domain_url(ProblemDomain, ProblemDomainUrl),
    string_concat(ProblemDomainUrl, ProblemKey, ProblemUrl).


% Request a problem to solv
request_problem(ProblemDomain, ProblemKey, Problem) :-
    problem_url(ProblemDomain, ProblemKey, ProblemUrl),
    http_get(ProblemUrl, Reply, []),
    Reply = json(Problem).
    % Reply is json like
    % { "firstPerson":"mike", "problemKey":326, "relationship":"father", "secondPerson":"tina" }

% Post the solution to a problem
post_solution(ProblemDomain, Problem, Solution) :-
    member(problemKey=K, Problem),
    problem_domain_url(ProblemDomain, Url),
    % solution is like an array for the sudoku one...
    http_post(Url, json(json([ problemKey=(K), solution=(Solution) ])), _, []).



solve_problem_relationship(Problem, Solution) :-
    Problem = [firstPerson=P1, problemKey=_, relationship=R, secondPerson=P2],
    atom_string(PredicateName, R),
    call(PredicateName, P1, P2),
    !,
    Solution = true.
solve_problem_relationship(_, Solution) :- Solution = false.



copy_pre_filled_cells([], []).
copy_pre_filled_cells([ 0 | Filled ], [ Cs | Solution ]) :-
    copy_pre_filled_cells(Filled, Solution).
copy_pre_filled_cells([ Cf | Filled ], [ Cs | Solution ]) :-
    Cf > 0, Cf < 10,
    Cs is Cf,
    copy_pre_filled_cells(Filled, Solution).

copy_pre_filled_rows([], []).
copy_pre_filled_rows([ Rf | Filled], [ Rs | Solution ]) :-
    copy_pre_filled_cells(Rf, Rs),
    copy_pre_filled_rows(Filled, Solution).

solve_problem_sudoku(Problem, Solution) :-
    Solution = [
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
    Problem = [problemKey=_, sudoku=Filled],
    % Anstatt dies kann das JSON auch direkt als Prolog Term gelesen werden
    % Vorher müssen aber die nullen mit einem string replace
    % ersetzt werden
    copy_pre_filled_rows(Filled, Solution),
    sudoku(Solution).


% b.) Prädikat solve/2
solve(ProblemDomain, ProblemKey) :-
    request_problem(ProblemDomain, ProblemKey, Problem),
    atom_concat(solve_problem_, ProblemDomain, PredicateName),
    call(PredicateName, Problem, Solution),
    post_solution(ProblemDomain, Problem, Solution).

% ?- trace(solve).
% ?- trace(request_problem).
% ?- trace(post_solution).
% ?- trace(solve_problem_sudoku).
% ?- trace(sudoku).
% ?- trace(copy_pre_filled_rows).
% ?- trace(copy_pre_filled_cells).
