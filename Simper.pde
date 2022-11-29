/* Simper
 ** A very simple image format 
 ** and image viewer 
 ** Format,
 **
 ** 0x00 - Height
 ** 0x04 - Width
 ** 0x08 - pixel 1
 ** 0x0c - pixel 2
 ** .
 ** .
 ** .
 ** 0x0ZZ - pixel N
 **
 */
import java.io.FileInputStream;
import java.io.DataInputStream;

boolean SET = false;
PImage img;

void settings() {
  int HEIGHT = 600;
  int WIDTH = 800;
  String file= "";

  try{
    if(args != null){
      file = args[0];
    }
    else{
      throw new IOException("File not found");
    }
  }
  catch(IOException E){
    print(E);
  }
  try {
    DataInputStream inp = new DataInputStream(new FileInputStream(file));
    HEIGHT = inp.readInt();
    WIDTH = inp.readInt();
    
    size(WIDTH, HEIGHT);
    img = createImage(WIDTH, HEIGHT, RGB);
    img.loadPixels();
    byte[] buffer = new byte[HEIGHT*WIDTH*3];
    
    inp.read(buffer);
    for (int i = 0; i < HEIGHT*WIDTH; ++i) {
      int r = buffer[i*3+0];
      r += r<0?256:0;
      int g = buffer[i*3+1];
      g += g<0?256:0;
      int b = buffer[i*3+2];
      b += b<0?256:0;
      println(r,g,b);
      img.pixels[i] = color(r,g,b);
    }
    SET = true;
  }
  catch(IOException e) {
    println(e);
  }
  finally {
    size(WIDTH, HEIGHT);
  }
}
void setup() {
  if (SET) {
    image(img, 0,0);
  }
  else{
    background(0);
    textSize(32);
    text("FILE NOT FOUND", 268, 270);
  }
}
