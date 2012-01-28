package com.iskimo
{
	import flash.events.Event;
	
	public class Event extends flash.events.Event
	{
		public static const SCREEN_REDRAW = "SCREEN_REDRAW";
		public static const MOVE_OBJECTS = "MOVE_OBJECTS";
		
		protected var data:Object;
		
		public function Event(type:String, d:Object = null)
		{
			data = d;
			super(type, false, false);
		}
	}
}