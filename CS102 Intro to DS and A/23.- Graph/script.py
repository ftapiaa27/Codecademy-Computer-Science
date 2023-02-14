from random import randrange
from vertex import Vertex
from graph import Graph

def print_graph(graph):
    for vertex in graph.graph_dict:
        print("")
        print(vertex + " connected to")
        vertex_neighbors = graph.graph_dict[vertex].edges
        if len(vertex_neighbors) == 0:
            print("No edges!")
        for adjacent_vertex in vertex_neighbors:
            print("=> " + adjacent_vertex)


def build_graph(directed):
    g = Graph(directed)
    vertices = []
    for val in ['a', 'b', 'c', 'd', 'e', 'f', 'g']:
        vertex = Vertex(val)
        vertices.append(vertex)
        g.add_vertex(vertex)

    for v in range(len(vertices)):
        v_idx = randrange(0, len(vertices) - 1)
        v1 = vertices[v_idx]
        v_idx = randrange(0, len(vertices) - 1)
        v2 = vertices[v_idx]
        g.add_edge(v1, v2, randrange(1, 10))

    print_graph(g)

build_graph(False)

print("---------------------")

railway = Graph()

callan = Vertex('callan')
peel = Vertex('peel')
ulfstead = Vertex('ulfstead')
harwick = Vertex('harwick')

railway.add_vertex(callan)
railway.add_vertex(peel)
railway.add_vertex(harwick)
railway.add_vertex(ulfstead)

railway.add_edge(peel, harwick)
railway.add_edge(harwick, callan)
railway.add_edge(callan, peel)

peel_to_ulfstead_path_exists = railway.find_path('peel', 'ulfstead')

print("A path exists between peel and ulfstead:")
print(peel_to_ulfstead_path_exists)