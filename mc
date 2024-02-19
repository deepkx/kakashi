from collections import deque

def is_valid(state):
    # Check if the state is valid (no missionaries are outnumbered by cannibals)
    return state[0] >= state[1] or state[0] == 0

def generate_successors(state):
    # Generate valid successor states
    successors = []
    for i in range(3):
        for j in range(3):
            if 0 < i + j <= 2:
                new_state = (state[0] - i, state[1] - j, 1 - state[2])
                if 0 <= new_state[0] <= 3 and 0 <= new_state[1] <= 3 and is_valid(new_state):
                    successors.append(new_state)
    return successors

def bfs():
    start_state = (3, 3, 1)
    goal_state = (0, 0, 0)

    visited = set()
    queue = deque([(start_state, [])])

    while queue:
        current_state, path = queue.popleft()
        if current_state == goal_state:
            return path

        if current_state not in visited:
            visited.add(current_state)
            successors = generate_successors(current_state)
            for successor in successors:
                queue.append((successor, path + [successor]))

    return None

solution = bfs()
print(solution)
