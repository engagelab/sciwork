package listeners
{
	import flash.events.Event;
	
	public class ShowFullscreenEvent extends Event
	{
		public var tweetsInView:Array;
		public var shouldShow:Boolean = false;
		public var url:String = "";
		public var mode:String;
		
		public function ShowFullscreenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}