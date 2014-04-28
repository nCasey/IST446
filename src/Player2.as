package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	public class Player2 extends Players
	{
		// Player.png is 20x40 pixels
		[Embed(source = "../Images/Sniper.png")] private const PLAYER2:Class;
		
		public var sprPLAYER2:Spritemap = new Spritemap(PLAYER2, 32, 32);
	
		
		
		// Player 2 is Sniper
		public function Player2(X:Number, Y:Number)
		{
			sprPLAYER2.add("walkRight", [6, 7, 8], 10, true);
			sprPLAYER2.add("walkLeft", [3, 4, 5], 10, true);
			sprPLAYER2.add("walkUp", [9, 10, 11], 10, true);
			sprPLAYER2.add("walkDown", [0, 1, 2], 10, true);
			sprPLAYER2.add("stand", [6], 10, false);
		
			sprPLAYER2.play("walkRight");
			
			
			setHitbox(32, 32);
			graphic = sprPLAYER2;
			layer = 1;
			turnJustEnded = false;
			
			name = "Player 2";
			nextUp = "Player 3";
			nextNextUp = "Enemey 1";
			
			type = "player";
			
			// necesarry???
			super(X, Y, name, nextUp, nextNextUp);
			
			HP = 15;
			AD = 15;
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
		
		/*
		 * Player 2 gets a two tile attack range.
		 */
		override public function HandleAttackRadius():void 
		{
			MyWorld.instance.AddRadius2(x, y);
			MyWorld.instance.AddAttackHereBlock(x, y);
			
			// Parent class "Players" will take care of the actual movement
			// once we set this flag to true
			attackRadiusHandled = true;
		}
		
	}
}