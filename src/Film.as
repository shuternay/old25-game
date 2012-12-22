package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Shuternay
	 */
	public class Film extends Sprite
	{
		public var num:int;
		
		public function Film(_num:int)
		{
			num = _num;
			
			[Embed(source="../res/play.png")]
			var _pic:Class;
			
			var pic:Bitmap = new _pic() as Bitmap;
			pic.x = 260;
			pic.y = 233;
			this.addEventListener(MouseEvent.CLICK, onClick);
			
			this.buttonMode = true;
			this.useHandCursor = true;
			addChild(pic);
			var tf2:TextField = new TextField();
			var tff:TextFormat = new TextFormat();
			tff.size = 72;
			switch (num)
			{
				case 0: 
					break;
				case 2: // you Lose
					tf2.text = "You Lose!";
					tf2.x = 245;
					tf2.y = 150;
					tf2.width = 400;
					tf2.setTextFormat(tff);
					addChild(tf2);
					tf2.mouseEnabled = false;
					break;
				case 3: // you Win
					tf2.text = "You Win!";
					tf2.x = 250;
					tf2.y = 150;
					tf2.width = 400;
					tf2.setTextFormat(tff);
					addChild(tf2);
					tf2.mouseEnabled = false;
			}
		}
		
		private function onClick(e:MouseEvent):void
		{
			Main.THIS.showSmth(1);
		}
	
	}

}