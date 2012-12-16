package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Shuternay
	 */
	public class AbBtn extends Sprite
	{
		
		public function AbBtn(name:String, color:uint)
		{
			var tf:TextField = new TextField();
			this.graphics.beginFill(color);
			this.graphics.drawRect(0, 0, 40, 40);
			this.graphics.endFill();
			this.buttonMode = true;
			this.useHandCursor = true;
			
			tf.text = name;
			tf.x = 45;
			tf.y = 0;
			tf.height = 40;
			addChild(tf);
			tf.mouseEnabled = false;
		}
	
	}

}