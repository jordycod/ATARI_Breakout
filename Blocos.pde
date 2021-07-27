class Blocos {
  float x, y, w, h;
  int numBlocos;
  boolean status;

  Blocos(int colunas, int linhas, int QuantBlocos) {
    numBlocos = QuantBlocos;
    w = (width / numBlocos) - width/400;
    h = height/20;
    x = (w * colunas)+ width/80;
    y = h * linhas;
    status = true;
  }

  void desenha() {

    if (status) {
      rectMode(CENTER);
      fill(corElementos);
      rect(x+w/2, y, w-w/5, h-h/2, 2);
    }
  }

  void checaBola(Bola Bola) {
    if (status) {
      //Baixo
      if (Bola.xBola > x && Bola.xBola < x+w && Bola.yBola < (y+h+Bola.diamBola)&& Bola.yBola>y+h) {
        Bola.Vy*=-1;
        status=false;
        Pontos++;
      }
      //Cima
      if (Bola.xBola > x && Bola.xBola < x+w && Bola.yBola > y-Bola.diamBola && Bola.yBola < y) {
        Bola.Vy*=-1;
        status=false;
        Pontos++;
      }
      //Esquerda
      if (Bola.xBola > x - Bola.diamBola && Bola.yBola > y && Bola.yBola < y+h && Bola.xBola < x) {
        Bola.Vx*=-1;
        status=false;
        Pontos++;
      }
      //Direita
      if (Bola.xBola > x+w  && Bola.yBola > y && Bola.yBola < y+h && Bola.xBola<x+w+Bola.diamBola) {
        Bola.Vx*=-1;
        status=false;
        Pontos++;
      }
    }
  }
}
