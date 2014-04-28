package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Neil Casey
	 */
	public class Menu extends Entity 
	{
		[Embed(source = "../Images/menu.png")] private static const MENU:Class;
		
		public var clicked:Boolean = false;
		
		public function Menu(x:Number=0, y:Number=0)
		{
			super(x, y);
			
			graphic = new Image(MENU);
		}
		
		public function click():void 
		{
			this.destroy();
			MyWorld.instance.Intro();
		}
		
		public function destroy():void
		{
			FP.world.remove(this); 
		}
		
		override public function update():void
		{
			if ( collideRect(world.mouseX, world.mouseY, 400, 0, 40, 145) )
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