void keyPressed() {
   switch(key) {
     case 'a': case 'A': keyA = true; break;
     case 'd': case 'D': keyD = true; break;
     case 'w': case 'W': keyW = true; break;
     case 's': case 'S': keyS = true; break;
   }
}

void keyReleased() {
  switch(key) {
     case 'a': case 'A': keyA = false; break;
     case 'd': case 'D': keyD = false; break;
     case 'w': case 'W': keyW = false; break;
     case 's': case 'S': keyS = false; break;
   }
}
