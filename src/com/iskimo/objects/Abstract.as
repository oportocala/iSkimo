package com.iskimo.objects
{
	import com.iskimo.Engine;
	import com.iskimo.display.Sprite;
	import com.iskimo.pubsub.Notifiable;
	import com.iskimo.pubsub.PubSub;
	import com.iskimo.screens.Main;
	
	public class Abstract extends Sprite implements Notifiable
	{
		public static const MOVE:String = "OBJECT_ABSTRACT_MOVE";
		
		override protected function init():void
		{
			super.init();
			PubSub.subscribe(this, MOVE);
		}
		
		protected function move():void 
		{
			this.y += Engine.MOVE_BY;
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