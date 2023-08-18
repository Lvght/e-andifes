import * as React from 'react';

import logo from './logo.svg';
import './App.css';

import { Pessoa } from './entities/Pessoa';
import { Endereco } from './entities/Endereco';

import {
  BrandVariants,
  createDarkTheme,
  createLightTheme,
  Field,
  FluentProvider,
  Input,
  Link,
  ProgressBar,
  Theme
} from '@fluentui/react-components';

import {
  InfoButton,
  InfoButtonProps,
} from "@fluentui/react-components/unstable";
import LandingPage from './screens/LandingPage';

function App() {
  const loadValue = undefined;

  const pessoa = new Pessoa();
  pessoa.nome = "Vinicius";
  pessoa.sobrenome = "da Luz";

  const endereco = new Endereco();
  endereco.cidade = "São Paulo";

  pessoa.endereco = endereco;

  const inputId = React.useId();

  const myNewTheme: BrandVariants = {
    10: "#090100",
    20: "#2F0A00",
    30: "#520000",
    40: "#670008",
    50: "#7E000F",
    60: "#950013",
    70: "#AD0017",
    80: "#C6001B",
    90: "#DF001F",
    100: "#F41E27",
    110: "#FF4338",
    120: "#FF6854",
    130: "#FF856F",
    140: "#FF9E89",
    150: "#FFB5A4",
    160: "#FFCABE"
  };

  const lightTheme: Theme = {
    ...createLightTheme(myNewTheme),
  };

  const darkTheme: Theme = {
    ...createDarkTheme(myNewTheme),
  };

  return (
    <FluentProvider theme={lightTheme}>
      <LandingPage/>
    </FluentProvider>
  );
}

export default App;
