package org.libra.copGameEngine.model {
	/**
	 * <p>
	 * Description
	 * </p>
	 *
	 * @class BmdCollectionFactory
	 * @author 鸿杰
	 * @qq 32968210
	 * @date 08/22/2013
	 * @version 1.0
	 * @see
	 */
	public class BmdCollectionFactory {
		
		private static var instance:BmdCollectionFactory;
		
		private var bmdList:Vector.<IBmdCollection>;
		
		public function BmdCollectionFactory(singleton:Singleton) {
			bmdList = new Vector.<IBmdCollection>();
		}
		
		/*-----------------------------------------------------------------------------------------
		Public methods
		-------------------------------------------------------------------------------------------*/
		
		public function getBmdCollection(type:int, code:String, classType:Class):IBmdCollection {
			var i:int = this.bmdList.length;
			while (--i > -1) {
				if (bmdList[i].code == code) {
					if(bmdList[i] is classType)
						return bmdList[i];
				}
			}
			var bmd:classType = new classType(type);
			bmdList.push(bmd);
			return bmd as IBmdCollection;
		}
		
		public static function getInstance():BmdCollectionFactory {
			return instance ||= new BmdCollectionFactory(new Singleton());
		}
		
		/*-----------------------------------------------------------------------------------------
		Private methods
		-------------------------------------------------------------------------------------------*/
		
		/*-----------------------------------------------------------------------------------------
		Event Handlers
		-------------------------------------------------------------------------------------------*/
		
	}

}
final class Singleton{}