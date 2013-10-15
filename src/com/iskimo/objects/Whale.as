package com.iskimo.objects
{
	import com.iskimo.Controls;
	import com.iskimo.Images;
	import com.iskimo.pubsub.PubSub;

	public class Whale extends MovieClip
	{
		
		public var gm:Object = {
			lineCount: 8,
			minItemCount: 0,
			maxItemCount: 1
		};
		
		override protected function init():void
		{
			images = [
				Images.whale1,
				Images.whale2,
				Images.whale3,
				Images.whale4
			];
			currentFrame = 2;
			fps = 5;
			yoyo = true;
			//xOffset = -16;
			super.init();	
		}
	}
}