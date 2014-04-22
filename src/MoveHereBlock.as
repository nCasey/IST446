package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Neil CaseY
	 */
	public class MoveHereBlock extends Entity
	{
		[Embed(source = "../Images/moveHereBlock.png")] private static const HERE_BLOCK:Class;
		[Embed(source = "../Images/cannotMoveHereBlock.png")] private static const NOT_HERE_BLOCK:Class;
		
		protected var valid:Graphic;
		protected var invalid:Graphic;
		
		public function MoveHereBlock(X:Number=0, Y:Number=0) 
		{
			valid = new Graphiclist(new Stamp(HERE_BLOCK));
			invalid = new Graphiclist(new Stamp(NOT_HERE_BLOCK));
			
			graphic = valid;
			
			type = "move";
			
			setHitbox(32, 32);
			
			// lower laYers appear on top of higher laYers
			// so laYer 1 is on top of laYer 2 etc
			layer = 2;
			
			super(X, Y, graphic);
		}
		
		public function destroy():void
		{
			FP.world.remove(this); 
		}
		
		override public function update():void 
		{
			if (Input.pressed(Key.LEFT)) 
			{
				x -= 32;
			}
			else if (Input.pressed(Key.RIGHT)) 
			{ 
				x += 32;
			}
			else if (Input.pressed(Key.UP)) 
			{
				y -= 32;
			}
			else if (Input.pressed(Key.DOWN)) 
			{ 
				y += 32;
			}
			
			if ( collide("radius", x, y) )
			{
				graphic = valid;
				
				// Allow the player to move here. 
				if ( Input.pressed(Key.ENTER)) 
				{
					var turn:String = MyWorld.currentTurn;
					var thisPlayer:Players = MyWorld.instance.getInstance(turn);
					
					thisPlayer.moveCommand = true;
					thisPlayer.goToX = x;
					thisPlayer.goToY = y;
					
					// set a flag in the MoveBlocks so they can commit suicide
					// Problem: Which moveBlocks?
					
					// Player 1 only has 4 moveBlocks
					if ( thisPlayer.name == "Player 1" )
					{
						MyWorld.instance.moveBlock1.suicide = true;
						MyWorld.instance.moveBlock2.suicide = true;
						MyWorld.instance.moveBlock3.suicide = true;
						MyWorld.instance.moveBlock4.suicide = true;
					}
					
					// kill yourself
					destroy();
				}
			}
			else 
			{
				graphic = invalid;
			}
		}
		
	}

}