-- alguns inserts para o site funcionar
-- para executar sem erros você precisa criar as procedures e triggers, os scripts estão nos outros arquivos

use imo;

-- cursos
insert into curso(categoria_curso, nome_curso, diretorio_thumbnail_curso, descricao_curso) values ('Desenvolvimento web', 'JavaScript', '/img/thumbnails/thumbjs.png', 'Domine a linguagem da web: Curso de JavaScript para construção de sites dinâmicos e interativos.');
insert into curso(categoria_curso, nome_curso, diretorio_thumbnail_curso, descricao_curso) values ('Desenvolvimento web', 'React', '/img/thumbnails/thumbreact.png', 'Construa interfaces modernas: Curso React para desenvolvimento de aplicações web escaláveis e reativas.');
insert into curso(categoria_curso, nome_curso, diretorio_thumbnail_curso, descricao_curso) values ('Desenvolvimento web', 'Git', '/img/thumbnails/thumbgit.png', 'Git é um sistema de controle de versão distribuído amplamente utilizado para rastrear alterações no código-fonte durante o desenvolvimento de software. Ele permite que várias pessoas trabalhem em projetos simultaneamente, gerenciando diferentes versões do código, facilitando o trabalho colaborativo e a integração de alterações.');
insert into curso(categoria_curso, nome_curso, diretorio_thumbnail_curso, descricao_curso) values ('Desenvolvimento web', 'Banco de dados', '/img/thumbnails/thumbbd.png', 'Sistema para armazenar e gerenciar dados de forma organizada.');
insert into curso(categoria_curso, nome_curso, diretorio_thumbnail_curso, descricao_curso) values ('Desenvolvimento web', 'Cloud', '/img/thumbnails/thumbcloud.png', 'Modelo de entrega de serviços de computação pela internet.');
insert into curso(categoria_curso, nome_curso, diretorio_thumbnail_curso, descricao_curso) values ('Escritorio', 'Excel', '/img/thumbnails/thumbexcel.png', 'Programa de planilha para análise e organização de dados.');
insert into curso(categoria_curso, nome_curso, diretorio_thumbnail_curso, descricao_curso) values ('Design', 'Adobe Illustrator', '/img/thumbnails/thumbadobe.png', 'Software de design vetorial para criar ilustrações e gráficos.');
insert into curso(categoria_curso, nome_curso, diretorio_thumbnail_curso, descricao_curso) values ('Engenharia', 'Gestao Agil', '/img/thumbnails/thumbagil.png', 'Abordagem de gerenciamento de projetos com foco na colaboração e entrega contínua.');

-- javacrips aulas
CALL pr_add_aulas_curso('JavaScript', 'Callback Functions', 'https://www.youtube.com/watch?v=Pk3AoFgSiU0&list=PL0X6fGhFFNTcBB9N4fPyMgtOxfvyujiEh&index=13&t=702s');
CALL pr_add_aulas_curso('JavaScript', 'Async Callback Functions', 'https://www.youtube.com/watch?v=bLpkoyrsALc&list=PL0X6fGhFFNTcBB9N4fPyMgtOxfvyujiEh&index=15&t=775s');
CALL pr_add_aulas_curso('JavaScript', 'Pare com o If Else', 'https://www.youtube.com/watch?v=CVeSF7-gjWM&list=PL0X6fGhFFNTcBB9N4fPyMgtOxfvyujiEh&index=14');
CALL pr_add_aulas_curso('JavaScript', 'Pare de usar Ponto e Vírgula', 'https://www.youtube.com/watch?v=J2DmeQQHLRo');

-- react aulas
CALL pr_add_aulas_curso('React', 'Fetch data', 'https://www.youtube.com/watch?v=00lxm_doFYw&list=PLApy4UwQM3UqAkfITNFzlqoD__UI6X5pb&index=1&t=9s&pp=iAQB');  
CALL pr_add_aulas_curso('React', 'Estrutura do projeto', 'https://www.youtube.com/watch?v=ANrYhHN8Dl4&list=PLApy4UwQM3UqAkfITNFzlqoD__UI6X5pb&index=2&pp=iAQB');  

-- git aulas
CALL pr_add_aulas_curso('Git', 'Não use Git Pull', 'https://www.youtube.com/watch?v=xN1-2p06Urc');
CALL pr_add_aulas_curso('Git', 'Aliases', 'https://www.youtube.com/watch?v=CAnQ4b0uais&t=3s');
CALL pr_add_aulas_curso('Git', 'Corriga Conflitos', 'https://www.youtube.com/watch?v=DloR0BOGNU0');  
CALL pr_add_aulas_curso('Git', 'Commits Semânticos', 'https://www.youtube.com/watch?v=SQNb-NxZBPQ');  


