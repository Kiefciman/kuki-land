import pygame
from settings import *

def display_init(self):
    self.screen = pygame.display.set_mode(
        size = (screen_width, screen_height),
        vsync = vsync_on,
        #flags = pygame.OPENGL | pygame.FULLSCREEN
        #flags = pygame.FULLSCREEN | pygame.DOUBLEBUF | pygame.HWSURFACE
        flags = pygame.FULLSCREEN | pygame.DOUBLEBUF
    )
    self.clock = pygame.time.Clock()
    pygame.display.set_caption('Kuki Land')

def display_update(self):
    dt = self.clock.tick() / 1000
    self.world.run(dt)
    pygame.display.update()
    #pygame.display.flip()
