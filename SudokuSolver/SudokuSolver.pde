
int[][] sudoku;
IntList[][] potential;

int hoverX, hoverY;

/* int[][] saved; */
/* IntList[][] savedPot; */

/* int rX, rY; */

/* boolean solve; */

/* boolean showOnes; */
/* boolean showPairs; */
/* boolean showTriples; */
/* boolean showHover; */

/* int hover; */

void setup () {
  size(900, 900);
  hoverX = 0;
  hoverY = 0;
  /* sudoku = LoadSudoku(); */
  /* LoadPotential(); */
  /* rX = 0; */
  /* rY = 0; */
  /* solve = false; */
  /* showPairs = false; */
  /* showTriples = false; */
}

void draw () {
  /* if (solve) { */
    /* StepSolve(); */
  /* } */
  /* hover = GetHover(); */
  background(255);
  setHover();
  displaySudoku();
}

void keyPressed () {
  /* if (key == '.') { */
  /*   /1* StepSolve(); *1/ */
  /* } else if (key == 'k') { */
  /*   solve = !solve; */
  /* } else if (key == 's') { */
  /*   /1* SolveSudoku(); *1/ */
  /* } else if (key == 'p') { */
  /*   showPairs = !showPairs; */
  /*   showTriples = false; */
  /*   showHover = false; */
  /*   showOnes = false; */
  /* } else if (key == 't') { */
  /*   showTriples = !showTriples; */
  /*   showPairs = false; */
  /*   showHover = false; */
  /*   showOnes = false; */
  /* } else if (key == 'h') { */
  /*   showHover = !showHover; */
  /*   showPairs = false; */
  /*   showTriples = false; */
  /*   showOnes = false; */
  /* } else if (key == 'o') { */
  /*   showOnes = !showOnes; */
  /*   showPairs = false; */
  /*   showTriples = false; */
  /*   showHover = false; */
  /* } else if (key == 'l') { */
  /*   Save(); */
  /* } else if (key == 'j') { */
  /*   Load(); */
  /* } else if (key == 'n') { */
  /*   sudoku = LoadEmpty(); */
  /*   /1* LoadPotential(); *1/ */
  /* } else if (key == 'u') { */
  /*   /1* ClearOnce(); *1/ */
  /* } */
}

/* void mousePressed () { */
/*   if (mouseButton == RIGHT) { */
/*     SetSudoku(); */
/*   } else if (mouseButton == CENTER) { */
/*     SetPotential(); */
/*   } */
/* } */

/* void SolveSudoku () { */
/*   boolean isSolvable = true; */
/*   boolean isComplete = true; */
/*   int i = rX, j = rY; */
/*   do { */
/*     { */
/*       // on verifie si le sudoku est fini ou solvable */
/*       for (int tI = 0; tI < sudoku.length; tI++) { */
/*         for (int tJ = 0; tJ < sudoku.length; tJ++) { */
/*           if (sudoku[tI][tJ] == -1) { */
/*             isSolvable = false; */
/*           } */
/*           if (sudoku[tI][tJ] == 0) { */
/*             isComplete = false; */
/*           } */
/*         } */
/*       } */
/*     } */
/*     if (isSolvable || isComplete) { */
/*       ScanCase(i, j); */
/*       { */
/*         // on incremente en jusqu'a la prochaine case vide */
/*         int count = 0; */
/*         do { */
/*           j++; */
/*           if (j == 9) { */
/*             j = 0; */
/*             i++; */
/*           } */
/*           if (i == 9) { */
/*             i = 0; */
/*           } */
/*           count++; */
/*         } while (sudoku[i][j] != 0 && count < 81); */
/*       } */
/*     } */
/*   } while (isSolvable && !isComplete); // on continue tant que le sudoku is solvable et qu'il n'est pas fini */
/*   rX = i; */
/*   rY = j; */
/* } */

/* void StepSolve () { */
/*   IntList toRemove = ScanCase(rX, rY); */
/*   UpdateSudoku(toRemove, rX, rY); */
/*   int count = 0; */
/*   do { */
/*     rY++; */
/*     if (rY == 9) { */
/*       rY = 0; */
/*       rX++; */
/*     } */
/*     if (rX == 9) { */
/*       rX = 0; */
/*     } */
/*     count++; */
/*   } while (sudoku[rX][rY] != 0 && count < 81); */
/* } */

/* void ClearOnce () { */
/*   println("test"); */
/*   for (int i=0; i<9; i++) { */
/*     for (int j=0; j<9; j++) { */
/*       if (sudoku[i][j] == 0) { */
/*         ScanCase(i, j); */
/*       } */
/*     } */
/*   } */
/* } */

