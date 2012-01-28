package com.iskimo.screens
{
	import com.iskimo.display.Sprite;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.text.engine.SpaceJustifier;

	public class Abstract extends Sprite
	{
		public static var screenList:Array = [];
		
		public var isAttached:Boolean = false;
		
		public function Abstract()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, this.attached);
			init();
		}
		
		public function attach(stage:Stage):void
		{
			if(!isAttached){
				for(var i:int=0;i < screenList.length;i++){
					screenList[i].detach();
				}
				
				isAttached = true;
				
				stage.addChild(this);
			}
		}
		
		public function detach():void
		{
			if(isAttached){
				isAttached = false;
				stage.removeChild(this);
			}
		}
		
		protected function attached(e:Event):void
		{
		}
	}
}