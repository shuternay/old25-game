package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Shuternay
	 */
	public class Game extends Sprite
	{
		public var tools:Sprite = new Sprite();
		public var graph:Graph;
		public var level:int;
		private var _timeLeft:Number;
		public var timeLeftTF:TextField = new TextField();
		public static var THIS:Game;
		
		public function Game(_lvl:int) 
		{
			THIS = this;
			
			level = _lvl;
			
			graph = new Graph(level);
			graph.x = 30;
			graph.y = 30;
			addChild(graph);
			
			timeLeftTF.mouseEnabled = false;
			tools.addChild(timeLeftTF);
			tools.x = 600;
			addChild(tools);
		}
		
		public function get timeLeft():Number 
		{
			return _timeLeft;
		}
		
		public function set timeLeft(value:Number):void 
		{
			_timeLeft = value;
			timeLeftTF.text = "Time left: " + value;
		}
		
	}

}