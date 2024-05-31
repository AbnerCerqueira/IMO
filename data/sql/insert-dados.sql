-- alguns inserts para ir deixar o site com conteudos
-- para executar sem erros você precisa criar as procedures e triggers, os scripts estão nos outros arquivos

use imo;

-- cursos
insert into curso(categoria_curso, nome_curso, diretorio_thumbnail_curso) values ('Desenvolvimento web', 'JavaScript', '/img/thumbnails/thumbjs.png');
insert into curso(categoria_curso, nome_curso, diretorio_thumbnail_curso) values ('Desenvolvimento web', 'React', '/img/thumbnails/thumbreact.png');
insert into curso(categoria_curso, nome_curso, diretorio_thumbnail_curso) values ('Desenvolvimento web', 'Git', '/img/thumbnails/thumbgit.png');
insert into curso(categoria_curso, nome_curso, diretorio_thumbnail_curso) values ('Desenvolvimento web', 'Banco de dados', '/img/thumbnails/thumbbd.png');
insert into curso(categoria_curso, nome_curso, diretorio_thumbnail_curso) values ('Desenvolvimento web', 'Excel', '/img/thumbnails/thumbexcel.png');


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

-- react hooks aulas
CALL pr_add_aulas_curso('React', 'Fetch data', 'https://www.youtube.com/watch?v=00lxm_doFYw&list=PLApy4UwQM3UqAkfITNFzlqoD__UI6X5pb&index=1&t=9s&pp=iAQB');  
CALL pr_add_aulas_curso('React', 'Estrutura do projeto', 'https://www.youtube.com/watch?v=ANrYhHN8Dl4&list=PLApy4UwQM3UqAkfITNFzlqoD__UI6X5pb&index=2&pp=iAQB');  

-- aulas banco de dados


-- aulas excel


-- matricular o aluno nos cursos, precisa criar uma conta antes, pra esses insert funcionar
INSERT INTO estudante_curso values(1, 1);
INSERT INTO estudante_curso values(1, 2);
INSERT INTO estudante_curso values(1, 3);
INSERT INTO estudante_curso values(1, 4);
INSERT INTO estudante_curso values(1, 5);
