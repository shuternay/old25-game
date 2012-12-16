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
				case 0: // begin
					var tf:TextField = new TextField();
					this.graphics.beginFill(0x00ff00);
					this.graphics.drawRect(370, 290, 60, 20);
					this.graphics.endFill();
					this.buttonMode = true;
					this.useHandCursor = true;
					
					tf.text = "Play!";
					tf.x = 380;
					tf.y = 291;
					addChild(tf);
					tf.mouseEnabled = false;
					this.addEventListener(MouseEvent.CLICK, onClick);
					break;
				case 2: // you Lose
					var tf:TextField = new TextField();
					var tf2:TextField = new TextField();
					this.graphics.beginFill(0x00ff00);
					this.graphics.drawRect(370, 290, 60, 20);
					this.graphics.endFill();
					this.buttonMode = true;
					this.useHandCursor = true;
					
					tf.text = "Play!";
					tf.x = 380;
					tf.y = 291;
					addChild(tf);
					tf.mouseEnabled = false;
					tf2.text = "You Lose!";
					tf2.x = 380;
					tf2.y = 270;
					addChild(tf2);
					tf2.mouseEnabled = false;
					this.addEventListener(MouseEvent.CLICK, onClick);
					break;
				case 3: // you Win
					var tf:TextField = new TextField();
					var tf2:TextField = new TextField();
					this.graphics.beginFill(0x00ff00);
					this.graphics.drawRect(370, 290, 60, 20);
					this.graphics.endFill();
					this.buttonMode = true;
					this.useHandCursor = true;
					
					tf.text = "Play!";
					tf.x = 380;
					tf.y = 291;
					addChild(tf);
					tf.mouseEnabled = false;
					tf2.text = "You Win!";
					tf2.x = 380;
					tf2.y = 270;
					addChild(tf2);
					tf2.mouseEnabled = false;
					this.addEventListener(MouseEvent.CLICK, onClick);
					break;
					
			}
		}
		
		private function onClick(e:MouseEvent):void 
		{
			Main.THIS.showSmth(1);
		}
	
	}

}