package com.iskimo.pubsub
{
	public interface Notifiable
	{
		function notify(event:String, data:Object):void;
	}
}