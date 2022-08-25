# chess_knight_shortest_route

I made an algorith that finds the shortest path for a knight from any given position on a chess board to another.

I decided to structure it like a binary search tree, because the moves of a given piece on a chess board expands into a tree. I then used a level order search in order to find the shortest possible path.

I limited the amount of moves saved in the binary search tree, because otherwise computing power would be exponential. 

Code to run a test with: 
```
board = Board.new()
p board.knight_moves([0,0],[7,7])
#=> [[0, 0], [1, 2], [2, 4], [3, 6], [4, 4], [5, 6], [7, 7]]
```