import pygame
import sys

def controls(player):
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()
        elif event.type == pygame.KEYDOWN:
            if event.key == pygame.K_w:
                player.moving_up = True
            if event.key == pygame.K_s:
                player.moving_down = True
            if event.key == pygame.K_a:
                player.moving_left = True
            if event.key == pygame.K_d:
                player.moving_right = True
        elif event.type == pygame.KEYUP:
            if event.key == pygame.K_w:
                player.moving_up = False
            if event.key == pygame.K_s:
                player.moving_down = False
            if event.key == pygame.K_a:
                player.moving_left = False
            if event.key == pygame.K_d:
                player.moving_right = False
