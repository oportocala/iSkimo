package com.iskimo.screens
{
	import com.iskimo.Engine;
	import com.iskimo.Images;
	import com.iskimo.display.Sprite;
	import com.iskimo.objects.Abstract;
	import com.iskimo.objects.Character;
	
	
	
	import flash.display.Screen;
	import flash.events.Event;
	
	public class Main extends Abstract
	{

		protected var engine:Engine;
		protected var background:Sprite = new Sprite();
		protected var backgroundArr:Array = [new Sprite(), new Sprite()];
		protected var backgroundHeight:uint = 960;
		
	
		
		override protected function attached(e:Event):void
		{
			initBackground();
			initEngine();
		}
		
		protected function initEngine():void
		{
			engine = new Engine(this);
			engine.start();
		}
		
		protected function initBackground():void
		{
			background.addChild(backgroundArr[0].drawImage(Images.background));
			background.addChild(backgroundArr[1].drawImage(Images.background_flip));
			backgroundArr[1].y = -backgroundHeight;
			addChild(background);
		}
		
		
		public function moveBackground(inc:uint):void
		{
			var bg1 = (backgroundArr[0].y > backgroundArr[1].y) ? backgroundArr[1] : backgroundArr[0];
			var bg2 = (backgroundArr[0].y < backgroundArr[1].y) ? backgroundArr[1] : backgroundArr[0];
			
			bg1.y += inc;
			bg2.y += inc;
			
			if(bg1.y == 0)
			{
				bg2.y = -backgroundHeight;
			}
		}
	}
}