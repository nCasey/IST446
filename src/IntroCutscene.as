package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Neil Casey
	 */
	public class IntroCutscene extends Entity 
	{
		
		[Embed(source = "../Images/introCutscene.png")] private static const INTRO:Class;
		
		public var clicked:Boolean = false;
		
		public function IntroCutscene(x:Number=0, y:Number=0)
		{
			super(x, y);
			
			setHitbox(1024, 640);
			
			graphic = new Image(INTRO);
		}
		
		public function click():void
		{
			this.destroy();
			MyWorld.instance.Start();
		}
		
		public function destroy():void
		{
			FP.world.remove(this); 
		}
		
		override public function update():void
		{
			if ( collidePoint(x, y, world.mouseX, world.mouseY) )
            {	
                if (Input.mousePressed )
				{
					clicked = true;
				}
				
				if (clicked && Input.mouseReleased) 
				{
					click();
					clicked = false;
				}
            }
		}
		
	}

}