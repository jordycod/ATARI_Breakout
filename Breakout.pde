//Jordy Muniz Araúo
//Programação II - Horário 20h
//Matrícula: 500872

//Classes.
Bola Bola;
Barra Barra;
Blocos[][] Blocos;

//Elementos gráficos.
int linhas, colunas, Pontos, vidas, corTexto, corFundo, corElementos; 

void setup() {
  size(900, 600);
  textAlign(CENTER);
  textSize(height/40);
  noStroke();

  // Atributos gráficos básicos.
  corElementos = 250;
  corTexto = 200;
  corFundo = 20;
  Pontos = 0;
  vidas = 3;  
  linhas = 3;
  colunas = 10;
  mostraCenario(colunas, linhas);
}

void draw() {
  background(corFundo);

  Bola.desenha();
  Bola.checaBarra(Barra);
  Barra.desenha();
  mostrarBlocos(); 
  mostraCenario();
}

void mostraCenario() {

  rectMode(CORNER);
  strokeWeight(height/40);
  stroke(corElementos);
  noFill();
  rect(0, 0, width, height);
  strokeWeight(0);

  //Título
  fill(corTexto);
  text("BREAKOUT - ATARI, BY JORDY MUNIZ", width/2, height-height/30);

  //Pontuação no canto inferior direito da tela.
  fill(corTexto);
  text("PONTOS: " + Pontos, width/10*9, height-height/30);

  //Contador de vidas no canto inferior esquerdo da tela.
  fill(corTexto);  
  text("VIDAS: " + vidas, width/10, height-height/30);

  if (vidas == 0) { //Condição para mensagem de fim de jogo, caso as vidas cheguem a zero.
    fill(corTexto);  
    text("SUAS VIDAS ACABARAM!", width/2, height/2.3);
    text("CLIQUE EM QUALQUER LUGAR PARA REINICIAR.", width/2, height/2);
  }
}

void mostrarBlocos() { //Relação da posição dos blocos e da bolinha para obter as colisões.
  for (int i = 0; i < Blocos.length; i++) {
    for (int j = 0; j < Blocos[0].length; j++) {
      Blocos[i][j].desenha();
      Blocos[i][j].checaBola(Bola);
    }
  }
}

void mostraCenario(int linhas, int colunas) { //Desenho dos elementos na tela (bola, barra e blocos).
  Bola = new Bola();
  Barra = new Barra();
  Blocos = new Blocos[linhas][colunas];
  for (int i = 0; i < Blocos.length; i++) {
    for (int j = 0; j < Blocos[0].length; j++) {
      Blocos[i][j] = new Blocos(i, j+2, Blocos.length);
    }
  }
}

boolean limpaBlocos() { //Remoção de blocos após colisão com a bolinha.
  for (int i = 0; i < Blocos.length; i++) {
    for (int j = 0; j < Blocos[0].length; j++) {
      if (Blocos[i][j].status) { //No objeto "Blocos" existe uma variável booleana "status" que, enquanto "true" exibe os blocos. Após a colisão, muda para "false" e o bloco some.
        return false;
      }
    }
  }
  return true;
}

void mousePressed() {
  if (vidas > 0) { //Condição para reinício de jogo.
    Bola.yBola -= 10;
    Bola.iniciar = true;
  } else {
    setup();
  }
}
