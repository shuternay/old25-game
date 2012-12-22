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
		private var tf:TextField = new TextField();
		private var tff:TextFormat = new TextFormat();
		
		public function AbBtn(num:int)
		{
			switch (num)
			{
				case 1: 
					[Embed(source="../res/bigSnow.png")] //FIXME
					var _pic1:Class;
					var pic1:Bitmap = new _pic1() as Bitmap;
					pic1.pixelSnapping = PixelSnapping.ALWAYS;
					addChild(pic1);
					break;
				case 2: 
					[Embed(source="../res/bigCrash.png")] //FIXME
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
			tf.x = 45;
			tf.y = 0;
			tf.height = 40;
			tf.width = 1500;
			addChild(tf);
			tf.mouseEnabled = false;
		}
		
		public function setText(name:String):void
		{
			tf.text = name;
			tf.setTextFormat(tff);
		}
	}
}