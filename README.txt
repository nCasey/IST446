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
	

TODO:
	implement Attack methods:
		need to check attack range (Difficult)
		
	update move functions:
		need to work through GUI
		need to check movement range (Difficult)
		need to check all tiles within movement range to check for collisions etc (Difficult)
		
	implement the level
	
	add art
	