package  
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author Neil Casey
	 */
	public class MoveButton extends Button
	{
		
		public function MoveButton(x:Number = 0, y:Number = 0, text:String = "") 
		{
			super(x, y, text);
		}
		
		override public function click():void
		{
			// How do we prevent multpiple clicks?
			// Probe the world to see if there is a MoveHereBlock existing within it.
			// If there is, then we shouldnt click again -> it worked :)
			
			var moveHereBlockCount:int = MyWorld.instance.classCount(MoveHereBlock);
			var attackHereBlockCount:int = MyWorld.instance.classCount(AttackHereBlock);
			
			if ( (attackHereBlockCount == 0) && (moveHereBlockCount == 0) )
			{
				// Add a cancel button
				MyWorld.instance.AddCancelButton();
				
				var turn:String = MyWorld.currentTurn;
				
				/*
				 * currentTurn should only take on values that are 
				 * the name fields of all the player and enemy entities.
				 */
				
				//getInstance(name) returns the entity with that name
				
				//if its an enemy
				if ( (turn == "Enemy 1") || (turn == "Enemy 2") || (turn == "Enemy 3") ||
						(turn == "Enemy 4") || (turn == "Enemy 5") ) 
				{
					
				}
				
				//if its a player
				else if ( (turn == "Player 1") || (turn == "Player 2") || (turn == "Player 3") )
				{
					var thisPlayer:Players = MyWorld.instance.getInstance(turn);
					
					thisPlayer.moveRadius = true;
				}
			}
		}
		
	}

}