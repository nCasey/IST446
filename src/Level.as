package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Grid;
	
	/**
	 * ...
	 * @author Neil Casey
	 */
	public class Level extends Entity 
	{
		//[Embed(source = "../Images/tileSet.png")] private const LEVEL:Class;
		[Embed(source = "../Images/Map2wGrid.png")] private const LEVEL:Class;
		
		private var tiles:Tilemap;
		private var grid:Grid;
		private var tileSet:Image;
		
		public function Level(X:Number, Y:Number) //(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Image(LEVEL);
			
			type = "level";
			
			layer = 2;
			
			x = X;
			y = Y;
			
			grid = new Grid(1024, 640, 32, 32, 0, 0);
			
			mask = grid;
			
			grid.setRect(2, 0, 5, 6, true); //col,row,width,height,solid(boolean)
			grid.setRect(9, 0, 3, 4, true);
			grid.setRect(14, 2, 3, 4, true);
			grid.setRect(5, 7, 4, 4, true);
			grid.setRect(10, 6, 4, 6, true);
			grid.setRect(9, 13, 3, 4, true);
		}
		
		override public function update():void 
		{
		}
		
	}

}