/* IntList ScanCase (int i, int j) { */
/*   IntList toRemove = new IntList(); */
/*   { */
/*     // finds all the numbers which cannot be in case */
/*     for (int k = 0; k < 9; k++) { */
/*       if (sudoku[i][k] > 0) { */
/*         // by checking rwo */
/*         toRemove.append(sudoku[i][k]); */
/*       } */
/*       if (sudoku[k][j] > 0) { */
/*         // by checking column */
/*         toRemove.append(sudoku[k][j]); */
/*       } */
/*       int l = (i / 3) + (j / 3) * 3; */
/*       if (sudoku[(l % 3) * 3 + (k % 3)][(l / 3) * 3 + (k / 3)] > 0) { */
/*         // by checking cube */
/*         toRemove.append(sudoku[(l % 3) * 3 + (k % 3)][(l / 3) * 3 + (k / 3)]); */
/*       } */
/*     } */
/*     { */
/*       IntList tmp = new IntList(); */
/*       for (int x = 0; x < toRemove.size(); x++) { */
/*         int tmpA = toRemove.get(x); */
/*         boolean isUnique = true; */
/*         for (int y = x + 1; y < toRemove.size(); y++) { */
/*           int tmpB = toRemove.get(y); */
/*           if (tmpA == tmpB) { */
/*             isUnique = false; */
/*             y = toRemove.size(); */
/*           } */
/*         } */
/*         if (isUnique) { */
/*           tmp.append(tmpA); */
/*         } */
/*       } */
/*       toRemove.clear(); */
/*       toRemove = tmp; */
/*     } */
/*   } */
/*   { */
/*     // then we calculate the potentials */
/*     for (int k = 0; k < toRemove.size(); k++) { */
/*       for (int l = 0; l < potential[i][j].size(); l++) { */
/*         if (toRemove.get(k) == potential[i][j].get(l)) { */
/*           potential[i][j].remove(l); */
/*         } */
/*       } */
/*     } */
/*   } */
/*   return toRemove; */
/* } */

/* void UpdateSudoku (IntList toRemove, int i, int j) { */
/*   // then we update the sudoku for all cases which are 100% sure */
/*   if (toRemove.size() == 8) { */
/*     int missing = 0; */
/*     { */
/*       toRemove.sort(); */
/*       int min = 0, max = 8; */
/*       while (min != max) { */
/*         int tmp = (min + max) / 2; */
/*         if (tmp + 1 < toRemove.get(tmp)) { */
/*           max = tmp; */
/*         } else { */
/*           min = tmp + 1; */
/*         } */
/*       } */
/*       missing = max + 1; */
/*     } */
/*     sudoku[i][j] = missing; */
/*     println("(" + i + ", " + j + ") >", sudoku[i][j]); // we print the result for additional info */
/*   } else if (toRemove.size() == 9) { */
/*     sudoku[i][j] = -1; // indicates there is an error in the sudoku itself : it can't be solved */
/*   } */
/* } */

void setHover() {
  hoverX = int(mouseX * 9. / float(width));
  hoverY = int(mouseY * 9. / float(height));
}

/**
 * Displays the grid of the sudoku
 */
void displayGrid() {
  stroke(0);
  for (int i=0; i<3; i++) {
    strokeWeight(3);
    if (i != 0) {
      line(i * width / 3, 0, i * width / 3, height);
      line(0, i * height / 3, width, i * height / 3);
    }
    strokeWeight(1);
    for (int j=1; j<3; j++) {
      line(i * width / 3 + j * width / 9, 0, i * width / 3 + j * width / 9, height);
      line(0, i * height / 3 + j * height / 9, width, i * height / 3 + j * height / 9);
    }
  }
}

/**
 * Displays the hover in the correct position
 */
void displayHover() {
  strokeWeight(5);
  stroke(200, 60, 60);
  noFill();
  rect(hoverX * width / 9, hoverY * height / 9, width / 9, height / 9);
}

void displaySudokuValues() {
  textSize(48);
  textSize(48);
  textAlign(CENTER, CENTER);
  for (int i = 0; i < sudoku.length; j++) {
  }
}

