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
		public var attackRadius:Boolean = false;
		public var attackRadiusHandled:Boolean = false;
		public var attackCommand:Boolean = false;
		public var currentlyAttacking:Enemy;
		public var nextUp:String;
		public var nextNextUp:String;
		public var goToX:Number;
		public var goToY:Number;
		public var moving:Boolean;
		
		public var HP:int;
		public var AD:int;
		
		public var xMovementHandled:Boolean = false;
		public var doneWaiting:Boolean = false;
		public var time:int = 0;
		public var directionX:int;
		public var directionY:int;
		
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
			
		/*	if ( name == "Player 1" )
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
			}*/
		}
		
		public function destroy():void
		{
			FP.world.remove(this); 
		}
		
		/*
		 * 
		 */ 
		public function Attack():void
		{
			currentlyAttacking.TakeDamage(this.AD);
			turnJustEnded = true;
		}
		
		/*
		 * 
		 */ 
		public function TakeDamage(dam:int):void 
		{
			this.HP -= dam;
			
			if ( this.HP < 1 )
			{
				// remove this entity from the turnVector
				var index:int = MyWorld.instance.turnVector.indexOf(name);
				// start at index 'index' and delete 1 item from there
				MyWorld.instance.turnVector.splice(index, 1);
				
				// Death animation?
				this.destroy();
			}
		}
		
		public function EndTurn():void 
		{
			turnJustEnded = false;
			//MyWorld.currentTurn = this.nextUp;
			//MyWorld.nextTurn = this.nextNextUp;
			MyWorld.instance.ChangeTurn();
		}
		
		/*public function HandleMovementRadius():void
		{	
			/*if ( name == "Player 1" )
			{
				MyWorld.instance.AddRadius1(x, y);
			}
			else if ( name == "Player 2" )
			{
				
			}
			else if ( name == "Player 3" )
			{
				
			}
			
			
			 * Better idea than the above if statements:
				 * just have the HandleMovementRadius function be inside
				 * the classes of Player1, Player2, Player3
			  
			
			MyWorld.instance.AddMoveHereBlock(x, y);
			
			moveRadiusHandled = true;
		}*/
		
		public function HandleMovementRadius():void { }
		
		public function HandleAttackRadius():void { }
		
		public function HandleMovementX():void
		{
			if ( x == goToX )
			{
				xMovementHandled = true;
				moveCommand = false;
			}
			
			else 
			{
				Wait();
			
				if ( doneWaiting )
				{
					x += (directionX * 1);
					// Play sprite animation here
				}
				
				doneWaiting = false;
			}
		}
		
		public function HandleMovementY():void
		{
			if ( y == goToY )
			{
				turnJustEnded = true;
				xMovementHandled = false;
			}
			
			else 
			{
				Wait();
			
				if ( doneWaiting )
				{
					y += (directionY * 1);
					// Play sprite animation here
				}
				
				doneWaiting = false;
			}
		}
		
		/*
		 * Wait 1.5 seconds to "think".
		 */
		public function Wait():void
		{	
			time++;
			
			/*
			 * Main adds our MyWorld, using 60 frames per second.
			 * Update gets called once per frame.
			 */ 
			
			if ( time == 1 )
			{
				time = 0;
				doneWaiting = true;
			}
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
				//HandleMovement();
				HandleMovementX();
			}
			
			if ( xMovementHandled )
			{
				HandleMovementY();
			}
			
			if ( attackRadius )
			{
				HandleAttackRadius();
			}
			
			if ( attackRadiusHandled )
			{
				attackRadius = false;
			}
		
			if ( attackCommand )
			{
				Attack();
			}
			
			if ( turnJustEnded )
			{
				moveCommand = false;
				xMovementHandled = false;
				attackCommand = false;
				EndTurn();
			}
		
			/*
			 * Gonna change up the whole movement process. Now the players just 
			 * move immediately to their destination, which is seen as them dissapearing
			 * and reappearing at their destination. We ideally should have the process take time
			 * so we can play their walking animations.
			 */
			
		}
			
	}
}
