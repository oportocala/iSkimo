package com.iskimo.display
{
	import flash.display.Bitmap;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class MovieClip extends Sprite
	{
		protected var frames:Array = [];
		protected var images:Array = [];
		protected var fps:uint = 5;
		protected var timer:Timer;
		protected var currentFrame = 0;
		protected var yoyo:Boolean = false;
		protected var yoyoDirection:int = 1;
		
		override protected function init():void
		{
			super.init();
			
			if(images.length){
				for each(var b:Class in images){
					var s:Sprite = new Sprite();
					s.drawImage(b);
					
					frames.push(s);
				}
			}
			
			setFrame();
			
			timer = new Timer(Math.ceil(1000/fps));
			timer.addEventListener(TimerEvent.TIMER, function(e:TimerEvent){
				gotoNext();
			});
			start();
		}
		
		public function goto(frameNr:uint):MovieClip
		{
			if(frameNr < frames.length){
				currentFrame = frameNr;
				setFrame();
			} else {
				throw new Error("Frame no out of bounds");
			}
			
			return this;
		}
		
		public function gotoNext():MovieClip
		{
			if(yoyo){
				if(currentFrame == frames.length-1){
					yoyoDirection = -1;
				}
				
				if(currentFrame == 0){
					yoyoDirection = 1;
				}
				
				currentFrame += yoyoDirection;
			}else{
				if(currentFrame < frames.length - 1){
					currentFrame++;
				}else{
					currentFrame = 0;
				}
			}
			
			setFrame();
			
			return this;
		}
		
		public function gotoPrev():MovieClip
		{
			if(currentFrame > 0){
				goto(--currentFrame);
			}else{
				goto(frames.length-1);
			}
			
			return this;
		}
		
		protected function setFrame():void
		{
			try{
				removeChild(getChildAt(0));
			}catch(e:Error){}
			
			trace(currentFrame);
			addChild(frames[currentFrame]);
		}
		
		public function stop():MovieClip
		{
			timer.stop();
			return this;
		}
		
		public function start():MovieClip
		{
			timer.start();
			return this;
		}
	}
}