NOTES:
	
1.) Flashpunk's Entity class has some useful functions:
	distanceFrom -> compares two entiies 
	distanceToPoint
	distanceToRect
	moveBy -> can stop when collided with collision type provided as param
	moveTo
	moveTowards (use for enemies)
	
2.) Entity has a name field. World's getInstance(name) function returns the individual instance of Entity with the given name. 

3.) FP's World class, useful functions:
	collideRect, collidePoint, collideLine -> they return the first entity to collide with the given area
	nearestToRect -> returns the entity that is nearest to the given rectangle
	nearestToEntity -> returns the entity neatest to given entity
	World.count field is the count of entities in the world 
	classCount field is the count of entities of the given class in the world
	getType -> Pushes all Entities in the World of the type into the Array or Vector. (also getClass)

IDEA FOR MOVEMENT:
	for simplicity have max movement range be three tiles. then just make some images of 'range-diamonds'.
	when you click "move" the diamond appears as a sprite in the layer between the map and the player.
	then another sprite appears to represent where you want to move to. You now have control of this sprite.
	move the sprite to where you want to move to. if it is colliding with the diamond, it is green. if you 
	move the sprite so it is not colliding with the diamond, then it is red, and it will not let you execute
	a move. This should be a lot easier than making some crazy mapping algorithm that will determine whether
	or not you can move to a given tile :)
	

TODO:
	implement Attack methods:
		need to check attack range (Difficult)
		
	update move functions:
		need to work through GUI
		need to check movement range (Difficult)
		need to check all tiles within movement range to check for collisions etc (Difficult)
		
	implement the level
	
	add art
	