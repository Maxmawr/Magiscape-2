extends CharacterBody2D

var health = 10
var ground_speed := 300.0
var air_speed := 300.0
var jump_height := 275.0
var speed := 175.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction_facing = "right"
var dead = false
