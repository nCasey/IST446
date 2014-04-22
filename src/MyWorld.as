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
		
		private var playButton:Button;
		private var panel:Panel;
		
		/** The Singleton instance */
		public static var instance:MyWorld;
		
		public static var currentTurn:String;
		public static var nextTurn:String;
		public static var nextNextTurn:String;
		
		public var player1:Player1;
		public var player2:Player2;
		public var player3:Player3;
		
		// Now make an array containng 5 enemies
		public var enemyArray:Array;
		
		public var enemy1:Enemy;
		public var enemy2:Enemy;
		public var enemy3:Enemy;
		public var enemy4:Enemy;
		public var enemy5:Enemy;
		
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
			playButton = new Button(500, 300, "Play", TYPE_TWO);
			add(playButton);
		} 
		
		override public function update():void 
		{
			if ( currentTurn == "idle" )
			{
				currentTurn = "player1";
				nextTurn = "player2";
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
			player1 = new Player1(100, 200);
			add(player1);
			player2 = new Player2(100, 300);
			add(player2);
			player3 = new Player3(100, 400);
			add(player3);
			
			add(new Button(1024 - 100, 0, "Change background color!", TYPE_ONE));
			add(new Button(1024 - 200, 0, "Change background color!", TYPE_ONE));
			add(new Button(1024 - 100, 100, "Change background color!", TYPE_ONE));
			add(new Button(1024 - 200, 100, "Change background color!", TYPE_ONE));
			
			enemy1 = new Enemy(700, 100, "Enemy 1", "Enemy 2", "Enemy 3");
			enemy2 = new Enemy(700, 200, "Enemy 2", "Enemy 3", "Enemy 4");
			enemy3 = new Enemy(700, 300, "Enemy 3", "Enemy 4", "Enemy 5");
			enemy4 = new Enemy(700, 400, "Enemy 4", "Enemy 5", "idle");
			enemy5 = new Enemy(700, 500, 'Enemy 5', "idle", "player1");
			
			add(enemy1);
			add(enemy2);
			add(enemy3);
			add(enemy4);
			add(enemy5);
			
			enemyArray = new Array(enemy1, enemy2, enemy3, enemy4, enemy5);
			
			currentTurn = "player1";
			nextTurn = "player2";
			
			turnCounter = new TurnCounter(0, 0, currentTurn);
			add(turnCounter);
		}
	} // end Class 
} // end package
