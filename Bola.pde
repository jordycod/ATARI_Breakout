class Bola {
  float xBola, yBola, Vx, Vy, diamBola;
  boolean iniciar;
  int pontMaxima = linhas * colunas;

  Bola() { //Atributos da função Bola.
    diamBola = height/35;
    xBola = width/2;
    yBola = height/10 *9 - diamBola;

    Vx = random(-5, 5);
    Vy = -10;
    iniciar = false;
  }

  void desenha () {
    fill(corElementos);
    ellipse(xBola, yBola, diamBola, diamBola);

    if (iniciar) { //Incremento nas velocidades de X e Y da bola.
      xBola += Vx;
      yBola += Vy;

      //Colisão nas bordas da desenha.
      if (xBola < diamBola/2) { //Esquerda.
        Vx *= -1;
        xBola = diamBola/2;
      }      
      if (xBola > width-diamBola/2) { //Direita.
        Vx *= -1;
        xBola = width-diamBola/2;
      }
      if (yBola < diamBola/2) { //Cima.
        Vy *= -1;
      } else if (yBola > Barra.yBarra + 1.5*diamBola) { //Baixo (bola fora). Reiniciar.
        iniciar = false;
        yBola = Barra.yBarra - diamBola;
        vidas--;
      }
    } else {
      xBola = mouseX;
    }
    
    //Mensagem de encerramento quando a pontuação máxima é atingida.
    if (Pontos == pontMaxima) { 
      fill(corTexto);
      text("PARABÉNS! VOCÊ ATINGIU A PONTUAÇÃO MÁXIMA!", width/2, height/2.3);
      text("PONTUAÇÃO: " + Pontos, width/2, height/2);
      xBola = mouseX;
      yBola = height/10 *9 - diamBola;
    }
  }

  void checaBarra(Barra Barra) {

    //Condições para colisão com a barra.
    if (xBola > Barra.xBarra - Barra.wBarra/2 && xBola < Barra.xBarra + Barra.wBarra/2 && yBola > Barra.yBarra - diamBola && yBola < Barra.yBarra+diamBola/10) {

      //Variações de velocidade de acordo com o ponto de colisão na barra.
      Vx += (xBola - mouseX)/10;

      if (Vx > 5) {
        Vx = 5;
      }
      if (Vx < -5) {
        Vx = -5;
      }
      if (Vx < 0) {
        Vy = -15 - Vx;
      } 
      if (Vx > 0) {
        Vy = -15 + Vx;
      }
    }
  }
}
