package org.libra.game.components.animatable {
	import flash.display.BitmapData;
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class RenderItem
	 * @author Eddie
	 * @qq 32968210
	 * @date 09/09/2012
	 * @version 1.0
	 * @see
	 */
	public class RenderItem {
		
		private var $bitmapData:BitmapData;
		
		/**
		 * 所在的渲染层
		 */
		private var renderLayer:RenderLayer;
		
		/**
		 * 是否可见
		 */
		private var $visible:Boolean;
		
		private var $x:int;
		
		private var $y:int;
		
		public function RenderItem(bitmapData:BitmapData, renderLayer:RenderLayer = null) { 
			this.bitmapData = bitmapData;
			if(renderLayer) renderLayer.addItem(this);
			visible = true;
			$x = $y = 0;
		}
		
		/*-----------------------------------------------------------------------------------------
		Public methods
		-------------------------------------------------------------------------------------------*/
		
		public function set bitmapData(bmd:BitmapData):void {
			this.$bitmapData = bmd;
			setNeedRender(true);
		}
		
		/**
		 * 获取Bitmapdata
		 * @return
		 */
		public function get bitmapData():BitmapData {
			return this.$bitmapData;
		}
		
		public function setRenderLayer(renderLayer:RenderLayer):void {
			this.renderLayer = renderLayer;
		}
		
		public function setNeedRender(val:Boolean):void {
			if (val) {
				if(this.renderLayer)
					this.renderLayer.setNeedRender(true);
			}
		}
		
		public function dispose():void {
			if (this.renderLayer) this.renderLayer.removeItem(this);
			this.$bitmapData.dispose();
			this.$bitmapData = null;
		}
		
		/*-----------------------------------------------------------------------------------------
		Getters ans setters
		-------------------------------------------------------------------------------------------*/
		
		public function get x():int { 
			return $x; 
		}
		
		public function set x(value:int):void {
			if ($x != value) {
				$x = value;
				setNeedRender(true);
			}
		}
		
		public function get y():int { 
			return $y; 
		}
		
		public function set y(value:int):void {
			if ($y != value) {
				$y = value;
				setNeedRender(true);
			}
		}
		
		public function set visible(value:Boolean):void {
			if (this.$visible != value) {
				this.$visible = value;
				this.setNeedRender(true);
			}
		}
		
		public function get visible():Boolean {
			return this.$visible;
		}
		
		/*-----------------------------------------------------------------------------------------
		Private methods
		-------------------------------------------------------------------------------------------*/
		
		/*-----------------------------------------------------------------------------------------
		Event Handlers
		-------------------------------------------------------------------------------------------*/
		
	}

}