package  
{
	/**
	 * ...
	 * @author Neil Casey
	 */
	public class PlayButton extends Button 
	{
		
		public function PlayButton(x:Number=0, y:Number=0, text:String="") 
		{
			super(x, y, text);
		}
		
		override public function click():void
		{
			// send word to MyWorld that we need to start playing
			MyWorld.instance.Start();
		}
		
	}

}