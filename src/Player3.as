package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	public class Player3 extends Players
	{
		// Player.png is 20x40 pixels
		[Embed(source = "../Images/player3.png")] private const PLAYER:Class;
		
		public var turnJustEnded;
		
		public function Player3(X:Number, Y:Number)
		{
			super(X, Y);
			graphic = new Image(PLAYER);
			layer = 1;
			turnJustEnded = false;
			name = "player3";
			type = "player";
		}
		
		override public function update():void
		{
			if ( (y > 640) || (y < 0) || (x < 0) || (x > 1024) )
			{
				this.destroy();
			}
			
			if (collide("level", x, y)) 
			{
				x += 32;
			}
			
			if ( MyWorld.currentTurn == "player3" )
			{
				if (Input.pressed(Key.LEFT)) 
				{
					x -= 32;
					turnJustEnded = true;
				}
				else if (Input.pressed(Key.RIGHT)) 
				{ 
					x += 32;
					turnJustEnded = true;
				}
				else if (Input.pressed(Key.UP)) 
				{
					y -= 32;
					turnJustEnded = true;
				}
				else if (Input.pressed(Key.DOWN)) 
				{ 
					y += 32;
					turnJustEnded = true;
				}
			}
			
			if ( turnJustEnded )
			{
				turnJustEnded = false;
				MyWorld.currentTurn = "Enemy 1";
				MyWorld.nextTurn = "Enemy 2";
			}
		}
		
	}
}