import pygame
from settings import *
from layers import layers

class CameraGroup(pygame.sprite.Group):
    def __init__(self):
        super().__init__()
        self.display_surface = pygame.display.get_surface()
        self.offset = pygame.math.Vector2()

    def camera_draw(self, player, dt):
        self.offset.x = player.rect.centerx - screen_width / 2
        self.offset.y = player.rect.centery - screen_height / 2

        for layer in layers.values():
            for sprite in self.sprites():
                if sprite.z == layer:
                    offset_rect = sprite.rect.copy()
                    offset_rect.center -= self.offset
                    self.display_surface.blit(sprite.image, offset_rect) 
