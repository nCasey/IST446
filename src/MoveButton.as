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
				
				thisPlayer.moveCommand = true;
			}
			
		}
		
	}

}