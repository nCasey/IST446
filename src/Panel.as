package 
{
	/*
	 * NOTE::::::
	 * Might just get rid of this class and use just buttons.
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Stamp;
	/*
	 * Stamp is like Image, but takes up less memory.
	 * Images can be 
	 * */
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	public class Panel extends Entity
	{
		[Embed(source = "../Images/Panel.png")] private static const PANEL:Class;
		
		public function Panel(x:Number = 0, y:Number = 0)
		{
			super(x, y, graphic, mask);
			
			var stamp:Stamp  = new Stamp(PANEL);
			
			graphic = stamp;
			
			setHitboxTo(stamp);	
			
			layer = 1;
		}
		
		public function destroy():void
		{
			FP.world.remove(this); 
		}
	}
}