void displaySudoku () {
  displaySudokuValues();
  displayGrid();
  displayHover();
  // displays the value of the sudoku
  /* textSize(48); */
  /* textAlign(CENTER, CENTER); */
  /* for (int j=0; j<sudoku.length; j++) { */
  /*   for (int i=0; i<sudoku[j].length; i++) { */
  /*     if (sudoku[j][i] > 0) { */
  /*       // we display the value of the sudoku */
  /*       noStroke(); */
  /*       textSize(48); */
  /*       fill(0); */
  /*       text(sudoku[j][i], (i + .5) * width / 9, (j + .5) * height / 9 - 4); */
  /*     } else if (sudoku[j][i] == 0) { */
  /*       // we display the value of the potential */
  /*       noStroke(); */
  /*       textSize(24); */
  /*       if (showPairs) { */
  /*         if (potential[j][i].size() == 2) { */
  /*           fill(200, 60, 60); */
  /*         } else { */
  /*           fill(192); */
  /*         } */
  /*       } else if (showTriples) { */
  /*         if (potential[j][i].size() == 2 || potential[j][i].size() == 3) { */
  /*           fill(200, 60, 60); */
  /*         } else { */
  /*           fill(192); */
  /*         } */
  /*       } else if (showOnes) { */
  /*         if (potential[j][i].size() == 1) { */
  /*           fill(200, 60, 60); */
  /*         } else { */
  /*           fill(192); */
  /*         } */
  /*       } else if (!showHover) { */
  /*         fill(128); */
  /*       } */
  /*       for (int k=0; k<potential[j][i].size(); k++) { */
  /*         int tmp = potential[j][i].get(k); */
  /*         if (showHover) { */
  /*           if (tmp == hover) { */
  /*             fill(200, 60, 60); */
  /*           } else { */
  /*             fill(192); */
  /*           } */
  /*         } */
  /*         text(tmp, i * width / 9 + (((tmp - 1) % 3) + .5) * (width / 27), j * height / 9 + (((tmp - 1) / 3) + .5) * height / 27 - 2); */
  /*       } */
  /*     } else { */
  /*       // we alarm that the sudoku cannot be solved */
  /*       strokeWeight(3); */
  /*       stroke(200, 60, 60); */
  /*       line(i * width / 9, j * height / 9, (i + 1) * width / 9, (j + 1) * height / 9); */
  /*       line((i + 1) * width / 9, j * height / 9, i * width / 9, (j + 1) * height / 9); */
  /*     } */
  /*   } */
  /* } */
  // displays the grid
}

/* void SetSudoku () { */
/*   int x = 9 * mouseX / width; */
/*   int y = 9 * mouseY / height; */
/*   int nX = 27 * (mouseX - x * width / 9) / width; */
/*   int nY = 27 * (mouseY - y * height / 9) / height; */
/*   int n = nY * 3 + nX + 1; */
/*   sudoku[y][x] = n; */
/*   potential[y][x].clear(); */
/* } */

/* void SetPotential () { */
/*   int x = 9 * mouseX / width; */
/*   int y = 9 * mouseY / height; */
/*   int nX = 27 * (mouseX - x * width / 9) / width; */
/*   int nY = 27 * (mouseY - y * height / 9) / height; */
/*   int n = nY * 3 + nX + 1; */
/*   if (sudoku[y][x] == 0) { */
/*     for (int l=0; l<potential[y][x].size(); l++) { */
/*       if (n == potential[y][x].get(l)) { */
/*         potential[y][x].remove(l); */
/*       } */
/*     } */
/*   } else { */
/*     sudoku[y][x] = 0; */
/*     potential[y][x] = new IntList(); */
/*     for (int k=1; k<=9; k++) { */
/*       potential[y][x].append(k); */
/*     } */
/*   } */
/* } */

/* int GetHover () { */
/*   int x = 9 * mouseX / width; */
/*   int y = 9 * mouseY / height; */
/*   int nX = 27 * (mouseX - x * width / 9) / width; */
/*   int nY = 27 * (mouseY - y * height / 9) / height; */
/*   int n = nY * 3 + nX + 1; */
/*   return n; */
/* } */

int Pow (int n, int p) {
  if (p == 0) {
    return 1;
  } else {
    return n * Pow(n, p - 1);
  }
}

/* void LoadPotential () { */
/*   potential = new IntList[9][9]; */
/*   for (int i=0; i<9; i++) { */
/*     for (int j=0; j<9; j++) { */
/*       potential[i][j] = new IntList(); */
/*       if (sudoku[i][j] == 0) { */
/*         for (int k=1; k<=9; k++) { */
/*           potential[i][j].append(k); */
/*         } */
/*       } */
/*     } */
/*   } */
/* } */

int[][] LoadSudoku () {
  int[][] out = {
    {1, 5, 0, 7, 0, 0, 0, 9, 0}, 
    {3, 0, 0, 9, 1, 0, 0, 6, 0}, 
    {0, 0, 0, 0, 0, 4, 0, 1, 0}, 

    {0, 8, 0, 5, 0, 0, 0, 0, 6}, 
    {0, 9, 0, 8, 0, 7, 0, 4, 0}, 
    {6, 0, 0, 0, 0, 2, 0, 7, 0}, 

    {0, 3, 0, 4, 0, 0, 0, 0, 0}, 
    {0, 6, 0, 0, 7, 9, 0, 0, 2}, 
    {0, 4, 0, 0, 0, 3, 0, 8, 9}};
  return out;
}

int[][] LoadEmpty () {
  int[][] out = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0}};
  return out;
}

/* void Save () { */
/*   saved = new int[9][9]; */
/*   savedPot = new IntList[9][9]; */
/*   for (int i=0; i<9; i++) { */
/*     for (int j=0; j<9; j++) { */
/*       saved[i][j] = sudoku[i][j]; */
/*       savedPot[i][j] = potential[i][j].copy(); */
/*     } */
/*   } */
/* } */

/* void Load () { */
/*   for (int i=0; i<9; i++) { */
/*     for (int j=0; j<9; j++) { */
/*       sudoku[i][j] = saved[i][j]; */
/*       potential[i][j] = savedPot[i][j].copy(); */
/*     } */
/*   } */
/* } */
