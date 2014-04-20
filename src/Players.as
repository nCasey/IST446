package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	public class Players extends Entity
	{	
		public function Players(X:Number, Y:Number)
		{
			
			// Here I set the hitbox width/height with the setHitbox function.
			setHitbox(20, 40); /* change this obvi */

			// Here I do the same thing by just assigning Player's properties.
			// change these once again 
			width = 20;
			height = 40;
			
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
			
		}
			
	}
}
