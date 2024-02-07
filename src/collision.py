def collision(entity, collided_object):
    if entity.moving_up == True:
        if entity.hitbox.colliderect(collided_object.hitbox):
            entity.rect.bottom = collided_object.rect.bottom + 20
            entity.can_go_up = False
        else:
            entity.can_go_up = True
