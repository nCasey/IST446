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
		
		public var HP:int;
		public var AD:int;
		
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
		
		/*
		 * MoveHereBlock will set flag that triggers this movement.
		 * It will also set the values for goToX and goToY
		 */
		public function HandleMovement():void
		{
			moveTo(goToX, goToY);
			
			turnJustEnded = true;
		}
		
		public function HandleMovementRadius():void { }
		
		public function HandleAttackRadius():void{}
		
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
				attackCommand = false;
				EndTurn();
			}
		}
			
	}
}
