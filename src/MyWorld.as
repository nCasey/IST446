package  
{
	
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Neil Casey
	 */
	 
	public class MyWorld extends World
	{	
		
		// Button Types
		public static const TYPE_ONE:Number = 1;
		public static const TYPE_TWO:Number = 2;
	
		private var level:Level;
		
		private var playButton:PlayButton;
		private var panel:Panel;
		
		/** The Singleton instance */
		public static var instance:MyWorld;
		
		public static var currentTurn:String;
		public static var nextTurn:String;
		public static var nextNextTurn:String;
		
		public var player1:Players;
		public var player2:Players;
		public var player3:Players;
		
		// Now make an array containng 5 enemies
		public var enemyArray:Array;
		
		public var enemy1:Enemy;
		public var enemy2:Enemy;
		public var enemy3:Enemy;
		public var enemy4:Enemy;
		public var enemy5:Enemy;
		
		// Max movement range = 3. So max number of moveBlocks is 24.
		// Draw a diagram to confirm.
		public var moveBlock1:MoveBlock;
		public var moveBlock2:MoveBlock;
		public var moveBlock3:MoveBlock;
		public var moveBlock4:MoveBlock;
		public var moveBlock5:MoveBlock;
		public var moveBlock6:MoveBlock;
		public var moveBlock7:MoveBlock;
		public var moveBlock8:MoveBlock;
		public var moveBlock9:MoveBlock;
		public var moveBlock10:MoveBlock;
		public var moveBlock11:MoveBlock;
		public var moveBlock12:MoveBlock;
		public var moveBlock13:MoveBlock;
		public var moveBlock14:MoveBlock;
		public var moveBlock15:MoveBlock;
		public var moveBlock16:MoveBlock;
		public var moveBlock17:MoveBlock;
		public var moveBlock18:MoveBlock;
		public var moveBlock19:MoveBlock;
		public var moveBlock20:MoveBlock;
		public var moveBlock21:MoveBlock;
		public var moveBlock22:MoveBlock;
		public var moveBlock23:MoveBlock;
		public var moveBlock24:MoveBlock;
		
		public var moveHereBlock:MoveHereBlock;
		
		public var turnCounter:TurnCounter;
		
		public function MyWorld() 
		{	
			instance = this;
			Init();
		}
		
		public function Init():void
		{
			panel = new Panel();
			add(panel);
			
			//The Play button will call Start() when clicked. 
			playButton = new PlayButton(500, 300, "Play");
			add(playButton);
		} 
		
		override public function update():void 
		{
			if ( currentTurn == "idle" )
			{
				currentTurn = "Player 1";
				nextTurn = "Player 2";
			}
			super.update();
		}
		
		public function Start():void
		{
			panel.destroy();
			playButton.destroy();
			Play();
		}
		
		public function Play():void
		{
			player1 = new Players(100, 200, "Player 1", "Player 2", "Player 3");
			add(player1);
			player2 = new Players(100, 300, "Player 2", "Player 3", "Enemy 1");
			add(player2);
			player3 = new Players(100, 400, "Player 3", "Enemy 1", "Enemy 2");
			add(player3);
			
			add(new MoveButton(1024 - 100, 0, "Move"));
			add(new AttackButton(1024 - 200, 0, "Attack"));
			//add(new Button(1024 - 100, 100, "Change background color!", TYPE_ONE));
			//add(new Button(1024 - 200, 100, "Change background color!", TYPE_ONE));
			
			enemy1 = new Enemy(700, 100, "Enemy 1", "Enemy 2", "Enemy 3");
			enemy2 = new Enemy(700, 200, "Enemy 2", "Enemy 3", "Enemy 4");
			enemy3 = new Enemy(700, 300, "Enemy 3", "Enemy 4", "Enemy 5");
			enemy4 = new Enemy(700, 400, "Enemy 4", "Enemy 5", "idle");
			enemy5 = new Enemy(700, 500, 'Enemy 5', "idle", "Player 1");
			
			add(enemy1);
			add(enemy2);
			add(enemy3);
			add(enemy4);
			add(enemy5);
			
			enemyArray = new Array(enemy1, enemy2, enemy3, enemy4, enemy5);
			
			currentTurn = "Player 1";
			nextTurn = "Player 2";
			
			turnCounter = new TurnCounter(0, 0, currentTurn);
			add(turnCounter);
		}
		
		// adds a 1 tile movement radius diamond centered at x,y
		public function AddRadius1(x:Number, y:Number):void
		{
			moveBlock1 = new MoveBlock(x, y - 32);
			moveBlock2 = new MoveBlock(x - 32, y);
			moveBlock3 = new MoveBlock(x + 32, y);
			moveBlock4 = new MoveBlock(x, y + 32);
			
			add(moveBlock1);
			add(moveBlock2);
			add(moveBlock3);
			add(moveBlock4);
		}
		
		public function AddMoveHereBlock(x:Number, y:Number):void
		{
			moveHereBlock = new MoveHereBlock(x + 32, y);
			add(moveHereBlock);
		}
	} // end Class 
} // end package
