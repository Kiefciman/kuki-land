import pygame
from settings import *
from player import Player
from ground import Ground
from camera import CameraGroup

class World:
    def __init__(self):
        self.display_surface = pygame.display.get_surface()
        self.sprites = CameraGroup()
        self.setup()

    def setup(self):
        self.player = Player((50,50), self.sprites)
        self.draw_ground()

    def run(self, dt):
        self.display_surface.fill('green')
        self.sprites.camera_draw(self.player)
        self.sprites.update(dt)

    def draw_ground(self):
        for x in range(10):
            for y in range(10):
                self.grass = Ground('grass', (x * tyle_size * 2, y * tyle_size * 2), self.sprites)
        return self.grass
