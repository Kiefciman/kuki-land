import pygame
from imports import import_sprite_folder
from settings import *
from layers import layers

class Player(pygame.sprite.Sprite):
    def __init__(self, pos, group):
        super().__init__(group)
        self.import_assets()

        self.current_animation = 'idle_down'
        self.looking_direction = 'down'
        self.moving = False
        self.current_frame = 0
        self.animation_speed = 4
        self.needs_update = True
        self.can_go_up = True
        self.can_go_down = True
        self.can_go_left = True
        self.can_go_right = True
        self.moving_up = False
        self.moving_down = False
        self.moving_left = False
        self.moving_right = False

        self.image = self.animations[self.current_animation][self.current_frame]
        self.rect = self.image.get_rect(center = pos)
        self.z = layers['player']
        self.z_sort = False

        self.can_collide = True
        self.can_move = True
        self.hitbox = self.rect.copy().inflate((-24, -60))

        #self.walking_direction = pygame.math.Vector2()
        self.pos = pygame.math.Vector2(self.rect.center)
        self.speed = 100

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

    def controls(self, dt):
        if self.moving_up:
            if self.can_go_up:
                self.rect.y -= self.speed * dt
            self.looking_direction = 'up'
        elif self.moving_down:
            if self.can_go_down:
                self.rect.y += self.speed * dt
            self.looking_direction = 'down'
        if self.moving_left:
            if self.can_go_left:
                self.rect.x -= self.speed * dt
            self.looking_direction = 'left'
        elif self.moving_right:
            if self.can_go_right:
                self.rect.x += self.speed * dt
            self.looking_direction = 'right'

        if self.moving_left or self.moving_right or self.moving_up or self.moving_down:
            self.moving = True
        else:
            self.moving = False

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
        
        self.hitbox.midbottom = self.rect.midbottom

    def update(self, dt):
        self.controls(dt)
        #self.move(dt)
        self.animate(dt)
