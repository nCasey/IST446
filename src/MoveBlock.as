package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Neil Casey
	 */
	public class MoveBlock extends Entity 
	{
		[Embed(source = "../Images/moveBlock.png")] private const BLOCK:Class;
		
		public var suicide:Boolean = false;
		public var theImage:Image;
	
		public function MoveBlock(x:Number=0, y:Number=0) 
		{
			theImage = new Image(BLOCK);
			
			// try changing the graphics 'alpha' field
			// to mess with opacity
			theImage.alpha = 0.5; // on a scale from 0 - 1
			
			graphic = theImage;
			
			type = "radius";
			
			setHitbox(32, 32);
			
			layer = 2;
			
			super(x, y, graphic);
		}
		
		public function destroy():void
		{
			FP.world.remove(this); 
		}
		
		override public function update():void
		{
			// suicide flag is set by moveHereBlock when the player commits to a move
			if ( suicide )
			{
				destroy();
			}
		}
		
	}

}