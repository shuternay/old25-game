package
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	
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
		public var timer:Timer = new Timer(1000, 35);
		public static var THIS:Game;
		
		public function Game(_lvl:int)
		{
			THIS = this;
			
			level = _lvl;
			
			[Embed(source = "../res/map.png")] 
			var pic: Class;
			addChild(new pic);
			
			graph = new Graph(level);
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
			
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, onTick);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onComplete);
			timeLeft = 35;
		}
		
		private function onComplete(e:TimerEvent):void 
		{
			graph.fc.timer.stop();
			Main.THIS.showSmth(3);
		}
		
		private function onTick(e:TimerEvent):void 
		{
			timeLeft--;
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