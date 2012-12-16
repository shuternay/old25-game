package
{
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	/**
	 * ...
	 * @author Shuternay
	 */
	public class FatherChristmas extends Sprite
	{
		public var distLeft:Number;
		public var from:int;
		public var to:int;
		public var curFrom:int;
		public var curTo:int;
		public var speed:Number = 1;
		public var len:Number;
		public var pos:Number;
		public var timer:Timer = new Timer(40);
		
		public function FatherChristmas(_from:int, _to:int)
		{
			from = _from;
			to = _to;
			curTo = from;
			graphics.beginFill(0xff0000);
			graphics.drawCircle(0, 0, 15);
			graphics.endFill();
			nextMove();
		}
		
		public function nextMove():void
		{
			distLeft = Graph.THIS.findShortestWay(curTo, to);
			
			curFrom = curTo;
			curTo = Graph.THIS.curTo;
			len = Graph.THIS.g[curFrom][curTo];
			pos = 0;
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, onTick);

		}
		
		private function onTick(e:TimerEvent):void
		{
			x = Graph.THIS.vCrds[curFrom].x + (Graph.THIS.vCrds[curTo].x - Graph.THIS.vCrds[curFrom].x) * pos / len;
			y = Graph.THIS.vCrds[curFrom].y + (Graph.THIS.vCrds[curTo].y - Graph.THIS.vCrds[curFrom].y) * pos / len;
			pos += speed;
			if (pos >= len)
			{
				if (curTo == to)
				{
					timer.stop();
					Main.THIS.showSmth();
				}
				else
				{
					timer.stop();
					nextMove();
				}
			}
			
			speed *= 1.01;
			
			Game.THIS.timeLeft = (distLeft - pos) / speed / 25;
		}
	
	}

}