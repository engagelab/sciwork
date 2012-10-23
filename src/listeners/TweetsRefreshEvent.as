package listeners
{
	import flash.events.Event;
	
	public class TweetsRefreshEvent extends Event {
		
		public var stateToSet:String = null;
		
		public function TweetsRefreshEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}