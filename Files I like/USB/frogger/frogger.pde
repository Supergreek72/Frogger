//Dimitri Papadedes
//Feb 15th 2019
//make a game of frogger for unit project 
/*there is a chance when you start the game the mystery machine in one of the cars 
click the help button on the top right of the screen for game details 
car on title screen will change each time program is oppend 
to enter "Challange" mode there is a flower on the map
that when clicked will do something... 
its up to you to find out which flower
*/

//images
PImage up_frog;
PImage down_frog;
PImage left_frog;
PImage right_frog;
PImage car3, car4, death, car2, car, car5, car6, car7, car8, car9, car10, car11;

//title screen
PImage Frogger;
int typing;
PImage titleFrog;
int titleFrogX = 0;
int frogTime; 
float titleCarX = -200;
PImage titleCar;
float carChoice = random(0, 3);

//movement variables
int x = 250;
int y = 670;

//collision variables
float car1D, car2D, carCollide1, carCollide2, car1Frog, car2Frog;
float car3Frog, car4Frog, car5Frog, car6Frog, car7Frog, car8Frog, car9Frog, car10Frog, car11Frog;
float carCollide3, carCollide4, carCollide5, carCollide6, carCollide7, carCollide8, carCollide9, carCollide10, carCollide11;

//car movement 
float car1X = 358;
float car2X = 0;
float car3X = 120;
float car4X = 400;
float car5X = 700;
float car6X = 20;
float car7X = 340;
float car8X = 600;
float car9X = -1000;
float car10X = 300;
float car11X = 800;
float car1ResetPoint;
float car2ResetPoint;
float car3ResetPoint;
float car4ResetPoint;
float car5ResetPoint;
float car6ResetPoint;
float car7ResetPoint;
float car8ResetPoint;
float car9ResetPoint;
float car10ResetPoint;
float car11ResetPoint;

//changing direction images 
int direction = 3; // 1 = up, 2 = left, 3 = up, 4 = right

//socre 
int score = 0;

//end game 
boolean endGame = false, startGame = false;


//easter egg 
PImage mystery;
boolean SPEED = false;

float time = random(0, 10);

//difficulty increase 
float dif = 1.8;

void setup() {

  //set size
  size(500, 700);
  //center images 
  imageMode(CENTER);
  //load images 
  //game stuff
  up_frog = loadImage("Frog.png");
  down_frog = loadImage("Frog_Down.png");
  left_frog = loadImage("Frog_Left.png");
  right_frog = loadImage("Frog_Right.png");
  car = loadImage("red_car2.png");
  car2 = loadImage("taxi.png");
  death = loadImage("Cross.png");
  car3 = loadImage("car_back.png");
  car4 = loadImage("car_back.png");
  car5 = loadImage("red_car.png");
  car6 = loadImage("red_car2.png");
  car7 = loadImage("car.png");
  car8 = loadImage("red_car2.png");
  car10 = loadImage("red_car.png");
  car11 = loadImage("police.png");

  //title screen stuff
  Frogger = loadImage("Frogger.png");
  titleFrog = loadImage("Frog_Right.png");

  //car on title screen
  if (carChoice < 1) {
    titleCar = loadImage("mystery.png");
  }
  else if (carChoice > 1 & carChoice < 2) {
    titleCar = loadImage("car.png");
  }
  else if (carChoice > 2 & carChoice < 3) {
    titleCar = loadImage("red_car2.png");
  }



  //easter egg
  if (time < 5) {
    car9 = loadImage("mystery.png");
  } 
  else {

    car9 = loadImage("car.png");
  }
}



