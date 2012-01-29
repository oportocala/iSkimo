package com.iskimo.pubsub
{
	import flash.utils.Dictionary;

	final public class PubSub
	{
		private static var subscriptions:Dictionary = new Dictionary();
		
		public static function subscribe(object:Object, event:String)
		{
			if(!subscriptions[event]){
				subscriptions[event] = [];	
			}
			
			subscriptions[event].push(object);
		}
		
		public static function publish(event:String, data:Object):void
		{
			if(subscriptions[event]){
				for each(var object:Notifiable in subscriptions[event]){
					object.notify(event, data);
				}
			}
			trace("NOTIFIED: " + event);
		}
	}
}