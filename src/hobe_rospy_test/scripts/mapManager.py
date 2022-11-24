import matplotlib.pyplot as plt
from configuration import FileConfiguration
import math

# MapMOS class has a static map given by MOS
class MapManager:
    __instance = None

    def __init__(self):
        # initialize variables
        self.VertexNames = []
        self.VertexType = {}  # vertex_name: type (0:move, 1: station, 2: charging)
        self.VertexPos = {}  # vertex_name: pos [x,y,z] --> [x,z]
        self.Edge = {}  # vertex_name: [vertex_name, vertex_name, vertex_name]

        self.EdgeMove = {}  # A robot can move by a moving function
        self.EdgeLoad = {}  # A robot can move by a loading function
        self.EdgeUnload = {}  # A robot can move by a unloading function
        self.EdgeCharge = {}  # A robot can move by a charging function
        self.readMapFile()

    @classmethod
    def __getInstance(cls):
        return cls.__instance

    @classmethod
    def instance(cls, *args, **kargs):
        cls.__instance = cls(*args, **kargs)
        cls.instance = cls.__getInstance
        return cls.__instance

    def readMapFile(self):
        f = open(FileConfiguration.MAP_FILE_PATH, 'r')
        lines = f.readlines()
        lineNum = 0  # line number
        fileLength = len(lines)

        while lineNum < fileLength:
            vertexName = ""
            vertexType = -1
            pos = []
            edges = []

            if "Vertex" in lines[lineNum]:
                lineNum = lineNum + 1

                while True:
                    if 'name' in lines[lineNum]:
                        vertexName = int(lines[lineNum].split(" ")[1].split('\n')[0])
                        lineNum = lineNum + 1

                    if 'type' in lines[lineNum]:
                        vertexType = lines[lineNum].split(" ")[1].split('\n')[0]
                        lineNum = lineNum + 1

                    if 'pos' in lines[lineNum]:
                        pos = [float(a) for a in lines[lineNum].split(" ")[1:]]
                        lineNum = lineNum + 1

                    if 'edge' in lines[lineNum]:
                        edges.append(int(lines[lineNum].split(" ")[1].split('\n')[0]))
                        lineNum = lineNum + 1

                    if lineNum == fileLength or "Vertex" in lines[lineNum]:
                        break

            self.VertexNames.append(vertexName)
            self.VertexType[vertexName] = vertexType
            self.VertexPos[vertexName] = pos
            self.Edge[vertexName] = edges

        f.close()

    def vertexToPos(self, vertexName):
        return self.VertexPos[vertexName]

    def optimizePath(self, path):
        if len(path) < 2:
            return path
        else:
            newPath = list()
            node1 = self.VertexPos[path[0]]
            newPath.append(path[0])
            node2 = self.VertexPos[path[1]]

            for i in range(2, len(path)):
                node3 = self.VertexPos[path[i]]

                dist12 = math.sqrt((node1[0] - node2[0]) ** 2 + (node1[2] - node2[2]) ** 2)
                dist23 = math.sqrt((node2[0] - node3[0]) ** 2 + (node2[2] - node3[2]) ** 2)
                dist13 = math.sqrt((node1[0] - node3[0]) ** 2 + (node1[2] - node3[2]) ** 2)
                if dist13 == (dist12 + dist23):
                    node2 = node3
                else:
                    node1 = node2
                    node2 = node3
                    newPath.append(path[i - 1])

            newPath.append(path[-1])

            return newPath

    def draw_map(self):
        color_list = ['blue', 'green', 'red']  # (0:move, 1: station, 2: charging)
        for vertex, val in self.VertexPos.items():
            plt.plot(val[2], -1 * val[0], 'o', color=color_list[int(self.VertexType[vertex])])

        for vertex, edges in self.Edge.items():
            for v in edges:
                plt.plot([self.VertexPos[vertex][2], self.VertexPos[v][2]],
                         [-1 * self.VertexPos[vertex][0], -1 * self.VertexPos[v][0]], 'b')

        plt.pause(10)


if __name__ == "__main__":
    m = MapManager()
    print("done")
    m.draw_map()
