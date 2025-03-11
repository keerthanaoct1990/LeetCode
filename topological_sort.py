from collections import deque

def topological_sort(coure_prerequisites, num_courses):
    graph = {i : [] for i in range(num_courses)}
    course_prerequisite_count = {i : 0 for i in range(num_courses)}
    course_order = []
    visited = []
    for course, pre in coure_prerequisites:
        graph[pre].append(course)
        course_prerequisite_count[course]+=1
    queue = deque(node for node in course_prerequisite_count if course_prerequisite_count[node]==0)
    visited = [node for node in course_prerequisite_count if course_prerequisite_count[node]==0]
    while queue:
        course = queue.popleft()
        course_order.append(course)
        
        for neighbours in graph[course]:
            if neighbours not in visited:
                queue.append(neighbours)
                visited.append(neighbours)
    for data in course_order:
        print(data)


topological_sort([[1, 0], [2, 0], [3, 1], [3, 2], [4, 1], [5, 4]], 6)
                
    

    