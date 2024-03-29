package com.shen.uicomps.components.skin {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class ButtonSkin extends Sprite {
		
		private var _asset:MovieClip;
		
		public function ButtonSkin(asset:MovieClip = null) {
			mouseChildren = false;
			this.asset = asset;
		}
		
		public function set asset(value:MovieClip):void {
			if(value) {
				if(_asset != null) {
					removeChild(_asset);	
				}
				_asset = value;
				addChild(_asset);	
			}
		}

		public function up():void {
			_asset.gotoAndStop("up");
		}
		
		public function over():void {
			_asset.gotoAndStop("over");
		}
		
		public function down():void {
			_asset.gotoAndStop("down");	
		}
		
		public function disable():void {
			_asset.gotoAndStop("disabled");	
		}
	}
}
