package com.iskimo
{
	import com.iskimo.display.Sprite;
	import com.iskimo.objects.Grid;
	import com.iskimo.pubsub.Notifiable;
	import com.iskimo.pubsub.PubSub;
	
	public class Score extends Sprite implements Notifiable
	{
		
		public var score:uint = 0;
		
		public function Score()
		{
			super();
			PubSub.subscribe(this, Grid.LINE_PASSED);
		}
		
		public function notify(event:String, data:Object):void
		{
			switch(event){
				case Grid.LINE_PASSED:
					score++;
					update();
					break;
				case Engine.START:
					reset();
					break;
				
			}
		}
		
		protected function update():void
		{
			this['value_txt'].text = score + " miles";
		}
		
		protected function reset():void
		{
			score = 0;
		}
	}
}