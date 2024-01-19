import pygame
from imports import import_folder

class Player(pygame.sprite.Sprite):
    def __init__(self, pos, group):
        super().__init__(group)
        self.import_assets()

        self.current_animation = 'idle_down'
        self.current_frame = 0

        self.image = self.animations[self.current_animation][self.current_frame]
        self.rect = self.image.get_rect(center = pos)

        self.direction = pygame.math.Vector2()
        self.pos = pygame.math.Vector2(self.rect.center)
        self.speed = 200

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
            self.animations[animation] = import_folder(assets_path)

    def input(self):
        keys  = pygame.key.get_pressed()

        if keys[pygame.K_w]:
            self.direction.y = -1
        elif keys[pygame.K_s]:
            self.direction.y = 1
        else:
            self.direction.y = 0

        if keys[pygame.K_a]:
            self.direction.x = -1
        elif keys[pygame.K_d]:
            self.direction.x = 1
        else:
            self.direction.x = 0

    def move(self, dt):
        if self.direction.magnitude() > 0:
            self.direction = self.direction.normalize()

        self.pos.x += self.direction.x * self.speed * dt
        self.rect.centerx = self.pos.x

        self.pos.y += self.direction.y * self.speed * dt
        self.rect.centery = self.pos.y

    def update(self, dt):
        self.input()
        self.move(dt)