-- aulas banco de dados
CALL pr_add_aulas_curso('Banco de dados', 'O que é SQL?', 'https://www.youtube.com/watch?v=ld6YS5ZK2tE&list=PL9ooVrP1hQOG6DQnOD6ujdCEchaqADfCU&index=5&pp=iAQB');
CALL pr_add_aulas_curso('Banco de dados', 'SQL Injection', 'https://www.youtube.com/watch?v=3Axp3VDnf0I&list=PL9ooVrP1hQOG6DQnOD6ujdCEchaqADfCU&index=11&pp=iAQB');
CALL pr_add_aulas_curso('Banco de dados', 'Aprenda JOINs', 'https://www.youtube.com/watch?v=cBKkOgcNZYk&list=PL9ooVrP1hQOG6DQnOD6ujdCEchaqADfCU&index=7&pp=iAQB');
CALL pr_add_aulas_curso('Banco de dados', 'Triggers', 'https://www.youtube.com/watch?v=f6VWSlnHGCE&list=PL9ooVrP1hQOG6DQnOD6ujdCEchaqADfCU&index=9&pp=iAQB');


-- aulas cloud
CALL pr_add_aulas_curso('Cloud', 'Introdução', 'https://www.youtube.com/watch?v=HiBCv9DolxI&list=PLtL97Owd1gkQ0dfqGW8OtJ-155Gs67Ecz&index=1&pp=iAQB');
CALL pr_add_aulas_curso('Cloud', 'AWS', 'https://www.youtube.com/watch?v=aK72tmrphwQ&list=PLtL97Owd1gkQ0dfqGW8OtJ-155Gs67Ecz&index=2&pp=iAQB');
CALL pr_add_aulas_curso('Cloud', 'História AWS', 'https://www.youtube.com/watch?v=2gelAAD-5Aw&list=PLtL97Owd1gkQ0dfqGW8OtJ-155Gs67Ecz&index=5&pp=iAQB');
CALL pr_add_aulas_curso('Cloud', 'Modelos de Serviço', 'https://www.youtube.com/watch?v=znsSqRZWa5M&list=PLtL97Owd1gkQ0dfqGW8OtJ-155Gs67Ecz&index=7&pp=iAQB');


-- aulas excel
CALL pr_add_aulas_curso('Excel', 'Inserindo dados', 'https://www.youtube.com/watch?v=ZHeorjbxT5w&list=PLFVUrXYB__lbg2ttKhleZbLfXABwtx2ni&index=12&pp=iAQB');
CALL pr_add_aulas_curso('Excel', 'Filtrar tabelas', 'https://www.youtube.com/watch?v=DimAcJY_k7Y&list=PLFVUrXYB__lbg2ttKhleZbLfXABwtx2ni&index=24&pp=iAQB');
CALL pr_add_aulas_curso('Excel', 'Formatação de valores moeda', 'https://www.youtube.com/watch?v=0eYcwvFnLsw&list=PLFVUrXYB__lbg2ttKhleZbLfXABwtx2ni&index=28&pp=iAQB');


-- aulas adobe
CALL pr_add_aulas_curso('Adobe Illustrator', 'Configurações iniciais', 'https://www.youtube.com/watch?v=Kf1p1PQ8CaA&list=PL36fy0HIN6Vpa8kNXSMENDDg_zgE1HRjt&index=2&pp=iAQB');
CALL pr_add_aulas_curso('Adobe Illustrator', 'Principais Ferramentas', 'https://www.youtube.com/watch?v=W08piuKW8Xw&list=PL36fy0HIN6Vpa8kNXSMENDDg_zgE1HRjt&index=5&pp=iAQB');
CALL pr_add_aulas_curso('Adobe Illustrator', 'CMYK e RGG', 'https://www.youtube.com/watch?v=3Rqn-K7cb94&list=PL36fy0HIN6Vpa8kNXSMENDDg_zgE1HRjt&index=4&pp=iAQB');

-- aulas metodo agil
CALL pr_add_aulas_curso('Gestao Agil', 'Porque usar?', 'https://www.youtube.com/watch?v=-2W_loW_QYw&list=PLoGDMdX4pUAfso0bQWSZFgjEBlr2H9IBU&index=1&pp=iAQB');
CALL pr_add_aulas_curso('Gestao Agil', 'Valores e Principios', 'https://www.youtube.com/watch?v=GFUILA5D_wg&list=PLoGDMdX4pUAfso0bQWSZFgjEBlr2H9IBU&index=2&pp=iAQB');
CALL pr_add_aulas_curso('Gestao Agil', 'Framwork Scrum', 'https://www.youtube.com/watch?v=j4-9AqQLzfE&list=PLoGDMdX4pUAfso0bQWSZFgjEBlr2H9IBU&index=4&pp=iAQB');
