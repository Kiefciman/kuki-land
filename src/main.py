
# ██╗  ██╗██╗   ██╗██╗  ██╗██╗    ██╗      █████╗ ███╗   ██╗██████╗ 
# ██║ ██╔╝██║   ██║██║ ██╔╝██║    ██║     ██╔══██╗████╗  ██║██╔══██╗
# █████╔╝ ██║   ██║█████╔╝ ██║    ██║     ███████║██╔██╗ ██║██║  ██║
# ██╔═██╗ ██║   ██║██╔═██╗ ██║    ██║     ██╔══██║██║╚██╗██║██║  ██║
# ██║  ██╗╚██████╔╝██║  ██╗██║    ███████╗██║  ██║██║ ╚████║██████╔╝
# ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ 

import pygame
import sys
import time
from settings import *
from display import display_init, display_update
from world import World

class Game:
    def __init__(self):
        pygame.init()
        display_init(self)
        self.world = World()
        
    def run(self):
        while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    pygame.quit()
                    sys.exit()
            display_update(self)
            time.sleep(0.009)
            
if __name__ == '__main__':
    game = Game()
    game.run()
