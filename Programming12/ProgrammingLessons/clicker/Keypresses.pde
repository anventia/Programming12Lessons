void keyPressed() {
  switch(key) {
    case 'W': case 'w': wKey = true; break;
    case 'A': case 'a': aKey = true; break;
    case 'S': case 's': sKey = true; break;
    case 'D': case 'd': dKey = true; break;
    
  }
}

void keyReleased() {
  switch(key) {
    case 'W': case 'w': wKey = false; break;
    case 'A': case 'a': aKey = false; break;
    case 'S': case 's': sKey = false; break;
    case 'D': case 'd': dKey = false; break;
  }
}


void mousePressed() {
  clicks += 1;
  if (dist(x,y, mouseX,mouseY) < size/2) {
    hits += 1;
  } else {
    misses += 1;
  }
}

void mouseRelesed() {
  
}
