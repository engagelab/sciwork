package listeners
{
	import flash.events.Event;
	
	public class SubmitTweetEvent extends Event
	{
		public var owner:String;
		public var bdy:String;
		
		public function SubmitTweetEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}