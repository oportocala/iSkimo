package com.iskimo
{
	
	import com.iskimo.screens.Main;
	import com.iskimo.objects.Character;
	
	import com.iskimo.objects.Grid;
	import com.iskimo.pubsub.PubSub;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Engine
	{
		
		public static const MOVE_BY:uint = 10;
		
		protected var screen:Main;
		
		protected var character:Character = new Character();
		protected var speed:uint = 50;
		protected var distance:uint = 0;
		protected var updateTimer:Timer;
		
		protected var grid:Grid = new Grid();
		
		public function Engine(s:Main)
		{
			screen = s;
		}
		
		public function start():void
		{
			updateTimer = new Timer(speed);
			updateTimer.addEventListener(TimerEvent.TIMER, updateScreen);
			updateTimer.start();
			initObjects();
		}
		
		public function stop():void
		{
			updateTimer.removeEventListener(TimerEvent.TIMER, updateScreen);
			updateTimer.stop();
			
		}
		
		protected function updateScreen(e:TimerEvent):void
		{
			screen.moveBackground(MOVE_BY);
			PubSub.publish(com.iskimo.objects.Abstract.MOVE, new Object());
		}
		
		protected function initObjects():void
		{
			grid.y = 60;
			grid.x = 5;
			screen.addChild(grid);
			grid.add(character, 3, 8);
		}
	}
}