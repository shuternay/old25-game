package
{
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
					graphics.beginFill(0x00ff00);
					graphics.drawCircle(0, 0, 10);
					graphics.endFill();
					break;
				case 1: // вершина с аварией
					graphics.beginFill(0x00ff00);
					graphics.drawCircle(0, 0, 10);
					graphics.endFill();
					graphics.beginFill(0xff0000);
					graphics.drawCircle(0, 0, 3);
					graphics.endFill();
					break;
				case 2: // уборка снега
					graphics.beginFill(0xffff00);
					graphics.drawCircle(0, 0, 5);
					graphics.endFill();
					break;
			}
		}
	
	}

}