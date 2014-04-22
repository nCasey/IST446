package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	public class Player2 extends Players
	{
		// Player.png is 20x40 pixels
		[Embed(source = "../Images/player2.png")] private const PLAYER2:Class;
		
		public function Player2(X:Number, Y:Number)
		{
			setHitbox(32, 32);
			graphic = new Image(PLAYER2);
			layer = 1;
			turnJustEnded = false;
			
			name = "Player 2";
			nextUp = "Player 3";
			nextNextUp = "Enemey 1";
			
			type = "player";
			
			// necesarry???
			super(X, Y, name, nextUp, nextNextUp);
		}
		
		/*
		 * Player 2 gets a two tile movement range.
		 */
		override public function HandleMovementRadius():void 
		{
			MyWorld.instance.AddRadius2(x, y);
			MyWorld.instance.AddMoveHereBlock(x, y);
			
			// Parent class "Players" will take care of the actual movement
			// once we set this flag to true
			moveRadiusHandled = true;
		}
		
	}
}