package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	
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
		public var snwRmvBtn:AbBtn;
		public var crashBtn:AbBtn;
		public var curAb:int = -1;
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
			
			snwRmvBtn = new AbBtn("Snow removal", 0xffff00);
			snwRmvBtn.y = 40;
			tools.addChild(snwRmvBtn);
			snwRmvBtn.addEventListener(MouseEvent.CLICK, onClick);
			
			crashBtn = new AbBtn("Crash", 0xff0000);
			crashBtn.y = 90;
			tools.addChild(crashBtn);
			crashBtn.addEventListener(MouseEvent.CLICK, onClick);
			
			tools.x = 600;
			addChild(tools);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			switch (e.currentTarget)
			{
				case snwRmvBtn:
					curAb = 1;
					break;
				case crashBtn:
					curAb = 2;
					break;
			}
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