
int[][] sudoku;
IntList[][] potential;

int hoverX, hoverY;

void setup () {
  size(900, 900);
  hoverX = 0;
  hoverY = 0;

  sudoku = loadSudoku();
  potential = loadPotential(sudoku);
}

void draw () {
  background(255);
  getHover();
  displaySudoku(sudoku, potential);
}

void mousePressed () {
  if (mouseButton == RIGHT) {
    solveCase(hoverY, hoverX, sudoku, potential);
  } else if (mouseButton == LEFT) {
    setSudoku(hoverY, hoverX, sudoku, potential);
  } else if (mouseButton == CENTER) {
    stepSolve(sudoku, potential);
  }
}

/**
 * Sets the value of a sudoku
 */
void setSudoku(int j, int i, int[][] sudoku, IntList[][] potential) {
  if (sudoku[j][i] > 0) {
    return;
  }
  // if we only have one choice, then it is easy
  if (potential[j][i].size() == 1) {
    sudoku[j][i] = potential[j][i].get(0);
    return;
  }
  // if we have more than once choice
  int tX = mouseX % (width / 9);
  int tY = mouseY % (height / 9);
  tX = 3 * tX / (width / 9);
  tY = 3 * tY / (height / 9);

  int n = tY * 3 + tX + 1;

  sudoku[j][i] = n;
}

/**
 * Updates the potential for all squares of the sudoku
 */
void stepSolve(int[][] sudoku, IntList[][] potential) {
  for (int j = 0; j < 9; j++) {
    for (int i = 0; i < 9; i++) {
      solveCase(j, i, sudoku, potential);
    }
  }
}

/**
 * Updates the potential with given constraints on the sudoku
 */
void solveCase(int j, int i, int[][] sudoku, IntList[][] potential) {
  if (sudoku[j][i] == 0) {
    return;
  }
  int n = sudoku[j][i];
  for (int x = 0; x < 9; x++) {
    removePotential(n, potential[j][x]);
  }
  for (int y = 0; y < 9; y++) {
    removePotential(n, potential[y][i]);
  }
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      int sx = (i / 3) * 3;
      int sy = (j / 3) * 3;
      removePotential(n, potential[sy + y][sx + x]);
    }
  }
}

/**
 * Remove a given number from a potential square
 */
void removePotential(int n, IntList squarePotential) {
  for (int k = 0; k < squarePotential.size(); k++) {
    if (squarePotential.get(k) == n) {
      squarePotential.remove(k);
      return;
    }
  }
}

/**
 * Sets the hover square from mouse position
 */
void getHover() {
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

/**
 * Displays the value in the sudoku
 */
void displaySudokuValues(int[][] sudoku) {
  textAlign(CENTER, CENTER);
  noStroke();
  textSize(48);
  fill(0);
  for (int j = 0; j < sudoku.length; j++) {
    for (int i = 0; i < sudoku[j].length; i++) {
      if (sudoku[j][i] > 0) {
        // we display the current value of the sudoku
        text(sudoku[j][i], (i + .5) * width / 9, (j + .5) * height / 9 - 4);
      }
    }
  }
}

/**
 * Displays the potential values
 */
void displayPotential(int[][] sudoku, IntList[][] potential) {
  textAlign(CENTER, CENTER);
  noStroke();
  textSize(24);
  for (int j = 0; j < sudoku.length; j++) {
    for (int i = 0; i < sudoku[j].length; i++) {
      if (sudoku[j][i] == 0) {

        switch(potential[j][i].size()) {
          case 3:
            fill(90, 180, 60);
            break;
          case 2:
            fill(60, 90, 180);
            break;
          case 1:
            fill(200, 60, 60);
            break;
          default:
            fill(192);
            break;
        }

        // we display the potential values for this square
        for (int k = 0; k < potential[j][i].size(); k++) {
          int t = potential[j][i].get(k);
          float offsetX = (((t - 1) % 3) + .5) * (width / 27);
          float offsetY = (((t - 1) / 3) + .5) * (height / 27) - 2;
          text(t, i * width / 9 + offsetX, j * height / 9 + offsetY);
        }
      }
    }
  }
}

void displaySudoku (int[][] sudoku, IntList[][] potential) {
  displaySudokuValues(sudoku);
  displayPotential(sudoku, potential);
  displayGrid();
  displayHover();
}

IntList[][] loadPotential(int[][] in) {
  IntList[][] out = new IntList[9][9];
  for (int j = 0; j < 9; j++) {
    for (int i = 0; i < 9; i++) {
      out[j][i] = new IntList();
      if (in[j][i] == 0) {
        for (int k = 1; k <= 9; k++) {
          out[j][i].append(k);
        }
      }
    }
  }
  return out;
}

int[][] loadSudoku() {
  int[][] out = {
    {1, 5, 0,  7, 0, 0,  0, 9, 0}, 
    {3, 0, 0,  9, 1, 0,  0, 6, 0}, 
    {0, 0, 0,  0, 0, 4,  0, 1, 0}, 

    {0, 8, 0,  5, 0, 0,  0, 0, 6}, 
    {0, 9, 0,  8, 0, 7,  0, 4, 0}, 
    {6, 0, 0,  0, 0, 2,  0, 7, 0}, 

    {0, 3, 0,  4, 0, 0,  0, 0, 0}, 
    {0, 6, 0,  0, 7, 9,  0, 0, 2}, 
    {0, 4, 0,  0, 0, 3,  0, 8, 9}};
  return out;
}

int[][] loadEmpty() {
  int[][] out = {
    {0, 0, 0,  0, 0, 0,  0, 0, 0}, 
    {0, 0, 0,  0, 0, 0,  0, 0, 0}, 
    {0, 0, 0,  0, 0, 0,  0, 0, 0}, 
    
    {0, 0, 0,  0, 0, 0,  0, 0, 0}, 
    {0, 0, 0,  0, 0, 0,  0, 0, 0}, 
    {0, 0, 0,  0, 0, 0,  0, 0, 0}, 

    {0, 0, 0,  0, 0, 0,  0, 0, 0}, 
    {0, 0, 0,  0, 0, 0,  0, 0, 0}, 
    {0, 0, 0,  0, 0, 0,  0, 0, 0}};
  return out;
}
