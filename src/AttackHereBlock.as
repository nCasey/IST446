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
	 * @author Neil Casey
	 */
	public class AttackHereBlock extends Entity
	{
		[Embed(source = "../Images/moveHereBlock.png")] private static const HERE_BLOCK:Class;
		[Embed(source = "../Images/cannotMoveHereBlock.png")] private static const NOT_HERE_BLOCK:Class;
		
		protected var valid:Graphic;
		protected var invalid:Graphic;
		
		public function AttackHereBlock(X:Number=0, Y:Number=0) 
		{
			valid = new Graphiclist(new Stamp(HERE_BLOCK));
			invalid = new Graphiclist(new Stamp(NOT_HERE_BLOCK));
			
			graphic = invalid;
			
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
			
			// if ( (collide("radius", x, y)) && (collide("enemy", x, y)) )
			// The above if statement doesnt make sense, since we are using AND with collide
			// which returns an entity.... actually idk why its not working
			
			if ( collide("radius", x, y) )
			{
				if ( collide("enemy", x, y) ) 
				{
					graphic = valid;
					
					// Allow the player to attack here. 
					if ( Input.pressed(Key.ENTER)) 
					{
						var turn:String = MyWorld.currentTurn;
						var thisPlayer:Players = MyWorld.instance.getInstance(turn);
						
						thisPlayer.attackCommand = true;
						
						// get the enemy at (x, y)
						// Assign the collided Enemy entity to a temporary var
						var e:Enemy = collide("enemy", x, y) as Enemy;
						
						// Check if e has a value (true if an Enemy was collided with).
						if ( e )
						{
							thisPlayer.currentlyAttacking = e;
							// Players's HandleAttack method should handle the rest
						}
						
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
						
						// Player 2 has 12 moveBlocks
						else if ( thisPlayer.name == "Player 2" )
						{
							MyWorld.instance.moveBlock1.suicide = true;
							MyWorld.instance.moveBlock2.suicide = true;
							MyWorld.instance.moveBlock3.suicide = true;
							MyWorld.instance.moveBlock4.suicide = true;
							
							MyWorld.instance.moveBlock5.suicide = true;
							MyWorld.instance.moveBlock6.suicide = true;
							MyWorld.instance.moveBlock7.suicide = true;
							MyWorld.instance.moveBlock8.suicide = true;
							
							MyWorld.instance.moveBlock9.suicide = true;
							MyWorld.instance.moveBlock10.suicide = true;
							MyWorld.instance.moveBlock11.suicide = true;
							MyWorld.instance.moveBlock12.suicide = true;
						}
						
						// Player 3 has 24 moveBlocks
						else if ( thisPlayer.name == "Player 3" )
						{
							MyWorld.instance.moveBlock1.suicide = true;
							MyWorld.instance.moveBlock2.suicide = true;
							MyWorld.instance.moveBlock3.suicide = true;
							MyWorld.instance.moveBlock4.suicide = true;
							
							MyWorld.instance.moveBlock5.suicide = true;
							MyWorld.instance.moveBlock6.suicide = true;
							MyWorld.instance.moveBlock7.suicide = true;
							MyWorld.instance.moveBlock8.suicide = true;
							
							MyWorld.instance.moveBlock9.suicide = true;
							MyWorld.instance.moveBlock10.suicide = true;
							MyWorld.instance.moveBlock11.suicide = true;
							MyWorld.instance.moveBlock12.suicide = true;
							
							MyWorld.instance.moveBlock13.suicide = true;
							MyWorld.instance.moveBlock14.suicide = true;
							MyWorld.instance.moveBlock15.suicide = true;
							MyWorld.instance.moveBlock16.suicide = true;
							
							MyWorld.instance.moveBlock17.suicide = true;
							MyWorld.instance.moveBlock18.suicide = true;
							MyWorld.instance.moveBlock19.suicide = true;
							MyWorld.instance.moveBlock20.suicide = true;
							
							MyWorld.instance.moveBlock21.suicide = true;
							MyWorld.instance.moveBlock22.suicide = true;
							MyWorld.instance.moveBlock23.suicide = true;
							MyWorld.instance.moveBlock24.suicide = true;
						}
						
						// kill yourself
						destroy();
					}
				}	
			}
			else 
			{
				graphic = invalid;
			}
		}
		
	}

}