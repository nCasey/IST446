package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	public class Enemy extends Entity
	{
		// Player.png is 20x40 pixels
		[Embed(source = "../Images/enemy.png")] private const ENEMY:Class;
		
		public var turnJustEnded:Boolean;
		public var nextUp:String;
		public var nextNextUp:String;
		public var time:int = 0;
		public var doneWaiting:Boolean = false;

		public function Enemy(X:Number, Y:Number, Name:String, Next:String, NextNext:String)
		{
			super(X, Y);
			graphic = new Image(ENEMY);
			layer = 1;
			turnJustEnded = false;
			type = "enemy";
			name = Name; 
			nextUp = Next;
			nextNextUp = NextNext;
		}
		
		public function destroy():void
		{
			FP.world.remove(this); 
		}
		
		public function takeTurn():void 
		{
			Wait();
			
			if ( doneWaiting )
			{
				Move();
			}
			
			doneWaiting = false;
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
			
			if ( time == 90 )
			{
				time = 0;
				doneWaiting = true;
			}
		}
		
		/*
		 * Move towards the nearest player. 
		 */
		public function Move():void
		{
			// nearestToEntity(entity type to check for, entity to find nearest from)
			var nearestPlayer:Entity = MyWorld.instance.nearestToEntity("player", this);
			
			// moveTowards((x of towards, y of towards, move amount, solidType to stop movement = NIL)
			moveTowards(nearestPlayer.x, nearestPlayer.y, 32);
			
			turnJustEnded = true;
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
			
			if ( MyWorld.currentTurn == this.name )
			{
				takeTurn();
			}
			
			if ( turnJustEnded )
			{
				turnJustEnded = false;
				MyWorld.currentTurn = this.nextUp;
				MyWorld.nextTurn = this.nextUp;
			}
		}
	}
}