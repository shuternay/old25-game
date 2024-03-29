package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Shuternay
	 */
	public class Main extends Sprite
	{
		public var game:Game;
		public var k:int = 0;
		public static var THIS:Main;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			THIS = this;
			
			showSmth(0);
		}
		
		public function showSmth(num:int):void
		{
			
			while (numChildren)
				removeChildAt(0);
			
			k %= 2;
			switch (k)
			{
				case 0: 
					showFilm(num);
					break;
				case 1: 
					showGame(num);
					break;
			}
			
			k++;
		}
		
		public function showFilm(num:int):void
		{
			var flm:Film = new Film(num);
			addChild(flm);
		
		}
		
		public function showGame(num:int):void
		{
			addChild(new Game(1));
		}
	}

}