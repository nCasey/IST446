package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Neil Casey
	 */
	public class Card extends Entity 
	{
		protected var theText1:String;
		protected var theText2:String;
		protected var label:Text;
		public var image:Stamp;
		public var thePlayer:Players;
		public var suicide:Boolean = false;
		
		[Embed(source = "../Images/player1card.png")] private static const ONE:Class;
		[Embed(source = "../Images/player2card.png")] private static const TWO:Class;
		[Embed(source = "../Images/player3card.png")] private static const THREE:Class;
		
		/*
		 * Card for players.
		 */ 
		public function Card(x:Number, y:Number, myType:String, aName:String) 
		{
			super(x, y, graphic);
			
			if ( myType == "one" )
			{
				image = new Stamp(ONE);
			}
			else if ( myType == "two" )
			{
				image = new Stamp(TWO);
			}
			else if ( myType == "three" )
			{
				image = new Stamp(THREE);
			}
			
			thePlayer = MyWorld.instance.getInstance(aName);
			
			theText1 = "HP: " + thePlayer.HP + "/" + thePlayer.MaxHP;
			theText2 = "AD: " + thePlayer.AD;
			
			label = new Text(theText1 + "\n" + theText2, 10, 10, { size: 21, color: 0x000000, width: image.width - 30, wordWrap: true, align: "right" } );
			
			graphic = new Graphiclist(image, label);
			
			thePlayer.myCard = this;
		}
		
		override public function update():void
		{
			if ( suicide )
			{
				this.destroy();
			}
			else
			{
				theText1 = "HP: " + thePlayer.HP + "/" + thePlayer.MaxHP;
				theText2 = "AD: " + thePlayer.AD;
				
				label = new Text(theText1 + "\n" + theText2, 10, 10, { size: 21, color: 0x000000, width: image.width - 30, wordWrap: true, align: "right" } );
				
				graphic = new Graphiclist(image, label);
			}
		}
		
		public function destroy():void
		{
			FP.world.remove(this); 
		}
	}

}