package
{
	import flash.display.Bitmap;
	import flash.display.PixelSnapping;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Shuternay
	 */
	public class AbBtn extends Sprite
	{
		public function AbBtn(name:String, num:int)
		{
			var tf:TextField = new TextField();
			var tff:TextFormat = new TextFormat();
			//this.graphics.beginFill(num);
			//this.graphics.drawRect(0, 0, 40, 40);
			//this.graphics.endFill();
			switch (num)
			{
				case 1: 
					[Embed(source="../res/bigSnow.png")]
					var _pic1:Class;
					var pic1:Bitmap = new _pic1() as Bitmap;
					pic1.pixelSnapping = PixelSnapping.ALWAYS;
					addChild(pic1);
					break;
				case 2: 
					[Embed(source="../res/bigCrash.png")]
					var _pic2:Class;
					var pic2:Bitmap = new _pic2() as Bitmap;
					pic2.pixelSnapping = PixelSnapping.ALWAYS;
					pic2.y = -10;
					addChild(pic2);
					break;
			}
			this.buttonMode = true;
			this.useHandCursor = true;
			
			tff.size = 20;
			tf.text = name;
			tf.x = 45;
			tf.y = 0;
			tf.height = 40;
			tf.width = 100;
			tf.setTextFormat(tff);
			addChild(tf);
			tf.mouseEnabled = false;
		}
	}
}