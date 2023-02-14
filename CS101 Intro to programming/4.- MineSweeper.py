import random
class Game:
    alive = 1
    board_back = [[" " for i in range(9)] for j in range(9)]
    board_front = [["#" for i in range(9)] for j in range(9)]
    bomb_coor = []
    def __init__(self):
        x_coor = [0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8]
        y_coor = [0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8]
        for i in range(10):
            temp = []
            temp.append(x_coor.pop(random.choice(x_coor)))
            temp.append(y_coor.pop(random.choice(y_coor)))
            self.bomb_coor.append(temp)
            self.board_back[temp[0]][temp[1]] = "B"
        for i in range(9):
            for j in range(9):
                if self.board_back[i][j] == "B":
                    continue
                else:
                    self.board_back[i][j] = str(self.count_bombs(i, j))

    def count_bombs(self, x, y):
        count = 0
        for i in range(x-1,x+2):
            for j in range(y-1,y+2):
                if i == x and j == y:
                    continue
                elif i < 0 or i > 8 or j < 0 or j > 8:
                    continue
                elif self.board_back[i][j] == "B":
                    count += 1
                else:
                    continue
        return count

    def print_board(self, board):
        for i in range(9):
            print(board[i])

    def set_flag(self):
        x = int(input("Type horizontal coordinate to flag: "))
        y = int(input("Type vertical coordinate to flag: "))
        self.board_front[y][x] = "F"

    def uncover(self):
        x = int(input("Type horizontal coordinate to uncover: "))
        y = int(input("Type vertical coordinate to uncover: "))
        if self.board_back[y][x] == "0":
            self.clear_empty(y, x)
        else:
            self.board_front[y][x] = self.board_back[y][x]
        
        if self.board_back[y][x] == "B":
            print("You lost")
            self.alive = 0

    def clear_empty(self, x, y):
        if self.board_front[x][y] != " " and self.board_back[x][y] == "0":
            self.board_front[x][y] = " "
            for i in range(y-1, y+2, 2):
                if i < 0 or i > 8:
                    continue
                self.clear_empty(x, i)
            for j in range(x-1, x+ 2, 2):
                if j < 0 or j > 8:
                    continue
                self.clear_empty(j, y)
    def verify_game(self):
        if self.alive == 0:
            print("Game Over")
            return 0
        else:
            user_wins = True
            for i in self.bomb_coor:
                if self.board_front[i[0]][i[1]] != "F":
                    user_wins = False
                    break
            for i in self.board_front:
                if "#" in i:
                    user_wins = False
                    break
            if user_wins:
                print("You Won!")
                return 0
            else:
                return 1
        
            
        
game = Game()
while game.alive:
    print()
    game.print_board(game.board_front)
    if game.verify_game() == 0:
        break
    choice = int(input("""
    Select one optione:
    1.- Flag
    2.- Uncover
    """))
    if choice == 1:
        game.set_flag()
    else:
        game.uncover()
    
    