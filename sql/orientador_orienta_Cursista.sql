CREATE TABLE orientador_orienta_cursista(
	cpf_orientador CHAR(11) NOT NULL,
	cpf_cursista CHAR(11) NOT NULL,
	
	CONSTRAINT fk_cpf_orientador 
		FOREIGN KEY(cpf_orientador)
			REFERENCES docente_orientador(cpf)
				ON DELETE CASCADE
				ON UPDATE CASCADE,
				
	CONSTRAINT fk_cpf_cursista 
		FOREIGN KEY (cpf_cursista)
			REFERENCES cursista(cpf)
				ON DELETE CASCADE
				ON UPDATE CASCADE
);