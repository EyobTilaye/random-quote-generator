

Table table;
PFont font;
String allQuote, author, quote;
int rowNo;

void setup () {

  size(1376, 760);
  surface.setTitle("Quote Generator");
  surface.setResizable(true);
  surface.setLocation(-6,-2);
  background(0);
  font = createFont("Georgia Bold Italic", 32);

  table = loadTable("Quotes.csv", "header");
  rowNo = int(random(table.getRowCount()));
}

void draw () {
  strokeWeight(2);
  stroke(overButton());
  fill(40);
  rectMode(CENTER);
  rect(width/2, 450, 165, 40);
  //stroke(255,0,0);
  //line(605,430,720,430);

  fill(255);
  textSize(18);
  text("Generate Quote", 615, 455);

  author = " - "+table.getString(rowNo, 0);
  quote = table.getString(rowNo, 1);



  fill(#DBD4D4);
  textSize(40);
  textFont(font);
  float widthOftext = textWidth(quote);

  if (checkWidth(widthOftext)) {
    text(quote, width/2-widthOftext/2, 300);
    textSize(25);
    textMode(RIGHT);
    text(author, width/2, 400);
  } else {
    longText(quote);
    // text(quote, width/2-widthOftext/2, 350);
    textSize(25);
    textMode(RIGHT);
    text(author, width/2, 400);
  }
  isPressed();
}

boolean checkWidth(float widthOftext) {
  if (widthOftext > width-10) return false;
  else return true;
}
void longText(String quote) {
  text(quote, 700, 600,1300,700);
  
}
int isPressed() {
  if (mousePressed && mouseX>=603 && mouseY>=428 &&
    mouseX<=603+165 && mouseY<=428+40) {
    background(0);
    rowNo = int(random(table.getRowCount()));
    return rowNo ;
  } else return 0;
}
color overButton() {
  if (mouseX>=603 && mouseY>=428 &&
    mouseX<=603+165 && mouseY<=428+40) {
    return #744949 ;
  } else return 155;
}
