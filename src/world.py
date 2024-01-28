import pygame
from settings import *
from player import Player
from ground import Ground
from camera import CameraGroup
from map import draw_ground_map, draw_enviorement_map
from tree import Tree
from layers import layers

class World:
    def __init__(self):
        self.display_surface = pygame.display.get_surface()
        self.sprites = CameraGroup()
        self.setup()

    def setup(self):
        self.player = Player((1000,1000), self.sprites)
        #self.player = Player((0, 0), self.sprites)
        self.draw_ground()
        self.draw_trees()

    def run(self, dt):
        #self.display_surface.fill('green')
        self.sprites.camera_draw(self.player, dt)
        for sprite in self.sprites:
            if sprite.z_sort:
                if self.player.rect.bottom >= sprite.rect.bottom:
                    sprite.z = layers['behind-player']
                else:
                    sprite.z = layers['infront-player']

            if sprite.needs_update:
                sprite.update(dt)

    def draw_ground(self):
        for y, row in enumerate(draw_ground_map()):
            for x, col in enumerate(row):
                if col == 'grass':
                    self.grass = Ground('grass', (x * tyle_size, y * tyle_size), self.sprites)
        return self.grass

    def draw_trees(self):
        for y, row in enumerate(draw_enviorement_map()):
            for x, col in enumerate(row):
                if col == 'tree':
                    self.tree = Tree(1, (x * tyle_size, y * tyle_size), self.sprites)
        return self.tree
