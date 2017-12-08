 float radio;
  float linea;
  float y,x,_x,mov,ancho_y,cRango;
void setup(){
  size(640, 640);
  noFill();
  strokeWeight(2);
  radio=200;
  linea=5;
}
void draw(){
  background(0);
  translate(width / 2, height / 2);

  for(y = -radio + linea / 2; y <= radio - linea / 2; y += linea){
     mov = abs(pow(sin(y * 0.003 + frameCount * 0.1), 10));
     ancho_y = y - map(mov, 0, 1, -linea, linea);
     x = sqrt(sq(radio) - sq(y)) * map(mov, 0, 1, 1, 1.1);
     cRango = map(y, -radio + linea / 2, radio + linea / 2, 0, 1);
    stroke(lerpColor(color(0, 0, 255), color(255,0, 0), cRango));
    beginShape();
    for(_x = -x; _x <= x; _x += 1){
      vertex(_x, ancho_y);
    }
    endShape();
  }
}