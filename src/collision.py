def collision(entity, collided_object):
    if entity.walking_direction.y == -1:
        if entity.hitbox.colliderect(collided_object.hitbox):
            entity.walking_direction.y = 0
            entity.rect.bottom = collided_object.rect.bottom + 20
        else:
            entity.walking_direction.y = -1
           #case 'down':
            #case 'right':
            #case 'left':
