package com.iskimo
{
	
	import com.iskimo.objects.Abstract;
	import com.iskimo.objects.Character;
	import com.iskimo.objects.Grid;
	import com.iskimo.objects.IcebergSmall;
	import com.iskimo.objects.Whale;
	import com.iskimo.pubsub.Notifiable;
	import com.iskimo.pubsub.PubSub;
	import com.iskimo.screens.Main;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getDefinitionByName;
	
	public class Engine implements Notifiable
	{
		
		public static const MOVE_BY:uint = 5;
		public static const START:String = "ENGINE_START";
		public static const STOP:String = "ENGINE_STOP";
		
		protected var screen:Main;
		
		protected var character:Character = new Character();
		protected var speed:uint = 50;
		protected var distance:uint = 0;
		protected var updateTimer:Timer;
		
		protected var grid:Grid = new Grid();
		protected var controls:Controls = new Controls();
		
		public function Engine(s:Main)
		{
			screen = s;
		}
		
		public function start():void
		{
			updateTimer = new Timer(speed);
			updateTimer.addEventListener(TimerEvent.TIMER, updateScreen);
			PubSub.publish(START, {});
			updateTimer.start();
			initObjects();
			initControls();
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
			grid.y = -90;
			grid.x = 5;
			screen.addChild(grid);
			grid.add(character, 3, 8);
			PubSub.subscribe(this, Grid.LINE_PASSED);
		}
		
		public function notify(event:String, data:Object):void
		{
			switch(event)
			{
				case Grid.LINE_PASSED:
					generateRandomObstacles(data.lineCount)
					break;
			}
		}
		
		public function generateRandomObstacles(lineCount:uint): void
		{
			com.iskimo.objects.IcebergSmall, com.iskimo.objects.Whale;
			
			var obstacleClasses:Array = ['IcebergSmall', 'Whale'];
			var k;
			var total_obstacles = 0;
			var grid_cols = Grid.gridSize[1];
			for(k in obstacleClasses)
			{
				var className:String = "com.iskimo.objects." + obstacleClasses[k];
				
				var ClassReference:Class = (getDefinitionByName(className) as Class);
				
				var obj = (new ClassReference() as Abstract);

				if(lineCount % obj.gm.lineCount == 0){
					var min_obstacle_count:uint = Math.min(obj.gm.minItemCount, grid_cols - total_obstacles - 1);
					var max_obstacle_count:uint = Math.min(obj.gm.maxItemCount, grid_cols - total_obstacles - 1);
					var obstacle_count:uint = Utils.random(min_obstacle_count, max_obstacle_count);
					var i:uint = 0, pos = {}, randomX;
					while(i != obstacle_count){
						randomX = Utils.random(0, grid_cols - obj.size[0]);
						if(!pos[randomX]) // FOR ITEMS THAT TAKE UP MORE THAN ONE CELL, we need to check all adjiacent spaces
						{
							
							for(var j:uint=0;j<obj.size[0];j++)
							{
								pos[randomX+j] = true;
							}
							i++;
							grid.add((new ClassReference() as Abstract), randomX, 0);
						}
					}
				}
			}
			
		}
		
		protected function initControls():void
		{
			screen.addChild(controls);
		}
	}
}