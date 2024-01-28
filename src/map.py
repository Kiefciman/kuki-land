import random

map_size = 100

def draw_ground_map():
    ground_map = []

    for y in range(map_size):
        row = []
        for x in range(map_size):
            row.append('grass')
        ground_map.append(row)

    return ground_map

def draw_enviorement_map():
    enviorement_map = []

    for y in range(map_size):
        row = []
        for x in range(map_size):
            row.append('none')
        enviorement_map.append(row)

    for i in range(100):
        enviorement_map[random.randrange(0, map_size)][random.randrange(0, map_size)] = 'tree'

    return enviorement_map
