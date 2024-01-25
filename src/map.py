def draw_ground_map():
    ground_map = []

    for y in range(100):
        row = []
        for x in range(100):
            row.append('grass')
        ground_map.append(row)

    return ground_map
