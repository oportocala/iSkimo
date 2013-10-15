package com.iskimo.objects
{
	import com.iskimo.Controls;
	import com.iskimo.Images;
	import com.iskimo.pubsub.PubSub;

	public class IcebergSmall extends MovieClip
	{
		public var gm:Object = {
			lineCount: 3,
			minItemCount: 0,
			maxItemCount: 4
		};
		
		override protected function init():void
		{
			images = [
				Images.icebergSmall1,
				Images.icebergSmall2,
				Images.icebergSmall3
			];
			currentFrame = 2;
			fps = 5;
			yoyo = true;
			
			
			super.init();	
		}
	}
}