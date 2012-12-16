package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Shuternay
	 */
	public class Game extends Sprite
	{
		public var field:Sprite = new Sprite();
		public var graph:Graph;
		public var level:int;
		
		public function Game(_lvl:int) 
		{
			level = _lvl;
			graph = new Graph(level);
			addChild(graph);
			/*
			init();
			drawGView();
			addChild(field);
			addChild(tools);
			field.addChild(gView);*/
		}
		
	}

}