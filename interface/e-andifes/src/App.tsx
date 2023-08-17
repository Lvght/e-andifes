import React from 'react';
import logo from './logo.svg';
import './App.css';

import { Pessoa } from './entities/Pessoa';

function App() {

  const pessoa = new Pessoa();
  pessoa.nome = "Vinicius";
  pessoa.sobrenome = "da Luz";

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Hello, {pessoa.nome} {pessoa.sobrenome}!
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
