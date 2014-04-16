package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	public class Players extends Entity
	{	
		static var turn:Boolean;
		static var turnOver:Boolean;
		
		public function Players(X:Number, Y:Number, Turn:Boolean = false)
		{
			
			// Here I set the hitbox width/height with the setHitbox function.
			setHitbox(20, 40); /* change this obvi */

			// Here I do the same thing by just assigning Player's properties.
			// change these once again 
			width = 20;
			height = 40;
			
			turn = Turn;
			
			turnOver = true;
			
			x = X;
			y = Y;
		}
		
		public function destroy():void
		{
			FP.world.remove(this); 
		}
		
		override public function update():void
		{
			/* This comment is here to demonstrate the syntax
			 * Assign the collided Bullet Entity to a temporary var.
			var b:Bullet = collide("bullet", x, y) as Bullet;
			var f:FloorObject = collide("floor", x, y) as FloorObject;
			var s:SpikeObject = collide("spike", x, y) as SpikeObject;

			// Check if b has a value (true if a Bullet was collided with).
			if (b)
			{
				// Call the Bullet's destroy() function.
				this.destroy();
			}
			
			if (s)
			{
				this.destroy();
			}
			 */
		
			if ( (y > 600) || (y < 0) || (x < 0) || (x > 800) )
			{
				this.destroy();
			}
			
			if (collide("level", x, y)) 
			{
				x += 32;
			}
			
			if ( turn )
			{

				if (Input.pressed(Key.LEFT)) 
				{
					x -= 32;
					turn = false;
					turnOver = true;
					
				}
				if (Input.pressed(Key.RIGHT)) 
				{ 
					x += 32;
					turn = false;
					turnOver = true
				}
				if (Input.pressed(Key.UP)) 
				{
					y -= 32;
					turn = false;
					turnOver = true
				}
				if (Input.pressed(Key.DOWN)) 
				{ 
					y += 32;
					turn = false;
					turnOver = true
				}
			
			}
			
		}
	}
}