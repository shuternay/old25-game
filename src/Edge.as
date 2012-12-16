package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Shuternay
	 */
	public class Edge extends Sprite
	{
		public var from:int;
		public var fromX:Number;
		public var fromY:Number;
		public var to:int;
		public var toX:Number;
		public var toY:Number;
		public var angle:Number;
		public var len:Number;
		public var signed:int = 0;
		
		public function Edge(_f:int, _fx:Number, _fy:Number, _t:int, _tx:Number, _ty:Number) 
		{
			from = _f;
			fromX = _fx;
			fromY = _fy;
			to = _t;
			toX = _tx;
			toY = _ty;
			len = Math.sqrt((fromX - toX) * (fromX - toX) + (fromY - toY) * (fromY - toY));
			//graphics.lineStyle(5, 0xff0000);
			//graphics.moveTo(fromX, fromY);
			//graphics.lineTo(toX, toY);
			angle = Math.atan2(toY - fromY, toX - fromX);
			graphics.beginFill(0x888888);
			graphics.lineStyle(1, 0x000000);
			graphics.moveTo(fromX, fromY);
			graphics.lineTo(toX, toY);
			graphics.lineStyle(0, 0, 0);
			graphics.lineTo(toX + 5 * Math.cos(angle + Math.PI / 2), toY + 5 * Math.sin(angle + Math.PI / 2));
			graphics.lineTo(fromX + 5 * Math.cos(angle + Math.PI / 2), fromY + 5 * Math.sin(angle + Math.PI / 2));
			graphics.lineTo(fromX, fromY);
		}
		
	}

}