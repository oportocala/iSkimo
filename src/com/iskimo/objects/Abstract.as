package com.iskimo.objects
{
	import com.iskimo.Sprite;
	import com.iskimo.pubsub.Notifiable;
	import com.iskimo.pubsub.PubSub;
	
	public class Abstract extends Sprite implements Notifiable
	{
		public static const MOVE:String = "OBJECT_ABSTRACT_MOVE";
		
		public function Abstract()
		{
			super();
			PubSub.subscribe(this, MOVE);
		}
		
		private function move():void 
		{
			
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