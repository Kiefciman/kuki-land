import pygame
from imports import import_sprite_folder
from settings import *
from camera import layers

class Player(pygame.sprite.Sprite):
    def __init__(self, pos, group):
        super().__init__(group)
        self.import_assets()

        self.current_animation = 'idle_down'
        self.looking_direction = 'down'
        self.moving = False
        self.current_frame = 0
        self.animation_speed = 4

        self.image = self.animations[self.current_animation][self.current_frame]
        self.rect = self.image.get_rect(center = pos)
        self.z = layers['base']

        self.walking_direction = pygame.math.Vector2()
        self.pos = pygame.math.Vector2(self.rect.center)
        self.speed = 80

    def import_assets(self):
        self.animations = {
            'idle_down': [],
            'idle_up': [],
            'idle_left': [],
            'idle_right': [],
            'walking_up': [],
            'walking_down': [],
            'walking_left': [],
            'walking_right': []
        }

        for animation in self.animations.keys():
            assets_path = '../assets/player/' + animation
            self.animations[animation] = import_sprite_folder(assets_path)

    def input(self):
        keys  = pygame.key.get_pressed()

        if keys[pygame.K_w]:
            #self.current_animation = 'walking_up'
            self.walking_direction.y = -1
            self.looking_direction = 'up'
        elif keys[pygame.K_s]:
            #self.current_animation = 'walking_down'
            self.walking_direction.y = 1
            self.looking_direction = 'down'
        else:
            self.walking_direction.y = 0

        if keys[pygame.K_a]:
            #self.current_animation = 'walking_left'
            self.walking_direction.x = -1
            self.looking_direction = 'left'
        elif keys[pygame.K_d]:
            #self.current_animation = 'walking_right'
            self.walking_direction.x = 1
            self.looking_direction = 'right'
        else:
            self.walking_direction.x = 0

    def move(self, dt):
        if self.walking_direction.magnitude() > 0:
            self.walking_direction = self.walking_direction.normalize()

        self.pos.x += self.walking_direction.x * self.speed * dt
        self.rect.centerx = self.pos.x

        self.pos.y += self.walking_direction.y * self.speed * dt
        self.rect.centery = self.pos.y

        if self.walking_direction == [0, 0]:
            self.moving = False
        else:
            self.moving = True

    def animate(self, dt):
        self.current_frame += dt * self.animation_speed
        if self.current_frame >= len(self.animations[self.current_animation]):
            self.current_frame = 0
        self.image = self.animations[self.current_animation][int(self.current_frame)]

        if self.looking_direction == 'down':
            if self.moving:
                self.current_animation = 'walking_down'
            else:
                self.current_animation = 'idle_down'
        elif self.looking_direction == 'up':
            if self.moving:
                self.current_animation = 'walking_up'
            else:
                self.current_animation = 'idle_up'
        elif self.looking_direction == 'left':
            if self.moving:
                self.current_animation = 'walking_left'
            else:
                self.current_animation = 'idle_left'
        elif self.looking_direction == 'right':
            if self.moving:
                self.current_animation = 'walking_right'
            else:
                self.current_animation = 'idle_right'

    def update(self, dt):
        self.input()
        self.move(dt)
        self.animate(dt)
