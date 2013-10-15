package com.iskimo
{
	public class Utils
	{
		public static function random(Low, High) {
			return Math.floor(Math.random()*(1+High-Low))+Low;
		}
		
	}
}