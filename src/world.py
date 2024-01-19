import pygame
from settings import *
from player import Player

class World:
    def __init__(self):
        self.display_surface = pygame.display.get_surface()
        self.sprites = pygame.sprite.Group()
        self.setup()

    def setup(self):
        self.player = Player((50,50), self.sprites)

    def run(self, dt):
        self.display_surface.fill('green')
        self.sprites.draw(self.display_surface)
        self.sprites.update(dt)