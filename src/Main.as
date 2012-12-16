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
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			THIS = this;
			
			showSmth();
		}
		
		public function showSmth():void
		{
			k %= 2;
			switch(k)
			{
				case 0:
					showFilm();
					break;
				case 1:
					showGame();
					break;
			}
			
			k++;
		}
		
		public function showFilm():void
		{
			while (numChildren)
				removeChildAt(0);
				
			var flm:Film = new Film(k);
			addChild(flm);
			
		}
		
		public function showGame():void
		{
			while (numChildren)
				removeChildAt(0);
				
			addChild(new Game(k));
		}
	}
	
}