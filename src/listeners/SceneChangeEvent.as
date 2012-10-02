package listeners {
	import flash.events.Event;
	
	public class SceneChangeEvent extends Event {
		
		public static const MENU:String = "MENU";
		public static const FOOTER:String = "FOOTER";
		
		public var scene:Object;
		public var eventOrigin:String;
		public var sceneIndex:Number;
		
		public function SceneChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}