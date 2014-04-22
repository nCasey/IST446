package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	public class Players extends Entity
	{	
		public var turnJustEnded:Boolean = false;
		public var moveRadius:Boolean = false;
		public var moveRadiusHandled:Boolean = false;
		public var moveCommand:Boolean = false;
		public var nextUp:String;
		public var nextNextUp:String;
		public var goToX:Number;
		public var goToY:Number;
		
		[Embed(source = "../Images/player1.png")] private const PLAYER1:Class;
		[Embed(source = "../Images/player2.png")] private const PLAYER2:Class;
		[Embed(source = "../Images/player3.png")] private const PLAYER3:Class;
		
		public function Players(X:Number, Y:Number, Name:String, Next:String, NextNext:String)
		{
			// Here I set the hitbox width/height with the setHitbox function.
			setHitbox(32, 32); /* change this obvi */

			// Here I do the same thing by just assigning Player's properties.
			// change these once again 
			width = 32;
			height = 32;
			
			x = X;
			y = Y;
			
			layer = 1;
			
			type = "player";
			
			name = Name;
			nextUp = Next;
			nextNextUp = NextNext;
			
			if ( name == "Player 1" )
			{
				graphic = new Image(PLAYER1);
			}
			else if ( name == "Player 2" )
			{
				graphic = new Image(PLAYER2);
			}
			else if ( name == "Player 3" )
			{
				graphic = new Image(PLAYER3);
			}
		}
		
		public function destroy():void
		{
			FP.world.remove(this); 
		}
		
		public function EndTurn():void 
		{
			turnJustEnded = false;
			MyWorld.currentTurn = this.nextUp;
			MyWorld.nextTurn = this.nextNextUp;
		}
		
		public function HandleMovementRadius():void
		{
			// add some kind of graphic illustrating movement range
			
			/*if (Input.pressed(Key.LEFT)) 
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
			}*/
			
			MyWorld.instance.AddRadius1(x, y);
			
			MyWorld.instance.AddMoveHereBlock(x, y);
			
			moveRadiusHandled = true;
		}
		
		/*
		 * MoveHereBlock will set flag that triggers this movement.
		 * It will also set the values for goToX and goToY
		 */
		public function HandleMovement():void
		{
			moveTo(goToX, goToY);
			
			turnJustEnded = true;
		}
		
		override public function update():void
		{
			if ( moveRadius )
			{
				HandleMovementRadius();
			}
			
			if ( moveRadiusHandled )
			{
				moveRadius = false;
			}
			
			if ( moveCommand )
			{
				HandleMovement();
			}
			
			if ( turnJustEnded )
			{
				moveRadius = false;
				EndTurn();
			}
		}
			
	}
}
