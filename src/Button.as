package 
{
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
	import MyWorld;
	
	public class Button extends Entity 
	{
		
		[Embed(source = "../Images/button.png")] private static const BUTTON:Class;
		[Embed(source = "../Images/buttonDown.png")] public static const BUTTON_DOWN:Class;
		[Embed(source = "../Images/buttonHover.png")]  public static const BUTTON_HOVER:Class;
		
		protected var clicked:Boolean = false;
		
		protected var normal:Graphic;
		protected var hover:Graphic;
		protected var down:Graphic;
		
		protected var label:Text;
		
		public function Button(x:Number = 0, y:Number = 0, text:String = "") //(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			
			// So we can reference the button's width in the text constructor
			var normalStamp:Stamp  = new Stamp(BUTTON);
			
			// crazy constructor incumming
			label = new Text(text, 10, 0, { size: 10, color: 0x000000, width: normalStamp.width - 30, wordWrap: true, align: "center" } );
			// center the text
			label.y = (normalStamp.height - label.textHeight) * 0.5;
			
			normal = new Graphiclist(normalStamp, label);
			hover = new Graphiclist(new Stamp(BUTTON_HOVER), label);
			down = new Graphiclist(new Stamp(BUTTON_DOWN), label);
			
			graphic = normal;
			setHitboxTo(normalStamp);
		}
		
		public function destroy():void
		{
			FP.world.remove(this); 
		}
		
		override public function update():void
        {
            super.update();
             
            if (collidePoint(x, y, world.mouseX, world.mouseY))
            {	
                if (Input.mousePressed )
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
         
        /*protected function click():void
        {
			if ( buttonType == TYPE_ONE )
			{
				FP.screen.color = Math.random() * 0xFFFFFF;
				trace("click!");
			}
			
			else if ( buttonType == TYPE_TWO )
			{
				// send word to MyWorld that we need to start playing
				MyWorld.instance.Start();
			}
        }*/
			
			// will be implemented by descendant classes
			public function click():void {}
		
	}

}