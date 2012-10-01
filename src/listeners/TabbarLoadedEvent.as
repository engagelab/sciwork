package listeners
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class TabbarLoadedEvent extends Event
	{
		public var menu:ArrayCollection;
		
		public function TabbarLoadedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}