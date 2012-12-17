package
{
	import flash.display.Bitmap;
	import flash.display.PixelSnapping;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Shuternay
	 */
	public class FatherChristmas extends Sprite
	{
		public var from:int;
		public var to:int;
		public var curFrom:int = 0;
		public var curTo:int;
		public var speed:Number = 1;
		public var dist:Number;
		public var weight:Number;
		public var pos:Number;
		public var pic:Bitmap;
		public var timer:Timer = new Timer(40);
		
		public function FatherChristmas(_from:int, _to:int)
		{
			from = _from;
			to = _to;
			curTo = from;
			[Embed(source="../res/dedmoroz.png")]
			var _pic:Class;
			pic = new _pic() as Bitmap;
			pic.x = -16;
			pic.y = -16;
			pic.pixelSnapping = PixelSnapping.ALWAYS;
			addChild(pic);
			nextMove();
		}
		
		public function nextMove():void
		{
			Graph.THIS.findShortestWay(curTo, to);
			curFrom = curTo;
			curTo = Graph.THIS.curTo;
			dist = Graph.THIS.geomDist(Graph.THIS.vCrds[curFrom].x, Graph.THIS.vCrds[curFrom].y, Graph.THIS.vCrds[curTo].x, Graph.THIS.vCrds[curTo].y);
			weight = Graph.THIS.g[curFrom][curTo];
			pos = 0;
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, onTick);
		}
		
		private function onTick(e:TimerEvent):void
		{
			if (dist > 0.5) rotation = Math.atan2(Graph.THIS.vCrds[curTo].y - Graph.THIS.vCrds[curFrom].y, Graph.THIS.vCrds[curTo].x - Graph.THIS.vCrds[curFrom].x)*180/Math.PI;
			trace(Math.atan2(Graph.THIS.vCrds[curTo].y - Graph.THIS.vCrds[curFrom].y, Graph.THIS.vCrds[curTo].x - Graph.THIS.vCrds[curFrom].x)*180/Math.PI);
			if (dist)
			{
				x = Graph.THIS.vCrds[curFrom].x + (Graph.THIS.vCrds[curTo].x - Graph.THIS.vCrds[curFrom].x) * pos / dist;
				y = Graph.THIS.vCrds[curFrom].y + (Graph.THIS.vCrds[curTo].y - Graph.THIS.vCrds[curFrom].y) * pos / dist;
			}
			else
			{
				x = Graph.THIS.vCrds[curFrom].x;
				y = Graph.THIS.vCrds[curFrom].y;
			}
			
			pos += speed * dist / weight;
			if (pos >= dist)
			{
				if (curTo == to)
				{
					timer.stop();
					Game.THIS.timer.stop();
					Main.THIS.showSmth(2);
				}
				else
				{
					timer.stop();
					nextMove();
				}
			}
			
			speed *= 1.002;
					}
	
	}

}