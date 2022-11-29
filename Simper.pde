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
import java.io.FileReader;
import java.io.FileNotFoundException;
import java.util.Scanner;

Scanner sc;
boolean SET = false;
void settings() {
  int HEIGHT = 600;
  int WIDTH = 800;
  try {
    sc = new Scanner(new FileReader(".\\image.simp"));
    HEIGHT = sc.nextInt();
    WIDTH = sc.nextInt();
    size(WIDTH, HEIGHT);
    background(0);
    PImage img = createImage(WIDTH, HEIGHT, RGB);
    img.loadPixels();
    for (int i = 0; i < HEIGHT*WIDTH; ++i) {
      int t = sc.nextInt();
      img.pixels[i] = color(t&0xFF000000, t&0x00FF0000, t&0x0000FF00);
    }
    image(img, 0, 0);
    SET = true;
  }
  catch(FileNotFoundException e) {
    println(e);
  }
  finally {
    size(WIDTH, HEIGHT);
  }
}
void setup() {
  if (!SET) {
    background(0);
    textSize(32);
    text("FILE NOT FOUND", 268, 270);
  }
}
