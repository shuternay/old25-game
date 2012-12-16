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
		public var signed:int = 0;
		
		public function Edge(_f:int, _fx:Number, _fy:Number, _t:int, _tx:Number, _ty:Number) 
		{
			from = _f;
			fromX = _fx;
			fromY = _fy;
			to = _t;
			toX = _tx;
			toY = _ty;
			graphics.lineStyle(5, 0xff0000);
			graphics.moveTo(fromX, fromY);
			graphics.lineTo(toX, toY);
		}
		
	}

}