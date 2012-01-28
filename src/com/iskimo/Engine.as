package com.iskimo
{
	import com.iskimo.screens.Main;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Engine
	{
		protected var screen:Main;
		
		protected var character:Object;
		protected var objects:Array = [];
		protected var speed:uint = 50;
		protected var distance:uint = 0;
		protected var updateTimer:Timer;
		
		public function Engine(s:Main)
		{
			screen = s;
		}
		
		public function start():void
		{
			updateTimer = new Timer(speed);
			updateTimer.addEventListener(TimerEvent.TIMER, updateScreen);
			updateTimer.start();
			
		}
		
		public function stop():void
		{
			updateTimer.removeEventListener(TimerEvent.TIMER, updateScreen);
			updateTimer.stop();
			
		}
		
		protected function updateScreen(e:TimerEvent):void
		{
			screen.moveBackground();
			screen.moveObjects();
		}
	}
}