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
        #self.image = image
        self.rect = self.image.get_rect(midbottom = position)
        self.z = layers['behind-player']
        self.z_sort = True
        self.needs_update = False
        self.can_collide = True
        self.collisionx = [37, 21]
        self.collisiony = [0, 20]
        self.looking_direction = 'down'
        self.can_move = False
        self.hitbox = self.rect.copy().inflate((-64 * 2, -128 * 2))

        self.hitbox.midbottom = self.rect.midbottom
