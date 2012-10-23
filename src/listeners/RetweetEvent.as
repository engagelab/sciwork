package listeners
{
	import flash.events.Event;
	
	public class RetweetEvent extends Event
	{
		public var tweetContent:String;
		public var originGroup:String;
		
		public function RetweetEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}