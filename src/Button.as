package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Stamp;
	/*
	 * Stamp is like Image, but takes up less memory.
	 * Images can be 
	 * */
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	public class Button extends Entity 
	{
		
		[Embed(source = "../Images/button.png")] private static const BUTTON:Class;
		[Embed(source = "../Images/buttonDown.png")] public static const BUTTON_DOWN:Class;
		[Embed(source="../Images/buttonHover.png")]  public static const BUTTON_HOVER:Class;
		
		protected var clicked:Boolean = false;
		
		protected var normal:Graphic;
		protected var hover:Graphic;
		protected var down:Graphic;
		
		public function Button(x:Number = 0, y:Number = 0) //(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			
			normal = new Stamp(BUTTON);
			hover = new Stamp(BUTTON_HOVER);
			down = new Stamp(BUTTON_DOWN);
    
			graphic = normal;
			setHitboxTo(graphic);
		}
		
		override public function update():void
        {
            super.update();
             
            if (collidePoint(x, y, world.mouseX, world.mouseY))
            {
                if (Input.mousePressed)
				{
					clicked = true;
				}
				
				if (clicked)
				{
					graphic = down;
				}
				
				else 
				{
					graphic = hover;
				}
				
				if (clicked && Input.mouseReleased) 
				{
					click();
					clicked = false;
				}
            }
			
			else
			{
				graphic = normal;
			}
        }
         
        protected function click():void
        {
            FP.screen.color = Math.random() * 0xFFFFFF;
            trace("click!");
        }
		
	}

}