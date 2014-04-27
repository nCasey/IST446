package  
{
	/**
	 * ...
	 * @author Neil Casey
	 */
	public class CancelButton extends Button 
	{
		
		public function CancelButton(x:Number=0, y:Number=0) 
		{
			super(x, y, "Cancel");
		}
		
		/*
		 * Removes all of the MoveBlocks in the world, as well as the moveHereBlock.
		 */
		override public function click():void
		{
			if ( MyWorld.instance.currentCommand == "attack" )
			{
				MyWorld.instance.attackHereBlock.destroy();
			}
			else if ( MyWorld.instance.currentCommand == "move" )
			{
				MyWorld.instance.moveHereBlock.destroy();
			}
			var turn:String = MyWorld.currentTurn;
			var thisPlayer:Players = MyWorld.instance.getInstance(turn);
			
			// Player 1 only has 4 moveBlocks
			if ( thisPlayer.name == "Player 1" )
			{
				MyWorld.instance.moveBlock1.suicide = true;
				MyWorld.instance.moveBlock2.suicide = true;
				MyWorld.instance.moveBlock3.suicide = true;
				MyWorld.instance.moveBlock4.suicide = true;
			}
			
			// Player 2 has 12 moveBlocks
			else if ( thisPlayer.name == "Player 2" )
			{
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
			}
			
			// Player 3 has 24 moveBlocks
			else if ( thisPlayer.name == "Player 3" )
			{
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
				
				MyWorld.instance.moveBlock13.suicide = true;
				MyWorld.instance.moveBlock14.suicide = true;
				MyWorld.instance.moveBlock15.suicide = true;
				MyWorld.instance.moveBlock16.suicide = true;
				
				MyWorld.instance.moveBlock17.suicide = true;
				MyWorld.instance.moveBlock18.suicide = true;
				MyWorld.instance.moveBlock19.suicide = true;
				MyWorld.instance.moveBlock20.suicide = true;
				
				MyWorld.instance.moveBlock21.suicide = true;
				MyWorld.instance.moveBlock22.suicide = true;
				MyWorld.instance.moveBlock23.suicide = true;
				MyWorld.instance.moveBlock24.suicide = true;
			}
		}
		
	}

}