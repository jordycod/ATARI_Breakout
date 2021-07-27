class Barra {
  float xBarra, yBarra, wBarra, hBarra;
  
  Barra() {
    wBarra = height/4;
    hBarra = height/40;
    xBarra = width/2;
    yBarra = height - height/10;
  }

  void desenha() {
    rectMode(CENTER);
    xBarra = mouseX; 

    if (mouseX >= width - wBarra/2) { //Limite de movimento da barra à direita.
      xBarra = width - wBarra/2;
    } 
    if (mouseX <= wBarra/2) { //Limite de movimento da barra à esquerda.
      xBarra = wBarra/2;
    }

    fill(corElementos);
    rect(xBarra, yBarra, wBarra, hBarra, 3); 

    rectMode(CORNER);
  }
}
