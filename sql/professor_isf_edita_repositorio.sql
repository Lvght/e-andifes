-- Tabela que refere-se as informações para que seja possível o Professor ISF editar os material de um repositório

CREATE TABLE professor_isf_edita_repositorio (
	id SERIAL PRIMARY KEY,
	professor_isf CHAR(11) NOT NULL,
	cursista CHAR(11) NOT NULL,
	codigo_repositorio INTEGER NOT NULL,
	
	CONSTRAINT fk_professor_isf 
		FOREIGN KEY (professor_isf) 
			REFERENCES professor_isf (cpf),
	
	CONSTRAINT fk_cursista 
		FOREIGN KEY (cursista) 
			REFERENCES cursista (cpf),
	
	CONSTRAINT fk_repositorio_cursista
		FOREIGN KEY (codigo_repositorio) 
			REFERENCES repositorio_cursista (codigo),
	
	CONSTRAINT professor_isf_cursista_codigo_repositorio 
		UNIQUE (professor_isf, cursista, codigo_repositorio)
);
