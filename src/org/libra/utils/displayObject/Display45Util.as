package org.libra.utils.displayObject {
	import flash.geom.Point;
	
	/**
	 * 45度场景相关
	 * @author Eddie
	 */
	public final class Display45Util {
		
		private static var _wh:Number;
		private static var _width:Number;
		private static var _height:Number;
		
		/**
		 * 格子长宽比
		 */
		public static function get wh():Number {
			return _wh
		}
		
		/**
		 * 格子宽度
		 */
		public static function get width():Number {
			return _width;
		}
		
		/**
		 * 格子高度
		 */
		public static function get height():Number {
			return _height;
		}
		
		public function Display45Util() {
			throw new Error("Display45Util can't be instance");
		}
		
		/**
		 * 设置单个格子的大小
		 * @param w
		 * @param h
		 */
		public static function setContentSize(w:Number, h:Number):void { 
			_width = w;
			_height = h;
			_wh = w / h;
		}
		
		/**
		 * 获得屏幕上点的方块索引坐标 
		 * @param p
		 * @return 
		 */
		public static function getItemPointAtPoint(p:Point):Point { 
			p = trans45To90(p);
			return new Point(int(p.x / width), int(p.y / height));
		}
		
		/**
		 * 获得鼠标位置所在方块的索引值
		 * @param	mouseP
		 * @return
		 */
		public static function getItemIndex(mouseP:Point):Point {
			var row:Number = mouseP.y / height - mouseP.x / width;
			var col:Number = mouseP.x / width + mouseP.y / height;
			row = row < 0 ? -1 : row;
			col = col < 0 ? -1 : col;
			return new Point(int(col), int(row));
		}
		
		/**
		 * 根据方块的索引值获取方块的屏幕坐标
		 * @param	index
		 * @return
		 */
		public static function getItemPos(row:int, col:int):Point { 
			return new Point((col - row) * (width * .5),(col + row) * (height * .5));
		}
		
		/**
		 * 从45度显示坐标换算为90度数据坐标
		 * @param p
		 * @return 
		 * 
		 */
		public static function trans45To90(p:Point):Point {
			return new Point(p.x + p.y * wh, p.y - p.x / wh);
		}
		
		/**
		 * 从90度数据坐标换算为45度显示坐标
		 * @param p
		 * @return 
		 * 
		 */
		public static function trans90To45(p:Point):Point {
			return new Point((p.x - p.y * wh) * .5, (p.x / wh + p.y) * .5);
		}
		
	}

}