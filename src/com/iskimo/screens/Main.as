package com.iskimo.screens
{
	import com.iskimo.Engine;
	import com.iskimo.Images;
	import com.iskimo.display.Sprite;
	import com.iskimo.objects.Abstract;
	import com.iskimo.objects.Character;
	import com.iskimo.pubsub.PubSub;
	
	import flash.display.Screen;
	import flash.events.Event;
	
	public class Main extends Abstract
	{
		public const MOVE_BY:uint = 10;
		
		protected var engine:Engine;
		protected var background:Sprite = new Sprite();
		protected var backgroundArr:Array = [new Sprite(), new Sprite()];
		protected var backgroundHeight:uint = 960;
		protected var objects:Sprite = new Sprite();
		
		override protected function attached(e:Event):void
		{
			initBackground();
			initObjects();
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
			background.addChild(backgroundArr[1].drawImage(Images.background));
			backgroundArr[1].y = -backgroundHeight;
			addChild(background);
		}
		
		protected function initObjects():void
		{
			addChild(objects);
		}
		
		public function moveBackground():void
		{
			var bg1 = (backgroundArr[0].y > backgroundArr[1].y) ? backgroundArr[1] : backgroundArr[0];
			var bg2 = (backgroundArr[0].y < backgroundArr[1].y) ? backgroundArr[1] : backgroundArr[0];
			
			bg1.y += MOVE_BY;
			bg2.y += MOVE_BY;
			
			if(bg1.y == 0)
			{
				bg2.y = -backgroundHeight;
			}
		}
		
		public function moveObjects():void
		{
			PubSub.publish(com.iskimo.objects.Abstract.MOVE, new Object());
		}
	}
}