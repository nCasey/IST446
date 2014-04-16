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
		
		private var player1:Player1;
		private var level:Level;
		
		private var playButton:Button;
		private var panel:Panel;
		
		/** The Singleton instance */
		public static var instance:MyWorld;
		
		public function MyWorld() 
		{	
			instance = this;
			Init();
		}
		
		public function Init():void
		{
			panel = new Panel();
			add(panel);
			playButton = new Button(500, 300, "Play", TYPE_TWO);
			add(playButton);
		} 
		
		override public function update():void 
		{
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
			add(new Player1(100, 400, true));
			add(new Player2(100, 500));
			add(new Player3(100, 200));
			add(new Button(1024 - 100, 0, "Change background color!", TYPE_ONE));
			add(new Button(1024 - 200, 0, "Change background color!", TYPE_ONE));
			add(new Button(1024 - 100, 100, "Change background color!", TYPE_ONE));
			add(new Button(1024 - 200, 100, "Change background color!", TYPE_ONE));
			Player1Turn();
		}
		
		public function Player1Turn(): void
		{
			Player1.turnOver = false;
			Player1.turn = true;
			
			if (Player1.turnOver)
			{
				Player2Turn();
			}
		}
		
		public function Player2Turn(): void
		{
			Player2.turnOver = false;
			Player2.turn = true;
			
			if (Player2.turnOver)
			{
				Player3Turn();
			}
		}
		
		public function Player3Turn(): void
		{
			Player3.turnOver = false;
			Player3.turn = true;
			
			if (Player3.turnOver)
			{
				Player1Turn();
			}
		}
		
		
		
	} // end Class 
} // end package
