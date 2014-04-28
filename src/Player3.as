package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	public class Player3 extends Players
	{
		// Player.png is 20x40 pixels
		[Embed(source = "../Images/Trapper.png")] private const PLAYER3:Class;
		
		public var sprPLAYER3:Spritemap = new Spritemap(PLAYER3, 32, 48);
		
		// Player 3 is Hacker
		public function Player3(X:Number, Y:Number)
		{
			sprPLAYER3.add("walkRight", [6, 7, 8], 10, true);
			sprPLAYER3.add("walkLeft", [3, 4, 5], 10, true);
			sprPLAYER3.add("walkUp", [9, 10, 11], 10, true);
			sprPLAYER3.add("walkDown", [0, 1, 2], 10, true);
			sprPLAYER3.add("stand", [6], 10, false);
		
			sprPLAYER3.play("walkRight");
			
			setHitbox(32, 32);
			graphic = sprPLAYER3;
			layer = 1;
			turnJustEnded = false;
			
			name = "Player 3";
			nextUp = "Enemy 1";
			nextNextUp = "Enemy 2";
			
			type = "player";
			
			// is this even necessary?????
			super(X, Y, name, nextUp, nextNextUp);
			
			HP = 20;
			AD = 10;
		}
		
		/*
		 * Player 3 gets a three tile movement range.
		 */
		override public function HandleMovementRadius():void 
		{
			MyWorld.instance.AddRadius3(x, y);
			MyWorld.instance.AddMoveHereBlock(x, y);
			
			// Parent class "Players" will take care of the actual movement
			// once we set this flag to true
			moveRadiusHandled = true;
		}
		
		/*
		 * Player 3 gets a three tile attack range.
		 */
		override public function HandleAttackRadius():void 
		{
			MyWorld.instance.AddRadius3(x, y);
			MyWorld.instance.AddAttackHereBlock(x, y);
			
			// Parent class "Players" will take care of the actual movement
			// once we set this flag to true
			attackRadiusHandled = true;
		}
	}
}