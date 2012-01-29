package com.iskimo.objects
{
	import com.iskimo.Controls;
	import com.iskimo.Images;
	import com.iskimo.pubsub.PubSub;

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
			xOffset = -16;
			
			super.init();
			
			PubSub.subscribe(this, Controls.TAP_LEFT);
			PubSub.subscribe(this, Controls.TAP_RIGHT);
		}
		
		public function moveLeft()
		{
			
			if(x <= 0){
				x = (Grid.gridSize[1]-1) * Grid.cellSize;
			}else{
				x-= Grid.cellSize;
			}
		}
		
		public function moveRight()
		{
			if(x == (Grid.gridSize[1]-1) * Grid.cellSize){
				x = 0;
			}else{
				x+= Grid.cellSize;
			}
		}
		
		override public function notify(event:String, data:Object):void
		{
			switch(event){
				case Controls.TAP_LEFT:
					
					moveLeft();
					break;
				
				case Controls.TAP_RIGHT:
					moveRight();
					break;
			}
		}
	}
}