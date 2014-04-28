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
	public class EnemyCard extends Entity 
	{
		protected var theText1:String;
		protected var theText2:String;
		protected var label:Text;
		public var image:Stamp;
		public var theEnemy:Enemy;
		
		public var suicide:Boolean = false;
		
		[Embed(source = "../Images/enemyCard.png")] private static const ONE:Class;
	
		public function EnemyCard(x:Number, y:Number, aName:String) 
		{
			super(x, y, graphic);
			
			image = new Stamp(ONE);
			
			theEnemy = MyWorld.instance.getInstance(aName);
			
			theText1 = "HP: " + theEnemy.HP + "/" + theEnemy.MaxHP;
			theText2 = "AD: " + theEnemy.AD;
			
			label = new Text(theText1 + "\n" + theText2, 10, 10, { size: 21, color: 0x000000, width: image.width - 30, wordWrap: true, align: "right" } );
			
			graphic = new Graphiclist(image, label);
			
			theEnemy.myCard = this;
		}
		
		override public function update():void
		{
			if ( suicide )
			{
				this.destroy();
			}
			else 
			{
				theText1 = "HP: " + theEnemy.HP + "/" + theEnemy.MaxHP;
				theText2 = "AD: " + theEnemy.AD;
				
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