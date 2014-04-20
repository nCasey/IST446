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
	
	public class TurnCounter extends Entity 
	{
		[Embed(source = "../Images/turnCounter.png")] private static const TURN:Class;
		
		protected var normal:Graphic;
		protected var theText:String;
		protected var label:Text;
		
		public function TurnCounter(x:Number = 0, y:Number = 0, text:String = "") //(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			
			// So we can reference the TurnCounter's width in the text constructor
			var image:Stamp  = new Stamp(TURN);
			
			theText = "Current Turn: " + text;
			
			// crazy constructor incumming
			label = new Text(theText, 10, 0, { size: 10, color: 0x000000, width: image.width - 30, wordWrap: true, align: "center" } );
			// center the text
			label.y = (image.height - label.textHeight) * 0.5;
			
			graphic = new Graphiclist(image, label);
			setHitboxTo(image);
		}
		
		public function destroy():void
		{
			FP.world.remove(this); 
		}
		 
		override public function update():void
        {
			theText = "Current Turn: " + MyWorld.currentTurn;
			
            label.text = theText;
		}
		
	}

}