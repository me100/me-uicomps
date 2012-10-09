package com.shen.uicomps.components {
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	
	public class Image extends Sprite {
		
		public static const LOADED:String = "loaded";
		
		private var _originalWidth:Number = 0;		//原图宽度
		private var _originalHeight:Number = 0;		//原图高度
		private var loader:Loader;
		
		public function Image() {
		
		}

		public function set source(url:String):void {
			if(loader && contains(loader)) {
				removeChild(loader);	
			}
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);	
			var request:URLRequest = new URLRequest();
			request.url = url;
			loader.load(request);
			addChild(loader);
		}
		
		private function onComplete(event:Event):void {
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			_originalWidth = loader.width;
			_originalHeight = loader.height;
			dispatchEvent(new Event(Image.LOADED));
		}
		
		private function onIOError(event:IOErrorEvent):void {
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);	
			trace("加载图片失败");
		}
		
		public function get originalHeight():Number {
			return _originalHeight;
		}
		
		public function get originalWidth():Number {
			return _originalWidth;
		}
	}
}














