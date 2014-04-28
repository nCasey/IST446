package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Neil Casey
	 */
	public class TestBlock extends Entity 
	{
		[Embed(source = "../Images/Player1.png")] private static const TEST:Class;
		
		public function TestBlock(X:Number=0, Y:Number=0)
		{
			graphic = new Image(TEST);
			
			x = X;
			y = Y;
			
			setHitbox(32, 32);
			
			super(x, y);
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.LEFT)) 
			{
				x -= 32;
				if ( collide("level", x, y) || collide("player", x, y) )
				{
					x += 32;
				}
			}
			else if (Input.pressed(Key.RIGHT)) 
			{ 
				x += 32;
				if ( collide("level", x, y) )
				{
					x -= 32;
				}
			}
			else if (Input.pressed(Key.UP)) 
			{
				y -= 32;
				if ( collide("level", x, y) )
				{
					y += 32;
				}
			}
			else if (Input.pressed(Key.DOWN)) 
			{ 
				y += 32;
				if ( collide("level", x, y) )
				{
					y -= 32;
				}
			}
		}
		
	}

}