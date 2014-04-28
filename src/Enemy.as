package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	public class Enemy extends Entity
	{
		// Player.png is 20x40 pixels
		[Embed(source = "../Images/Anubis.png")] private const ENEMY:Class;
		
		public var sprENEMY:Spritemap = new Spritemap(ENEMY, 32, 32);
		
		public var turnJustEnded:Boolean;
		public var nextUp:String;
		public var nextNextUp:String;
		public var time:int = 0;
		public var doneWaiting:Boolean = false;
		
		public var HP:int;
		public var AD:int;

		public function Enemy(X:Number, Y:Number, Name:String, Next:String, NextNext:String)
		{
			
			sprENEMY.add("walkRight", [6, 7, 8], 10, true);
			sprENEMY.add("walkLeft", [3, 4, 5], 10, true);
			sprENEMY.add("walkUp", [9, 10, 11], 10, true);
			sprENEMY.add("walkDown", [0, 1, 2], 10, true);
			sprENEMY.add("stand", [6], 10, false);
		
			sprENEMY.play("walkLeft");
			
			graphic = sprENEMY;
			layer = 2;
			turnJustEnded = false;
			type = "enemy";
			name = Name; 
			nextUp = Next;
			nextNextUp = NextNext;
			setHitbox(32, 32);
			
			HP = 5;
			AD = 5;
			
			super(X, Y);
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
		 * Wait a short time. Used by Death Animation.
		 */
		public function Wait2():void
		{
			time++;
			
			/*
			 * Main adds our MyWorld, using 60 frames per second.
			 * Update gets called once per frame.
			 */ 
			
			if ( time == 20 )
			{
				time = 0;
				doneWaiting = true;
			}
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
		
		/*
		 * 
		 */ 
		public function Attack(p:Players):void
		{
			p.TakeDamage(this.AD);
		}
		
		/*
		 * Move towards the nearest player. 
		 * TODO: make it so the enemy can only move horizontal/vertical. The moveTowards
		 * method will move it diagoally if appropriate.  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		 */
		public function Move():void
		{
			// nearestToEntity(entity type to check for, entity to find nearest from)
			var nearestPlayer:Entity = MyWorld.instance.nearestToEntity("player", this);
			
			// moveTowards((x of towards, y of towards, move amount, solidType to stop movement = NIL)
			moveTowards(nearestPlayer.x, nearestPlayer.y, 32);
			
			/*
			 * Idea: pass in 0 for one of the x or y params for moveTowards().
			 * Question is: how do we know if x or y is better?
			 */
			
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
				//MyWorld.currentTurn = this.nextUp;
				//MyWorld.nextTurn = this.nextNextUp;
				MyWorld.instance.ChangeTurn();
			}
		}
	}
}