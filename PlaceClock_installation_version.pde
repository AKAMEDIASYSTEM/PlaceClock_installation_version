//slit-scan video demo from somewhere online adapted for Place Clock. AKA

import processing.video.*;
import processing.pdf.*;
import com.sun.image.codec.jpeg.*;
import java.awt.image.*;
import org.seltar.Bytes2Web.*;

Capture streetView;
int X=0;
int i = -1;
int numRows = 3;
int last = 0;
String timecode[] = new String[7];
PImage outgoing;
String fullTime;
//String USER_URL = "http://www.smartspaces.com/borderlands/upload.php";
 String USER_URL = "http://www.akamediasystem.com/code/PlaceClock/upload.php";
boolean available;
SimpleThread ourThread;

void setup() {
  streetView = new Capture(this, 320,240);
  size(1200,240*numRows);
  frameRate(18);
}


void draw() {

  if(streetView.available()) {
    streetView.read();
    X%=width;
    if(X==0) {                     //if we are starting a new row
      if(i==0)  mouseReleased();   //save frame if we're starting at beginning of page
      i++;                         //increment row counter
     // println(millis()-last);      //determine length to make a full frame
      last = millis();
    }
    i%=numRows;
    copy(streetView, (streetView.width/2),0,10,streetView.height, (X),streetView.height*i,10,streetView.height);
    // println(X);
    X++;
  }
}

void mousePressed() {
}

void mouseReleased() {
  PImage outgoing = get(0, 0, width, height);
  //set up date and time string NOTE this is now automatically done
  
  timecode[0] = String.valueOf(year());
  timecode[1] = String.valueOf(month());
  timecode[2] = String.valueOf(day());
  timecode[3] = String.valueOf(hour());
  timecode[4] = String.valueOf(minute());
  timecode[5] = String.valueOf(second());
  timecode[6] = "PlaceClock";
  String fullTime = join(timecode, "-");

 // start a thread (int w, String s, String filename, PImage ourImg)
 SimpleThread ourThread = new SimpleThread(1000, "uploadThread",fullTime, outgoing);
 ourThread.start();
 println("thread started");
//    if(saveToUrl_JPG(fullTime,outgoing)){
//      println("Uploaded "+fullTime);
//    } else println("Failed to Upload");
//    println(fullTime);
  }


/*
  copy(x, y, width, height, dx, dy, dwidth, dheight)
 copy(srcImg, x, y, width, height, dx, dy, dwidth, dheight)
 */
