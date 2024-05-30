-- alguns inserts para ir deixar o site com conteudos
-- para executar sem erros você precisa criar as procedures e triggers, os scripts estão nos outros arquivos

use imo;

-- cursos
insert into curso(categoria_curso, nome_curso) values ('Desenvolvimento web', 'JavaScript');
insert into curso(categoria_curso, nome_curso) values ('Desenvolvimento web', 'Git');
insert into curso(categoria_curso, nome_curso) values ('Desenvolvimento web', 'React Hooks');

-- javacrips aulas
CALL pr_add_aulas_curso('JavaScript', 'Callback Functions', 'https://www.youtube.com/watch?v=Pk3AoFgSiU0&list=PL0X6fGhFFNTcBB9N4fPyMgtOxfvyujiEh&index=13&t=702s');
CALL pr_add_aulas_curso('JavaScript', 'Async Callback Functions', 'https://www.youtube.com/watch?v=bLpkoyrsALc&list=PL0X6fGhFFNTcBB9N4fPyMgtOxfvyujiEh&index=15&t=775s');
CALL pr_add_aulas_curso('JavaScript', 'Pare com o If Else', 'https://www.youtube.com/watch?v=CVeSF7-gjWM&list=PL0X6fGhFFNTcBB9N4fPyMgtOxfvyujiEh&index=14');
CALL pr_add_aulas_curso('JavaScript', 'Pare de usar Ponto e Vírgula', 'https://www.youtube.com/watch?v=J2DmeQQHLRo');

-- git aulas
CALL pr_add_aulas_curso('Git', 'Não use Git Pull', 'https://www.youtube.com/watch?v=xN1-2p06Urc');
CALL pr_add_aulas_curso('Git', 'Aliases', 'https://www.youtube.com/watch?v=CAnQ4b0uais&t=3s');
CALL pr_add_aulas_curso('Git', 'Corriga Conflitos', 'https://www.youtube.com/watch?v=DloR0BOGNU0');  
CALL pr_add_aulas_curso('Git', 'Commits Semânticos', 'https://www.youtube.com/watch?v=SQNb-NxZBPQ');  

insert into estudante_curso values(1, 2);

-- react hooks aulas
CALL pr_add_aulas_curso('React Hooks', 'useState', 'https://www.youtube.com/watch?v=HYKDUF8X3qI&list=PLApy4UwQM3UrZsBTY111R6P4frt6WK-G2&index=5&pp=iAQB');  
CALL pr_add_aulas_curso('React Hooks', 'useEffect', 'https://www.youtube.com/watch?v=-4XpG5_Lj_o&list=PLApy4UwQM3UrZsBTY111R6P4frt6WK-G2&index=2&pp=iAQB');  
CALL pr_add_aulas_curso('React Hooks', 'useMemo', 'https://www.youtube.com/watch?v=vpE9I_eqHdM&list=PLApy4UwQM3UrZsBTY111R6P4frt6WK-G2&index=3&pp=iAQB');  
CALL pr_add_aulas_curso('React Hooks', 'useCallback', 'https://www.youtube.com/watch?v=MxIPQZ64x0I&list=PLApy4UwQM3UrZsBTY111R6P4frt6WK-G2&index=4&pp=iAQB');  


-- matricular o aluno nos cursos
INSERT INTO estudante_curso values(1, 1);
INSERT INTO estudante_curso values(1, 2);
INSERT INTO estudante_curso values(1, 3);