package com.iskimo.objects
{
	import com.iskimo.Images;
	import com.iskimo.display.MovieClip;

	public class Character extends MovieClip
	{
		override protected function init():void
		{
			images = [
				Images.character1,
				Images.character2,
				Images.character3,
				Images.character4,
				Images.character5
			];
			currentFrame = 2;
			fps = 10;
			yoyo = true;
			
			super.init();
		}
	}
}