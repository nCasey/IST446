package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	public class Player1 extends Players
	{
		[Embed(source = "../Images/player1.png")] private const PLAYER1:Class;
		
		// Player 1 is Heavy
		public function Player1(X:Number, Y:Number)
		{
			setHitbox(32, 32);
			graphic = new Image(PLAYER1);
			layer = 1;
			turnJustEnded = false;
			
			name = "Player 1";
			nextUp = "Player 2";
			nextNextUp = "Player 3";
			
			type = "player";
			
			// is this even necessary?????
			super(X, Y, name, nextUp, nextNextUp);
			
			HP = 25;
			AD = 5;
		}
		
		/*
		 * Player 1 gets a one tile movement range.
		 */
		override public function HandleMovementRadius():void 
		{
			MyWorld.instance.AddRadius1(x, y);
			MyWorld.instance.AddMoveHereBlock(x, y);
			
			// Parent class "Players" will take care of the actual movement
			// once we set this flag to true
			moveRadiusHandled = true;
		}
		
		/*
		 * Player 1 gets a two tile attack range.
		 */
		override public function HandleAttackRadius():void 
		{
			MyWorld.instance.AddRadius1(x, y);
			MyWorld.instance.AddAttackHereBlock(x, y);
			
			// Parent class "Players" will take care of the actual movement
			// once we set this flag to true
			attackRadiusHandled = true;
		}
		
		
	}
}