import sys

def print_solution(board):
    """Helper function to print the board configuration."""
    n = len(board)
    for row in board:
        print(" ".join('Q' if i == row else '.' for i in range(n)))
    print("-----")

def solve_nqueens(n):
    """Function to solve the N-Queens problem."""
    board = [-1] * n  # board[i] = the column of the queen in the ith row
    solutions = []

    def is_safe(row, col):
        """Check if it's safe to place a queen at (row, col)."""
        for i in range(row):
            if board[i] == col or abs(board[i] - col) == row - i:
                return False
        return True

    def solve(row):
        """Recursive function to solve the N-Queens problem."""
        if row == n:
            solutions.append(board[:])  # Found a solution
            return
        for col in range(n):
            if is_safe(row, col):
                board[row] = col
                solve(row + 1)
                board[row] = -1  # Backtrack

    solve(0)
    return solutions

def main():
    """Main function to handle input and display solutions."""
    if len(sys.argv) != 2:
        print("Usage: python3 nqueens.py <n>")
        sys.exit(1)

    try:
        n = int(sys.argv[1])
    except ValueError:
        print("Please provide a valid integer for n.")
        sys.exit(1)

    if n <= 0:
        print("Please provide a valid positive integer for n.")
        sys.exit(1)

    print(f"Solving N-Queens for n = {n}...")
    solutions = solve_nqueens(n)

    if solutions:
        print(f"Found {len(solutions)} solution(s):")
        for solution in solutions:
            print_solution(solution)
    else:
        print("No solution exists.")

if __name__ == "__main__":
    main()

