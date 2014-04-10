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
		
		private var player1:Player;
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
			add(new Player(100, 400));
			add(new Button(1024 - 100, 0, "Change background color!", TYPE_ONE));
			add(new Button(1024 - 200, 0, "Change background color!", TYPE_ONE));
			add(new Button(1024 - 100, 100, "Change background color!", TYPE_ONE));
			add(new Button(1024 - 200, 100, "Change background color!", TYPE_ONE));
		}
		
		
		
	} // end Class 
} // end package
