import pygame
from settings import *
from player import Player
from ground import Ground
from camera import CameraGroup
from map import draw_ground_map
from tree import Tree
from layers import layers

class World:
    def __init__(self):
        self.display_surface = pygame.display.get_surface()
        self.sprites = CameraGroup()
        self.setup()

    def setup(self):
        self.player = Player((1000,1000), self.sprites)
        self.draw_ground()
        self.tree = Tree(1, (1200, 1200), self.sprites)

    def run(self, dt):
        self.display_surface.fill('green')
        self.sprites.camera_draw(self.player)
        if self.player.rect.bottom >= self.tree.rect.bottom:
            self.tree.z = layers['behind-player']
        else:
            self.tree.z = layers['infront-player']
        self.sprites.update(dt)

    def draw_ground(self):
        for y, row in enumerate(draw_ground_map()):
            for x, col in enumerate(row):
                if col == 'grass':
                    self.grass = Ground('grass', (x * tyle_size * 2, y * tyle_size * 2), self.sprites)
        return self.grass
