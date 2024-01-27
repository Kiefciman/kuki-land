import pygame
from layers import layers

class Tree(pygame.sprite.Sprite):
    def __init__(self, tree_type, position, group):
        super().__init__(group)
        self.assets_dir = '../assets/enviorement/trees/'

        match tree_type:
            case 1:
                image = pygame.image.load(self.assets_dir + '1.png').convert_alpha()

        self.image = pygame.transform.scale_by(image, 2)
        self.rect = self.image.get_rect(midbottom = position)
        self.z = layers['behind-player']
        #self.z = 20
