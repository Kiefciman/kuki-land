import pygame
from layers import layers

class Ground(pygame.sprite.Sprite):
    def __init__(self, ground_type, position, group):
        super().__init__(group)
        self.assets_dir = '../assets/ground/'

        match ground_type:
            case 'grass':
                image_surface = pygame.image.load(self.assets_dir + 'grass.png').convert()
                self.image = pygame.transform.scale_by(image_surface, 2)
                self.rect = self.image.get_rect(center = position)
                self.z = layers['ground']
