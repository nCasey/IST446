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
		private var player1:Player;
		private var level:Level;
		
		public function MyWorld() 
		{	
			Init();
		}
		
		public function Init():void
		{
			//add(new Level());
			add(new Player(100, 400));
			add(new Button(100, 100));
		} 
		
		
		
	} // end Class 
} // end package
