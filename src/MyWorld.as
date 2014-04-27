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
		
		public var player1:Player1;
		public var player2:Player2;
		public var player3:Player3;
		
		public var enemy1:Enemy;
		public var enemy2:Enemy;
		public var enemy3:Enemy;
		public var enemy4:Enemy;
		public var enemy5:Enemy;
		
		public var cancelButton:CancelButton;
		
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
		
		public var attackHereBlock:AttackHereBlock;
		
		public var turnCounter:TurnCounter;
		
		public var currentCommand:String;
		
		public var turnVector:Vector.<String>;// = Vector.<String>(["Player 1", "Player 2", "Player 3", "Enemy 1", "Enemy 2", "Enemy 3", "Enemy 4", "Enemy 5", "idle"]);
		public static var currentTurn:String;// = turnVector[0];
		public static var nextTurn:String;
		public static var nextNextTurn:String;
		public static var currentTurnIndex:int = 0;
		
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
			
			// This one doesn't seem to be working?
			// When the current turn is enemy 5, the ticker says
			// "next Turn: null"  so I'm trying to stop that here
			else if ( currentTurn == "Enemey 5" )
			{
				nextTurn = "Player 1";
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
			player1 = new Player1(7 * 32, 7 * 32); // , "Player 1", "Player 2", "Player 3");
			add(player1);
			player2 = new Player2(7 * 32, 9 * 32); //, "Player 2", "Player 3", "Enemy 1");
			add(player2);
			player3 = new Player3(7 * 32, 11 * 32); // , "Player 3", "Enemy 1", "Enemy 2");
			add(player3);
			
			add(new Level);
			
			turnVector = new Vector.<String>();
			turnVector[0] = "Player 1";
			turnVector[1] = "Player 2";
			turnVector[2] = "Player 3";
			turnVector[3] = "Enemy 1";
			turnVector[4] = "Enemy 2";
			turnVector[5] = "Enemy 3";
			turnVector[6] = "Enemy 4";
			turnVector[7] = "Enemy 5";
			turnVector[8] = "idle";
			
			add(new MoveButton(1024 - 100, 0, "Move"));
			add(new AttackButton(1024 - 200, 0, "Attack"));
			//add(new Button(1024 - 100, 100, "Change background color!", TYPE_ONE));
			//add(new Button(1024 - 200, 100, "Change background color!", TYPE_ONE));
			
			enemy1 = new Enemy(10 * 32, 5 * 32, "Enemy 1", "Enemy 2", "Enemy 3");
			enemy2 = new Enemy(10 * 32, 7 * 32, "Enemy 2", "Enemy 3", "Enemy 4");
			enemy3 = new Enemy(10 * 32, 9 * 32, "Enemy 3", "Enemy 4", "Enemy 5");
			enemy4 = new Enemy(10 * 32, 11 * 32, "Enemy 4", "Enemy 5", "idle");
			enemy5 = new Enemy(10 * 32, 13 * 32, 'Enemy 5', "idle", "Player 1");
			
			add(enemy1);
			add(enemy2);
			add(enemy3);
			add(enemy4);
			add(enemy5);
			
			//enemyArray = new Array(enemy1, enemy2, enemy3, enemy4, enemy5);
			
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
		
		// adds a 1 tile movement radius diamond centered at x,y
		public function AddRadius2(x:Number, y:Number):void
		{
			moveBlock1 = new MoveBlock(x, y - 32);
			moveBlock2 = new MoveBlock(x - 32, y);
			moveBlock3 = new MoveBlock(x + 32, y);
			moveBlock4 = new MoveBlock(x, y + 32);
			
			moveBlock5 = new MoveBlock(x - 32, y - 32);
			moveBlock6 = new MoveBlock(x + 32, y - 32);
			moveBlock7 = new MoveBlock(x - 32, y + 32);
			moveBlock8 = new MoveBlock(x + 32, y + 32);
			
			moveBlock9 = new MoveBlock(x, y - 64);
			moveBlock10 = new MoveBlock(x - 64, y);
			moveBlock11 = new MoveBlock(x + 64, y);
			moveBlock12 = new MoveBlock(x, y + 64);
			
			add(moveBlock1);
			add(moveBlock2);
			add(moveBlock3);
			add(moveBlock4);
			
			add(moveBlock5);
			add(moveBlock6);
			add(moveBlock7);
			add(moveBlock8);
			
			add(moveBlock9);
			add(moveBlock10);
			add(moveBlock11);
			add(moveBlock12);
		}
		
		// adds a 1 tile movement radius diamond centered at x,y
		public function AddRadius3(x:Number, y:Number):void
		{
			moveBlock1 = new MoveBlock(x, y - 32);
			moveBlock2 = new MoveBlock(x - 32, y);
			moveBlock3 = new MoveBlock(x + 32, y);
			moveBlock4 = new MoveBlock(x, y + 32);
			
			moveBlock5 = new MoveBlock(x - 32, y - 32);
			moveBlock6 = new MoveBlock(x + 32, y - 32);
			moveBlock7 = new MoveBlock(x - 32, y + 32);
			moveBlock8 = new MoveBlock(x + 32, y + 32);
			
			moveBlock9 = new MoveBlock(x, y - 64);
			moveBlock10 = new MoveBlock(x - 64, y);
			moveBlock11 = new MoveBlock(x + 64, y);
			moveBlock12 = new MoveBlock(x, y + 64);
			
			//////////////////////////////////////
			
			moveBlock13 = new MoveBlock(x - 32, y - 64);
			moveBlock14 = new MoveBlock(x + 32, y - 64);
			moveBlock15 = new MoveBlock(x - 32, y + 64);
			moveBlock16 = new MoveBlock(x + 32, y + 64);
			
			moveBlock17 = new MoveBlock(x, y - 96);
			moveBlock18 = new MoveBlock(x - 96, y);
			moveBlock19 = new MoveBlock(x + 96, y);
			moveBlock20 = new MoveBlock(x, y + 96);
			
			moveBlock21 = new MoveBlock(x - 64, y - 32);
			moveBlock22 = new MoveBlock(x + 64, y - 32);
			moveBlock23 = new MoveBlock(x - 64, y + 32);
			moveBlock24 = new MoveBlock(x + 64, y + 32);
			
			add(moveBlock1);
			add(moveBlock2);
			add(moveBlock3);
			add(moveBlock4);
			
			add(moveBlock5);
			add(moveBlock6);
			add(moveBlock7);
			add(moveBlock8);
			
			add(moveBlock9);
			add(moveBlock10);
			add(moveBlock11);
			add(moveBlock12);
			
			add(moveBlock13);
			add(moveBlock14);
			add(moveBlock15);
			add(moveBlock16);
			
			add(moveBlock17);
			add(moveBlock18);
			add(moveBlock19);
			add(moveBlock20);
			
			add(moveBlock21);
			add(moveBlock22);
			add(moveBlock23);
			add(moveBlock24);
		}
		
		public function AddMoveHereBlock(x:Number, y:Number):void
		{
			currentCommand = "move";
			moveHereBlock = new MoveHereBlock(x + 32, y);
			add(moveHereBlock);
		}
		
		public function AddCancelButton():void
		{
			cancelButton = new CancelButton(1024 - 100, 100);
			add(cancelButton);
		}
		
		public function AddAttackHereBlock(x:Number, y:Number):void
		{
			currentCommand = "attack";
			attackHereBlock = new AttackHereBlock(x + 32, y);
			add(attackHereBlock);
		}
		
		public function ChangeTurn():void
		{
			// so, the vector shift method removes the first element and returns it.
			// the push method adds the element in at the end,
			// so do a shift followed by a push
			
			//currentTurn = turnVector.shift();
			var justEnded:String = turnVector.shift();
			currentTurn = turnVector[0];
			nextTurn = turnVector[1];
			turnVector.push(justEnded);
		}
	} // end Class 
} // end package
