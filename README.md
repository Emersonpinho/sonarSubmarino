# sonarSubmarino

Este projeto implementa um sistema de sonar para submarino, utilizando as linguagens Processing e C++. O objetivo é demonstrar conceitos de detecção submarina, visualização gráfica e interação com sensores, sendo ideal para fins didáticos, experimentais ou como base para aplicações embarcadas.

---

## Índice

- [Visão Geral](#visão-geral)
- [Funcionalidades](#funcionalidades)
- [Instalação](#instalação)
- [Como Usar](#como-usar)
- [Configuração](#configuração)
- [Dependências](#dependências)
- [Exemplos de Uso](#exemplos-de-uso)
- [Contribuindo](#contribuindo)
- [Licença](#licença)
- [Autores](#autores)

---

## Visão Geral

O **sonarSubmarino** é composto por dois principais módulos:

- **Processamento Gráfico (Processing):** Responsável pela interface visual do sonar, mostrando os dados capturados em tempo real e simulações.
- **Controle de Hardware (C++):** Realiza a comunicação com sensores físicos e coleta dados ambientais, como distância, obstáculos e profundidade.

Este projeto pode ser utilizado tanto em simulações quanto integrado a hardware real, como sensores ultrassônicos conectados a microcontroladores.

---

## Funcionalidades

- Visualização gráfica do ambiente submarino em tempo real
- Detecção de obstáculos e objetos submersos
- Medição de distância por sonar
- Simulação de leitura de sensores
- Comunicação entre módulos (Processing ↔ C++)
- Interface amigável para controle e visualização

---

## Instalação

### Pré-requisitos

- [Processing](https://processing.org/download/)
- [Compilador C++](https://gcc.gnu.org/) (g++ recomendado)
- [Plataforma Arduino](https://www.arduino.cc/en/software/)

### Passos

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/Emersonpinho/sonarSubmarino.git
   ```
2. **Abra o código Processing:**
   - Execute o arquivo `sketch_250904a.pde` na IDE Processing.

---

## Como Usar

1. **Abra o arquivo .ino no arduino** para iniciar a leitura dos sensores:
2. **Inicie a interface gráfica (Processing):**
   - Abra `sketch_250904a.pde` na Processing IDE e clique em "Run".
3. **Visualize os dados:** A interface irá mostrar leituras em tempo real e simulações do ambiente submarino.
4. **Configuração de sensores:** Caso esteja usando hardware real, conecte os sensores conforme especificado nos arquivos de documentação.

---

## Configuração

- Parâmetros de porta serial, taxa de leitura e tipo de sensor podem ser ajustados nos arquivos de configuração ou diretamente no código-fonte.
- Ajuste a interface gráfica no Processing para personalizar cores, escala ou modo de simulação.

---

## Dependências

- Processing 3.x ou superior;
- g++ ou outro compilador C++;
- Arduino IDE e drivers, caso utilize sensores físicos;

---

## Exemplos de Uso

- **Simulação:** Rode apenas o Processing para testar a interface gráfica com dados simulados.
- **Modo Real:** Conecte sensores físicos ao seu computador e execute ambos os módulos para leituras reais.

---

## Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues, sugerir melhorias ou enviar pull requests.

1. Faça um fork do projeto
2. Crie uma branch com sua feature ou correção
3. Faça o commit das suas alterações
4. Envie um pull request

---

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

---

## Autores

Desenvolvido por [Emerson Pinho](https://github.com/Emersonpinho) e [Pedro wagner](PedroWagnerDev).

---
