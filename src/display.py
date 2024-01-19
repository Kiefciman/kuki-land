import pygame
from settings import *

def display_init(self):
    self.screen = pygame.display.set_mode((screen_width, screen_height))
    self.clock = pygame.time.Clock()
    pygame.display.set_caption('Kuki Land')

def display_update(self):
    dt = self.clock.tick() / 1000
    self.world.run(dt)
    pygame.display.update()
