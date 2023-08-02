CREATE TABLE orientadorOrientaCursista(
	cpfOrientador CHAR(11) NOT NULL,
	cpfCursista CHAR(11) NOT NULL,
	
	CONSTRAINT fk_cpfOrientador 
		FOREIGN KEY(cpfOrientador)
			REFERENCES docente_orientador(cpf)
				ON DELETE CASCADE
				ON UPDATE CASCADE,
				
	CONSTRAINT fk_cpfCursista 
		FOREIGN KEY (cpfCursista)
			REFERENCES cursista(cpf)
				ON DELETE CASCADE
				ON UPDATE CASCADE
);