void draw() {

  //do this stuff if on title screen
  if (startGame == false) { 

    //make typing go and reset
    typing += 1;
    if (typing == 60) {
      typing = 0;
    }

    //move title car 
    titleCarX = titleCarX + 1;

    //send title car back
    if (titleCarX > 650) {
      titleCarX = -145;
    }

    //make background shape 
    beginShape();
    vertex(20, 80);
    vertex(18, 70);
    vertex(18, 601);
    vertex(85, 673);
    vertex(431, 673);
    vertex(481, 606);
    vertex(483, 49);
    vertex(436, 19);
    vertex(78, 19);
    vertex(17, 68);
    endShape();

    //display logo
    image(Frogger, width / 2, 200, 300, 100);

    //display text
    //flash text
    if (typing > 30) {
      fill(255, 0, 0);//red
    }

    if (typing <= 30) {
      fill(0);
    }
    textSize(45);
    text("Press Enter to start", 45, 500);


    //use a timer to move the frog 
    frogTime = frogTime + 1;
    if (frogTime > 60) {
      frogTime = 0;
    }

    //move title frog 
    if (frogTime == 60) {
      titleFrogX = titleFrogX + 56;
    }

    //send title frog back
    if (titleFrogX > 700) {
      titleFrogX = 0;
    }

    //move a frog on the title screen 
    image(titleFrog, titleFrogX, 350, 50, 55);

    //move title car 
    image(titleCar, titleCarX, 350, 150, 80);

    fill(210, 105, 30);//brown
    stroke(210, 105, 30);//brown

    //wood around screen

    //corner
    beginShape();
    vertex(0, 86);
    vertex(0, 0);
    vertex(107, 0);
    endShape();
    //side
    rect(0, 60, 20, 550);

    //corner
    triangle(0, 579, 107, 697, 0, 700);
    //side
    rect(66, 673, 650, 28);

    //corner
    triangle(410, 700, 500, 579, 500, 700);
    //side
    rect(480, 0, 20, 700);

    //corner
    beginShape();
    vertex(500, 68);
    vertex(500, 0);
    vertex(408, 0);
    endShape();

    //side
    rect(0, 0, 500, 20);
    //done walls
  }

  //do this is on game screen
  if (startGame == true) {

    //only play game if the user has clicked enter after death
    if (endGame == false) {
      //change line outline to black
      stroke(0);

      //if flower clicked speed up all cars 
      if (SPEED == false) {
        //move the cars x position
        car1X = car1X + 4.5;
        car2X = car2X + 4.5;
        car3X = car3X - 4;
        car4X = car4X - 4;
        car5X = car5X - 4;
        car6X = car6X + dif;
        car7X = car7X + dif;
        car8X = car8X + dif;
        car9X = car9X + dif;
        car10X = car10X - 2.2;
        car11X = car11X - 2.2;
      }
      //speed up cars 
      else { 
        car1X = car1X + 9.5;
        car2X = car2X + 9.5;
        car3X = car3X - 8;
        car4X = car4X - 8;
        car5X = car5X - 8;
        car6X = car6X + dif + 3;
        car7X = car7X + dif + 3;
        car8X = car8X + dif + 3;
        car9X = car9X + dif + 3;
        car10X = car10X - 6.2;
        car11X = car11X - 6.2;
      }

      //make 1st grass 
      fill(0, 255, 0); //green
      rect(-1, 600, 501, 100);

      //make 2nd grass
      fill(0, 255, 0); //green
      rect(-1, 300, 501, 100);

      //make 3rd grass
      fill(0, 255, 0); //green
      rect(-1, -1, 501, 100);

      //make 1st road 
      fill(0); //black
      rect(-1, 400, 500, 200);

      //make 2nd road 
      fill(0); //black
      rect(-1, 100, 500, 200);

      //make flower 
      fill(255, 255, 0);//Yellow
      ellipse(40, 650, 10, 10);

      //make flower
      ellipse(456, 380, 10, 10);

      //make flower
      ellipse(267, 37, 10, 10);


      //make flower
      fill(255, 0, 0); //Red
      ellipse(400, 50, 10, 10);

      //make flower
      ellipse(56, 350, 10, 10);

      //make flower
      ellipse(186, 620, 10, 10);

      //make flower
      fill(0, 100, 200);//blue
      ellipse(256, 310, 10, 10);

      //make flower
      ellipse(400, 610, 10, 10);

      //make flower
      ellipse(56, 80, 10, 10);

      //make flower
      fill(148, 0, 221);//purple
      ellipse(166, 60, 10, 10);


      //make flower
      ellipse(166, 360, 10, 10);

      //make flower
      ellipse(286, 660, 10, 10);

      //make flower
      fill(255, 165, 0);//orange
      ellipse(356, 355, 10, 10);



      //make 1st road lines
      for (int road = -1; road <= 701; road += 80) {
        fill(255, 255, 255); //white
        rect(road, 495, 40, 20);
      }

      //make 2nd road lines
      for (int road = -1; road <= 701; road += 80) {
        fill(255, 255, 255); //white
        rect(road, 190, 40, 20);
      }

      //frog down
      if (direction == 1) {
        image(down_frog, x, y, 50, 55);
      }

      //frog left
      if (direction == 2) {
        image(left_frog, x, y, 50, 55);
      }

      //frog up
      if (direction == 3) {
        image(up_frog, x, y, 50, 55);
      }

      //frog right
      if (direction == 4) {
        image(right_frog, x, y, 50, 55);
      }


      //top road
      //teleport car 1 back
      if (car1X >= 580) {
        car1ResetPoint = random(-400, -150);
        car1X = car1ResetPoint;
      } 

      //move car 1
      image(car, car1X, 145, 150, 80);

      //teleport car 2 back
      if (car2X >= 580) {
        car2ResetPoint = random(-400, -150);
        car2X = car2ResetPoint;
      }


      //teleport car2 back
      image(car2, car2X, 145, 150, 80);


      //if cars 1 and 2 are ontop of each other send them away 
      carCollide1 = dist(car1X, 145, car2X, 145);

      if (carCollide1 < 150) {
        car1X = random(-400, -200);
      }

      //3rd road 

      //teleport car 3 back
      if (car3X <= -580) {
        car3ResetPoint = random(560, 850);
        car3X = car3ResetPoint;
      } 

      //move car 3
      image(car3, car3X, 250, 150, 80);



      //teleport car 4 back
      if (car4X <= -580) {
        car4ResetPoint = random(560, 850);
        car4X = car4ResetPoint;
      } 

      //move car 4
      image(car4, car4X, 250, 150, 80);

      //teleport car 5 back
      if (car5X <= -580) {
        car5ResetPoint = random(560, 850);
        car5X = car5ResetPoint;
      } 

      //move car 5
      image(car5, car5X, 250, 150, 80);


      //if car 5 and car 3 collide
      carCollide3 = dist(car3X, 250, car5X, 250);

      if (carCollide3 < 150) {
        car5X = random(560, 950);
      }


      //if car 5 and car 4 collide
      carCollide4 = dist(car5X, 250, car4X, 250);

      if (carCollide4 < 150) {
        car4X = random(560, 850);
      }


      //if car 3 and car 4 collide
      carCollide2 = dist(car3X, 250, car4X, 250);

      if (carCollide2 < 150) {
        car3X = random(560, 850);
      }


      //2nd road 

      //teleport car 6 back
      if (car6X >= 580) {
        car6ResetPoint = random(-400, -150);
        car6X = car6ResetPoint;
      } 

      //move car 6
      image(car6, car6X, 445, 150, 80);



      //teleport car 7 back
      if (car7X >= 580) {
        car7ResetPoint = random(-400, -150);
        car7X = car7ResetPoint;
      } 

      //move car 7
      image(car7, car7X, 445, 150, 80);


      //teleport car 8 back
      if (car8X >= 580) {
        car8ResetPoint = random(-400, -150);
        car8X = car8ResetPoint;
      } 

      //move car 8
      image(car8, car8X, 445, 150, 80);


      //teleport car 9 back
      if (car9X >= 580) {
        car9ResetPoint = random(-400, -150);
        car9X = car9ResetPoint;
      } 

      //move car 9
      image(car9, car9X, 445, 150, 80);


      //if car 6 and car 7 collide
      carCollide5 = dist(car6X, 445, car7X, 445);

      if (carCollide5 < 150) {
        car7X = random(-500, -150);
      }


      //if car 6 and car 8 collide
      carCollide6 = dist(car6X, 445, car8X, 445);

      if (carCollide6 < 150) {
        car8X = random(-500, -150);
      }

      //if car 7 and car 8 collide
      carCollide7 = dist(car7X, 445, car8X, 445);

      if (carCollide7 < 150) {
        car7X = random(-800, -150);
      }

      //if car 8 and car 9 collide
      carCollide8 = dist(car9X, 445, car8X, 445);

      if (carCollide8 < 150) {
        car9X = random(-800, -150);
      }

      //if car 7 and car 9 collide
      carCollide9 = dist(car9X, 445, car7X, 445);

      if (carCollide9 < 150) {
        car7X = random(-800, -150);
      }

      //if car 6 and car 9 collide
      carCollide10 = dist(car9X, 445, car6X, 445);

      if (carCollide10 < 150) {
        car6X = random(-800, -150);
      }


      //first road 

      //teleport car 10 back
      if (car10X <= -580) {
        car10ResetPoint = random(590, 850);
        car10X = car10ResetPoint;
      } 

      //move car 10
      image(car10, car10X, 555, 150, 80);


      //teleport car 11 back
      if (car11X <= -580) {
        car11ResetPoint = random(590, 850);
        car11X = car11ResetPoint;
      } 

      //move car 11
      image(car11, car11X, 555, 150, 80);

      if (carCollide11 < 150) {
        car11X = random(590, 750);
      }

      //if cars 11 and 10 are ontop of each other send them away 
      carCollide11 = dist(car10X, 145, car11X, 145);



      // go back from end
      if (y < 0) {
        y = 670;
        //add 1 to score 
        score = score + 1;
        //speed cars up 
        dif = dif + 0.1;
      }

      //down wall
      if (y > 700) {
        y = y - 60;
      }

      //left wall
      if (x < -25) {
        x = x + 60;
      }

      //right wall
      if (x > 505) {
        x = x - 60;
      }





      //display socre
      fill(0);//black
      textSize(20);
      text("Score: " + score, 10, 20);


      //frog collisions 
      //find distance from car1 to frog 
      car1Frog = dist(car1X, 145, x, y);

      //find distance from car2 to frog 
      car2Frog = dist(car2X, 145, x, y);

      //find distance from car3 to frog
      car3Frog = dist(car3X, 250, x, y);

      //find distance from car4 to frog
      car4Frog = dist(car4X, 250, x, y);

      //find distance from car5 to frog
      car5Frog = dist(car5X, 250, x, y);

      //find distance from car6 to frog
      car6Frog = dist(car6X, 445, x, y);

      //find distance from car7 to frog
      car7Frog = dist(car7X, 445, x, y);

      //find distance from car8 to frog
      car8Frog = dist(car8X, 445, x, y);

      //find distance from car9 to frog
      car9Frog = dist(car9X, 445, x, y);

      //find distance from car10 to frog
      car10Frog = dist(car10X, 555, x, y);

      //find distance from car11 to frog
      car11Frog = dist(car11X, 555, x, y);

      //end game if frog hits car1
      if (car1Frog < 75 ) {
        //switch to death image
        image(death, x, y, 50, 55);

        //draw game over
        textSize(40);
        fill(255, 0, 0);
        text("Game Over", 150, 350);

        //end game
        endGame = true;
      }

      //end game if frog hits car2
      if (car2Frog < 75 ) {
       death();
      }

      //end game if frog hits car3
      if (car3Frog < 70 ) {
        death();
      }

      //end game if frog hits car4
      if (car4Frog < 70 ) {
        death();
      }

      //end game if frog hits car5
      if (car5Frog < 70 ) {
        death();
      }


      //end game if frog hits car6
      if (car6Frog < 75 ) {
       death();
      }


      //end game if frog hits car7
      if (car7Frog < 75 ) {
        death();
      }

      //end game if frog hits car8
      if (car8Frog < 75 ) {
        death();
      }

      //end game if frog hits car9
      if (car9Frog < 75 ) {
        death();
      }

      //end game if frog hits car10
      if (car10Frog < 65 ) {
        death();
      }

      //end game if frog hits car11
      if (car11Frog < 65 ) {
      death();
      }

      //flower easter egg
      if (mousePressed == true) {
        if (mouseX > 251 & mouseX < 261 & mouseY > 306 & mouseY < 314) {

          //set speed to true and move cars faster 
          SPEED = true;
        }
      }
    }
  }

  //change line colour to black 
  stroke(0);

  //display help button
  fill(255, 255, 255); //white
  //help button 
  ellipse(485, 11, 20, 20);
  //detect if mouse is in circle and pressed 
  if (mousePressed == true) {
    
    if (mouseX > 475 & mouseX < 500 & mouseY > 2 & mouseY < 20) {
      //display help box 
      javax.swing.JOptionPane.showMessageDialog(null, "Arrow keys to move & if you get to the end it will add 1 to your score and send you back to the start \n                                                              To restart game press enter \n                               if you click on one of the flowers you will enter challange mode ");
      //switch mouse pressed to false so it can happen again 
      mousePressed = false;
    }
  }

  //help text
  fill(0); //black
  textSize(8);
  text("Help", 477, 14);
}

void keyPressed() {

  if (startGame ==false) {
    if (keyCode == ENTER) {
      startGame = true;
    }
  }

  if (startGame == true) { 

    //restart game if they press enter
    if (endGame == true) {

      if (keyCode == ENTER) {
        endGame = false;

        //set dif
        dif = 1.8;

        //send back to start sceen 
        startGame = false;

        //set score to 0 
        score = 0; 

        //set frog back 
        x = 250;
        y = 670;
        
        //speeds go back 
        SPEED = false;
      }
    }

    if (endGame == false) {


      //movement
      if (key == CODED) {
        //move up
        if (keyCode == UP) {
          y = y - 50;
          direction = 3;
        } //move down
        else if (keyCode == DOWN) {
          y = y + 50; 
          direction = 1;
        }//move left 
        else if (keyCode == LEFT) {
          x = x - 50;
          direction = 2;
        }//move right 
        else if (keyCode == RIGHT) {
          x = x + 50;
          direction = 4;
        }
      }
    }
  }
}

void death(){

//switch to death image
        image(death, x, y, 50, 55);

        //draw game over
        textSize(40);
        fill(255, 0, 0);
        text("Game Over", 150, 350);

        //end game
        endGame = true;
}
