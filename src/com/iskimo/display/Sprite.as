package com.iskimo.display
{
	import com.iskimo.display.Sprite;
	import com.iskimo.objects.Grid;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	public class Sprite extends flash.display.Sprite
	{
		
		
		public function Sprite()
		{
			init();
		}
		
		protected function init():void
		{
		}
		
		public function drawRect(x:int, y:int, w:uint, h:uint, color:uint, alpha:Number = 1):com.iskimo.display.Sprite
		{
			graphics.beginFill(color, alpha);
			graphics.drawRect(x, y, w, h);
			graphics.endFill();
			return this;
		}
		
		public function drawImage(src:Class):com.iskimo.display.Sprite
		{
			var image:Bitmap = new src();
			var m:Matrix = new Matrix();
			graphics.beginBitmapFill(image.bitmapData, m);
			graphics.drawRect(0,0,image.getRect(this).width, image.getRect(this).height);
			graphics.endFill();
			return this;
		}
	}
}