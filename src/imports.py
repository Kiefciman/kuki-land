from os import walk
import pygame

def import_folder(path):
    surfaces_list = []

    for folder in walk(path):
        for image in folder[2]:
            if image.split('.')[1] == 'png':
                image_path = path + '/' + image
                image_surface = pygame.image.load(image_path).convert_alpha()
                image = pygame.transform.scale2x(image_surface)
                surfaces_list.append(image)

    return(surfaces_list)
