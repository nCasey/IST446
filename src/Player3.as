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
		[Embed(source = "../Images/player3.png")] private const PLAYER3:Class;
		
		// Player 3 is Hacker
		public function Player3(X:Number, Y:Number)
		{
			setHitbox(32, 32);
			graphic = new Image(PLAYER3);
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