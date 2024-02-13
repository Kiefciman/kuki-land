def collision(entity, collided_object):
    if entity.moving_up == True:
        if entity.hitbox.colliderect(collided_object.hitbox):
            entity.can_go_up = False
            entity.rect.bottom = collided_object.hitbox.bottom + 20
        else:
            entity.can_go_up = True
