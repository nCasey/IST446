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
		[Embed(source = "../Images/firstMap2.png")] private const LEVEL:Class;
		
		private var tiles:Tilemap;
		private var grid:Grid;
		private var tileSet:Image;
		
		public function Level() //(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			// /*
			//graphic = new Image(LEVEL);
			// */
			
			type = "level";
			
			layer = 2;
			
			/*
			
			//super(x, y, graphic, mask); // what's this do? entity constructor I guess
			//tileSet = new Image(LEVEL);
			//tiles = new Tilemap(tileSet, 928, 544, 32, 32);
			tiles = new Tilemap(LEVEL, 800, 600, 32, 32);
			graphic = tiles;
			
			// set the tiles for all the rows and columns to start
			tiles.setRect(0, 0, 800 / 32, 600 / 32, 5);
			
			*/
			
			grid = new Grid(800, 600, 32, 32, 0, 0);
			
			mask = grid;
			grid.setRect(1, 7, 1, 7, true); //col,row,width,height,solid(boolean) ->whatever solid means
		}
		
		override public function update():void 
		{
		}
		
	}

}