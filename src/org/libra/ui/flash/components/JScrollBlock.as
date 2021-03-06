package org.libra.ui.flash.components {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import org.libra.ui.Constants;
	import org.libra.ui.flash.core.Component;
	import org.libra.ui.flash.managers.UIManager;
	import org.libra.utils.asset.AssetsStorage;
	import org.libra.utils.displayObject.BitmapDataUtil;
	
	/**
	 * <p>
	 * 滚动条中的滑块
	 * </p>
	 *
	 * @class JScrollBlock
	 * @author Eddie
	 * @qq 32968210
	 * @date 09-03-2012
	 * @version 1.0
	 * @see
	 */
	public class JScrollBlock extends Component {
		
		/**
		 * 背景层
		 */
		private var $back:Bitmap;
		
		/**
		 * 前景层
		 */
		private var $fore:Bitmap;
		
		/**
		 * 方向。水平的还是垂直的
		 */
		private var $orientation:int;
		
		public function JScrollBlock(orientation:int = 1, x:int = 0, y:int = 0) {
			super(x, y);
			this.$orientation = orientation;
		}
		
		/*-----------------------------------------------------------------------------------------
		Public methods
		-------------------------------------------------------------------------------------------*/
		
		/**
		 * @inheritDoc
		 */
		override public function clone():Component {
			return new JScrollBlock($orientation, x, y);
		}
		
		/*-----------------------------------------------------------------------------------------
		Private methods
		-------------------------------------------------------------------------------------------*/
		
		override protected function init():void {
			super.init();
			
			$back = new Bitmap();
			this.addChild($back);
			$fore = new Bitmap(AssetsStorage.getInstance().getBitmapData($orientation == Constants.HORIZONTAL ? UIManager.getInstance().skin.scrollBlockSkin.hScrollThumb : UIManager.getInstance().skin.scrollBlockSkin.vScrollThumb));
			this.addChild($fore);
		}
		
		override protected function resize():void {
			if ($back.bitmapData) $back.bitmapData.dispose();
			if ($orientation == Constants.HORIZONTAL) {
				var source:BitmapData = AssetsStorage.getInstance().getBitmapData(UIManager.getInstance().skin.scrollBlockSkin.hScrollBtnBg);
				$back.bitmapData = BitmapDataUtil.getScale9BitmapData(source, $actualWidth, $actualHeight, UIManager.getInstance().skin.scrollBlockSkin.hScrollBtnScale9Rect);
			}else {
				source = AssetsStorage.getInstance().getBitmapData(UIManager.getInstance().skin.scrollBlockSkin.vScrollBtnBg);
				$back.bitmapData = BitmapDataUtil.getScale9BitmapData(source, $actualWidth, $actualHeight, UIManager.getInstance().skin.scrollBlockSkin.vScrollBtnScale9Rect);
			}
			$fore.x = ($actualWidth - $fore.width) >> 1;
			$fore.y = ($actualHeight - $fore.height) >> 1;
		}
		
		/*-----------------------------------------------------------------------------------------
		Event Handlers
		-------------------------------------------------------------------------------------------*/
		
	}

}