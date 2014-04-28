package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.Sfx;
	
	public class Enemy extends Entity
	{
		// Player.png is 20x40 pixels
		[Embed(source = "../Images/Anubis.png")] private const ENEMY1:Class;
		[Embed(source = "../Images/RussianSnakeGuy.png")] private const ENEMY2:Class;
		[Embed(source = "../Images/snake.png")] private const ENEMY3:Class;
		
		public var turnJustEnded:Boolean;
		public var nextUp:String;
		public var nextNextUp:String;
		public var time:int = 0;
		public var doneWaiting:Boolean = false;
		
		public var HP:int;
		public var MaxHP:int;
		public var AD:int;
		
		protected var sprite:Spritemap;
		
		public var up:Boolean = false;
		public var toRight:Boolean = false;
		public var toLeft:Boolean = false;
		public var down:Boolean = false;

		public var dice:Boolean = false;
		
		public var attackFlag:Boolean = false;
		public var attackRangeShown:Boolean = false;
		
		public var myCard:EnemyCard;
		
		// player we will attack
		var thePlayer:Entity;
		var thePlayerAsClassPlayer:Players;
		
		[Embed(source = "../Sounds/Attack2.mp3")] private const ATTACK:Class;
		
		public var attackSfx:Sfx = new Sfx(ATTACK);
	
		public function Enemy(X:Number, Y:Number, Name:String, Next:String, NextNext:String)
		{
			sprite = new Spritemap(ENEMY1, 32, 32);
			
			graphic = sprite;
			layer = 2;
			turnJustEnded = false;
			type = "enemy";
			name = Name; 
			nextUp = Next;
			nextNextUp = NextNext;
			setHitbox(32, 32);
			
			sprite.add("still", [1], 0, false);
			
			sprite.play("still");
			
			HP = 20;
			MaxHP = HP;
			AD = 10;
			
			super(X, Y);
		}
		
		public function destroy():void
		{
			myCard.suicide = true;
			FP.world.remove(this); 
		}
		
		public function takeTurnMove():void 
		{
			Wait();
			
			if ( doneWaiting )
			{
				Move();
			}
			
			doneWaiting = false;
		}
		
		public function TakeTurnAttack():void 
		{
			Wait();
			
			if ( doneWaiting )
			{
				Attack(thePlayerAsClassPlayer);
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
		
		public function Wait2():void
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
			attackSfx.play();
			p.TakeDamage(this.AD);
			attackFlag = false;
			turnJustEnded = true;
		}
		
		/*
		 * Move towards the nearest player. 
		 */
		public function Move():void
		{
			// nearestToEntity(entity type to check for, entity to find nearest from)
			var nearestPlayer:Entity = MyWorld.instance.nearestToEntity("player", this);
			
			// moveTowards((x of towards, y of towards, move amount, solidType to stop movement = NIL)
			//moveTowards(nearestPlayer.x, nearestPlayer.y, 32);
			
			var xDisplacement:Number = Math.abs(x - nearestPlayer.x);
			var yDisplacement:Number = Math.abs(y - nearestPlayer.y);
			
			if ( !collide("player", x + 32, y) && !collide("level", x + 32, y) && !collide("enemy", x + 32, y) )
			{
				toRight = true;
			}
			else { toRight = false; }
			
			if ( !collide("player", x - 32, y) && !collide("level", x - 32, y) && !collide("enemy", x - 32, y) )
			{
				toLeft = true;
			}
			else { toLeft = false; }
			
			if ( !collide("player", x, y + 32) && !collide("level", x, y + 32) && !collide("enemy", x, y + 32) )
			{
				down = true;
			}
			else { down = false; }
			
			if ( !collide("player", x, y - 32) && !collide("level", x, y - 32) && !collide("enemy", x, y - 32) )
			{
				up = true;
			}
			else { up = false; }
			
			// Horizontal 
			if ( xDisplacement > yDisplacement )
			{
				// left 
				if ( x > nearestPlayer.x )
				{
					if ( toLeft )
					{
						moveTo(x - 32, y);
						turnJustEnded = true;
					}
					// so if we cant go, try for the y direction
					else 
					{
						// up
						if ( y > nearestPlayer.y )
						{
							if ( up )
							{
								moveTo(x, y - 32);
								turnJustEnded = true;
							}
						}
						// down
						else if ( y <= nearestPlayer.y )
						{
							if ( down )
							{
								moveTo(x, y + 32);
								turnJustEnded = true;
							}
						}
						
						// otherwise give up
						else { turnJustEnded = true; }
					}
				}
				// right 
				else if ( x <= nearestPlayer.x )
				{
					if ( toRight )
					{
						moveTo(x + 32, y);
						turnJustEnded = true;
					}
					// so if we cant go, try for the y direction
					else 
					{
						// up
						if ( y > nearestPlayer.y )
						{
							if ( up )
							{
								moveTo(x, y - 32);
								turnJustEnded = true;
							}
						}
						// down
						else if ( y <= nearestPlayer.y )
						{
							if ( down )
							{
								moveTo(x, y + 32);
								turnJustEnded = true;
							}
						}
						
						else { turnJustEnded = true; }
					}
				}
			}
			
			// vertical 
			else if ( xDisplacement <= yDisplacement )
			{
				// up 
				if ( y > nearestPlayer.y )
				{
					if ( up )
					{
						moveTo(x, y - 32);
						turnJustEnded = true;
					}
					// so if we cant go, try for the x direction
					else 
					{
						// left
						if ( x > nearestPlayer.x )
						{
							if ( toLeft )
							{
								moveTo(x - 32, y);
								turnJustEnded = true;
							}
						}
						// right
						else if ( x <= nearestPlayer.x )
						{
							if ( toRight )
							{
								moveTo(x + 32, y);
								turnJustEnded = true;
							}
						}
						
						else { turnJustEnded = true; }
					}
				}
				// down 
				else if ( y <= nearestPlayer.y )
				{
					if ( down )
					{
						moveTo(x, y + 32);
						turnJustEnded = true;
					}
					// so if we cant go, try for the x direction
					else 
					{
						// left
						if ( x > nearestPlayer.x )
						{
							if ( toLeft )
							{
								moveTo(x - 32, y);
								turnJustEnded = true;
							}
						}
						// right
						else if ( x <= nearestPlayer.x )
						{
							if ( toRight )
							{
								moveTo(x + 32, y);
								turnJustEnded = true;
							}
						}
						
						else { turnJustEnded = true; }
					}
				}
			}
			
			turnJustEnded = true;
			
		}
		
		public function ShowAttackRange():void
		{
			MyWorld.instance.AddRadius2(x, y);
			attackRangeShown = true;
		}
		
		public function CheckAttackRange():void
		{	
			/*// the attackHereBlock
			var ahb:AttackHereBlock = MyWorld.instance.attackHereBlock;
			ahb.enemyAttacking = this;
			ahb.enemyAttackFlag = true;*/
			
			// start checking at a radius of 2
			
			if ( collide("player", x, y - 32) )
			{
				thePlayer = collide("player", x, y - 32);
			}
			else if ( collide("player", x - 32, y) )
			{
				thePlayer = collide("player", x - 32, y);
			}
			else if ( collide("player", x + 32, y) )
			{
				thePlayer = collide("player", x + 32, y);
			}
			else if ( collide("player", x, y + 32) )
			{
				thePlayer = collide("player", x, y + 32);
			}
			
			else if ( collide("player", x - 32, y - 32) )
			{
				thePlayer = collide("player", x - 32, y - 32);
			}
			else if ( collide("player", x + 32, y - 32) )
			{
				thePlayer = collide("player", x + 32, y - 32);
			}
			else if ( collide("player", x - 32, y + 32) )
			{
				thePlayer = collide("player", x - 32, y + 32);
			}
			else if ( collide("player", x + 32, y + 32) )
			{
				thePlayer = collide("player", x + 32, y + 32);
			}
			
			else if ( collide("player", x, y - 64) )
			{
				thePlayer = collide("player", x, y - 64);
			}
			else if ( collide("player", x - 64, y) )
			{
				thePlayer = collide("player", x - 64, y);
			}
			else if ( collide("player", x + 64, y) )
			{
				thePlayer = collide("player", x + 64, y);
			}
			else if ( collide("player", x, y + 64) )
			{
				thePlayer = collide("player", x, y + 64);
			}
			else
			{
				thePlayer = null;
			}
			
			if ( thePlayer != null )
			{
				thePlayerAsClassPlayer = MyWorld.instance.getInstance(thePlayer.name);
			}
		}
		
		override public function update():void
		{
			if ( (y > 640) || (y < 0) || (x < 0) || (x > 1024) )
			{
				this.destroy();
			}
			
			if ( MyWorld.currentTurn == this.name )
			{
				if ( !attackRangeShown )
				{
					ShowAttackRange();
				}
				CheckAttackRange();
				//takeTurnMove();
				if ( thePlayer != null )
				{
					attackFlag = true;
				}
				else
				{
					takeTurnMove();
				}
			}
			
			if ( attackFlag )
			{
				TakeTurnAttack();
			}
			
			if ( turnJustEnded )
			{
				turnJustEnded = false;
				attackRangeShown = false;
				
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
				
				//MyWorld.currentTurn = this.nextUp;
				//MyWorld.nextTurn = this.nextNextUp;
				MyWorld.instance.ChangeTurn();
			}
		}
	}
}



