package com.iskimo
{
	import com.iskimo.pubsub.PubSub;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	public class Controls extends Sprite
	{
		
		protected static const TAP_LEFT = "TAP_LEFT";
		protected static const TAP_RIGHT = "TAP_RIGHT";
		
		public function Controls()
		{
			super();
			addEventListener(flash.events.Event.ADDED_TO_STAGE, onAdded);
		}
		
		protected function onAdded(e:flash.events.Event):void
		{
			drawRect(0, 0, stage.stageWidth, stage.stageHeight, 0x000000, .5);
			addEventListener(TouchEvent.TOUCH_TAP, onTap);
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		protected function onTap(e:TouchEvent):void
		{
			handleEventX(e.localX);
		}
		
		protected function onClick(e:MouseEvent):void
		{
			handleEventX(e.stageX);
		}
		
		protected function handleEventX(x):void
		{
			var event_string:String;
			if(x < Math.round(stage.stageWidth/2)){
				event_string = TAP_LEFT;
			}else{
				event_string = TAP_RIGHT;
			}
			PubSub.publish(event_string, {});
		}
	}
}