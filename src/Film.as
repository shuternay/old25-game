package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
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
			switch (num)
			{
				case 0:
					var tf:TextField = new TextField();
					this.graphics.beginFill(0x00ff00);
					this.graphics.drawRect(370, 290, 60, 20);
					this.graphics.endFill();
					this.buttonMode = true;
					this.useHandCursor = true;
					
					tf.text = "Hit me!";
					tf.x = 380;
					tf.y = 292;
					addChild(tf);
					tf.mouseEnabled = false;
					this.addEventListener(MouseEvent.CLICK, onClick0);
					break;
			}
		}
		
		private function onClick0(e:MouseEvent):void 
		{
			Main.THIS.showSmth();
		}
	
	}

}