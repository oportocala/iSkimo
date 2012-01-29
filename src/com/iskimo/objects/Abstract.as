package com.iskimo.objects
{
	import com.iskimo.Engine;
	import com.iskimo.display.Sprite;
	import com.iskimo.pubsub.Notifiable;
	import com.iskimo.pubsub.PubSub;
	import com.iskimo.screens.Main;
	
	import flash.display.DisplayObjectContainer;
	
	public class Abstract extends Sprite implements Notifiable
	{
		public static const MOVE:String = "OBJECT_ABSTRACT_MOVE";
		public static const REMOVE:String = "OBJECT_ABSTRACT_REMOVE";
		public var size:Array = [1,1];
		
		
		override protected function init():void
		{
			super.init();
			var hit:Sprite = new Sprite();
			hit.drawRect(0,0, size[0]*Grid.cellSize, size[1]*Grid.cellSize, 0, 0);
			this.hitArea = hit;
			
			PubSub.subscribe(this, MOVE);
		}
		
		protected function move():void 
		{
			y += Engine.MOVE_BY;
			
			if(y > Grid.gridSize[0] * Grid.cellSize)
			{
				PubSub.publish(REMOVE, {obj: this});
			}
		}
		
		public function notify(event:String, data:Object):void
		{
			switch(event){
				case MOVE:
					move();
					break;
			}
		}
	}
}