package listeners
{
	import flash.events.Event;
	
	public class TweetSelectionBarEvent extends Event
	{
		public var newState:String;
		
		public function TweetSelectionBarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}