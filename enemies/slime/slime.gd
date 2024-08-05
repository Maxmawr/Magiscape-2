extends CharacterBody2D

var health = 10
var jump_height := 200
var speed := 3000
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction_facing = "right"
var dead = false
