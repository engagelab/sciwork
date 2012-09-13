package listeners
{
	import flash.events.Event;
	
	public class SceneChangeEvent extends Event
	{
		public var sceneId:String;
		
		public function SceneChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}