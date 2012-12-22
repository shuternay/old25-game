package
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
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
		public var tff:TextFormat = new TextFormat();
		public var snwRem:int = 10;
		public var crshRem:int = 5;
		public var snwBtn:AbBtn;
		public var crshBtn:AbBtn;
		public var curAb:int = 1;
		
		public static var TIME_NEED:Number = 300;
		
		public var timer:Timer = new Timer(1000, TIME_NEED);
		public static var THIS:Game;
		
		public function Game(_lvl:int)
		{
			THIS = this;
			
			level = _lvl;
			
			[Embed(source="../res/map.png")]
			var pic:Class;
			addChild(new pic);
			
			graph = new Graph(level);
			addChild(graph);
			
			timeLeftTF.mouseEnabled = false;
			tff.size = 30;
			tff.color = 0xff0000;
			timeLeftTF.setTextFormat(tff);
			timeLeftTF.width = 200;
			tools.addChild(timeLeftTF);
			
			snwBtn = new AbBtn(1);
			snwBtn.setText("Snow (Z): " + snwRem);
			snwBtn.x = 10;
			snwBtn.y = 50;
			tools.addChild(snwBtn);
			snwBtn.addEventListener(MouseEvent.CLICK, onClick);
			
			crshBtn = new AbBtn(2);
			crshBtn.setText("Crash (X): " + crshRem);
			crshBtn.x = 10;
			crshBtn.y = 100;
			tools.addChild(crshBtn);
			crshBtn.addEventListener(MouseEvent.CLICK, onClick);
			
			Main.THIS.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			
			tools.x = 600;
			addChild(tools);
			
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, onTick);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onComplete);
			timeLeft = TIME_NEED;
		}
		
		public function useSnw():Boolean
		{
			if (snwRem && curAb == 1)
			{
				snwRem--;
				snwBtn.setText("Snow (Z): " + snwRem);
				return true;
			}
			else
				return false;
		}
		
		public function useCrsh():Boolean
		{
			if (crshRem && curAb == 2)
			{
				crshRem--;
				crshBtn.setText("Snow (Z): " + crshRem);
				return true;
			}
			else
				return false;
		}
		
		public function win():void
		{
			graph.fc.timer.stop();
			Main.THIS.showSmth(3);
		}
		
		public function lose():void
		{
			graph.fc.timer.stop();
			timer.stop();
			Main.THIS.showSmth(2);
		}
		
		private function keyDown(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.Z: 
					curAb = 1;
					break;
				case Keyboard.X: 
					curAb = 2;
					break;
			}
		}
		
		private function onComplete(e:TimerEvent):void
		{
			win();
		}
		
		private function onTick(e:TimerEvent):void
		{
			timeLeft--;
		}
		
		private function onClick(e:MouseEvent):void
		{
			switch (e.currentTarget)
			{
				case snwBtn: 
					curAb = 1;
					break;
				case crshBtn: 
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
			timeLeftTF.setTextFormat(tff);
		}
	}

}