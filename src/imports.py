from os import walk
import pygame

def import_sprite_folder(path):
    surfaces_list = []

    for folder in walk(path):
        for image in folder[2]:
            if image.split('.')[1] == 'png':
                image_path = path + '/' + image
                image_surface = pygame.image.load(image_path).convert_alpha()
                image = pygame.transform.scale_by(image_surface, 2)
                #image = image_surface
                surfaces_list.append(image)

    return(surfaces_list)