/*
			 * Idea: pass in 0 for one of the x or y params for moveTowards().
			 * Question is: how do we know if x or y is better?
			 * Maybe just determine randomly....
			 */
			
			//var diceRoll:int = Math.random(); // between 0 and 1
			
			
			
			/*// if we're gonna go horizontally
			if ( dice )
			{
				dice = !dice;
				
				//if were gonna go right
				if ( nearestPlayer.x > x )
				{
					x += 32;
					if ( collide("player", x, y) || collide("level", x, y) )
					{
						// undo
						x -= 32;
						//try again!
					}
					else
					{
						doneYet = true;
					}
				}
				
				// if were gonna go left
				else
				{
					dice = !dice;
					
					x -= 32;
					if ( collide("player", x, y) || collide("level", x, y) )
					{
						// undo
						x += 32;
						//try again!
						//Move();
					}
					
					else
					{
						doneYet = true;
					}
				}
			}
			// if were gonna go vertically
			else
			{
				//if were gonna go down
				if ( nearestPlayer.y > y )
				{
					y += 32;
					if ( collide("player", x, y) || collide("level", x, y) )
					{
						// undo
						y -= 32;
						//try again!
						//Move();
					}
					
					else
					{
						doneYet = true;
					}
				}
				
				// if were gonna go up
				else
				{
					y -= 32;
					if ( collide("player", x, y) || collide("level", x, y) )
					{
						// undo
						y += 32;
						//try again!
						//Move();
					}
					
					else
					{
						doneYet = true;
					}
				}
			}
			*/
			
			
			/*
			// Go horizontally
			if ( xDisplacement < yDisplacement )
			{
				// left
				if ( x > nearestPlayer.x )
				{
					// so if we cant go left, we dont set the turn just ended flag,
					// and this process happens again 
					if ( toLeft )
					{
						moveTo(x - 32, y);
						turnJustEnded = true;
					}
					
					else if ( toRight )
					{
						moveTo(x + 32, y);
						turnJustEnded = true;
					}
					else if ( down )
					{
						moveTo(x, y + 32);
						turnJustEnded = true;
					}
					else 
					{
						moveTo(x, y - 32);
						turnJustEnded = true;
					}
				}
				
				//right
				else
				{
					if ( toRight )
					{
						moveTo(x + 32, y);
						turnJustEnded = true;
					}
					else if ( toLeft )
					{
						moveTo(x - 32, y);
						turnJustEnded = true;
					}
					else if ( down )
					{
						moveTo(x, y + 32);
						turnJustEnded = true;
					}
					else 
					{
						moveTo(x, y - 32);
						turnJustEnded = true;
					}
				}
				
			}
			
			// Go vertically
			else
			{
				// up 
				if ( y > nearestPlayer.y )
				{
					if ( up )
					{
						moveTo(x, y - 32);
						turnJustEnded = true;
					}
					else if ( down )
					{
						moveTo(x, y + 32);
						turnJustEnded = true;
					}
					else if ( toRight )
					{
						moveTo(x + 32, y);
						turnJustEnded = true;
					}
					else if ( toLeft )
					{
						moveTo(x - 32, y);
						turnJustEnded = true;
					}
				}
				// down
				else
				{
					if ( down )
					{
						moveTo(x, y + 32);
						turnJustEnded = true;
					}
					else if ( up )
					{
						moveTo(x, y - 32);
						turnJustEnded = true;
					}
					else if ( toRight )
					{
						moveTo(x + 32, y);
						turnJustEnded = true;
					}
					else if ( toLeft )
					{
						moveTo(x - 32, y);
						turnJustEnded = true;
					}
				}
			}
			*/