package listeners
{
	import flash.events.Event;
	
	public class ShowTweetsFullscreenEvent extends Event
	{
		public var tweetsInView:Array;
		public var shouldShow:Boolean = false;
		
		public function ShowTweetsFullscreenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}