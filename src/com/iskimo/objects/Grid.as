package com.iskimo.objects
{
	import com.iskimo.display.Sprite;
	import com.iskimo.pubsub.Notifiable;
	import com.iskimo.pubsub.PubSub;
	import com.iskimo.screens.Main;
	
	import flash.display.DisplayObject;
	
	public class Grid extends Sprite implements Notifiable
	{
		public static const LINE_PASSED = "GRID_LINE_PASSED";
		
		protected var cellSize = 90;
		protected var gridSize = [10, 7];
		
		protected var objects:Array = [];
		protected var moveCount = 0;
		
		override protected function init():void
		{
			super.init();
			drawGrid();
			PubSub.subscribe(this, com.iskimo.objects.Abstract.MOVE);
		}
		
		protected function drawGrid():void
		{
			var g = graphics;
			g.lineStyle(1);
			
			for(var i=0; i <= cellSize * gridSize[1]; i+= cellSize)
			{
				g.moveTo(i, 0);
				g.lineTo(i, cellSize * gridSize[0]);
			}
			
			for(i=0; i <= cellSize * gridSize[0]; i+= cellSize)
			{
				g.moveTo(0, i);
				g.lineTo(cellSize * gridSize[1], i);
			}
		}
		
		public function add(child:Abstract, x:uint, y:uint):Grid
		{
			child.x = x * cellSize;
			child.y = y * cellSize;
			addChild(child);
			objects.push(child);
			
			return this;
		}
		
		public function notify(event:String, data:Object):void
		{
			switch(event){
				case com.iskimo.objects.Abstract.MOVE:
					moveCount++;
					if(moveCount % 9 == 0)
					{
						PubSub.publish(LINE_PASSED, {lineCount: moveCount/9});
					}
					break;
			}
		}
	}
}