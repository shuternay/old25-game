package
{
	import flash.display.Bitmap;
	import flash.display.PixelSnapping;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Shuternay
	 */
	public class Vertex extends Sprite
	{
		public var num:int = 0;
		public var type:int = 0;
		
		public function Vertex(_type:int)
		{
			type = _type;
			switch (type)
			{
				case 0: // вершина
					graphics.beginFill(0x888888);
					graphics.drawCircle(0, 0, 7);
					graphics.endFill();
					break;
				case 1: // вершина с аварией
					graphics.beginFill(0x888888);
					graphics.drawCircle(0, 0, 7);
					graphics.endFill();
					graphics.beginFill(0, 0);
					graphics.drawCircle(0, 0, 10);
					graphics.endFill();
					//graphics.beginFill(0xff0000);
					//graphics.drawCircle(0, 0, 3);
					//graphics.endFill();
					[Embed(source="../res/crash.png")]
					var _pic1:Class;
					var pic1:Bitmap = new _pic1() as Bitmap;
					pic1.x = -8;
					pic1.y = -7;
					pic1.pixelSnapping = PixelSnapping.ALWAYS;
					addChild(pic1);
					break;
				case 2: // уборка снега
					graphics.beginFill(0, 0);
					graphics.drawCircle(0, 0, 8);
					graphics.endFill();
					[Embed(source="../res/snow.png")]
					var _pic2:Class;
					var pic2:Bitmap = new _pic2() as Bitmap;
					pic2.x = -8;
					pic2.y = -5;
					pic2.pixelSnapping = PixelSnapping.ALWAYS;
					addChild(pic2);
					break;
			}
		}
	
	}

}