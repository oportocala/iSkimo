package com.iskimo.objects
{
	import com.iskimo.Event;
	import com.iskimo.Sprite;
	
	public class Abstract extends Sprite
	{
		public function Abstract()
		{
			super();
			addEventListener(Event.MOVE_OBJECTS, move);
		}
		
		private function move():void 
		{
			trace('move called');
		}
	}
}