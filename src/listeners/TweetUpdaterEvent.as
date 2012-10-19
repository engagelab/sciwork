package listeners
{
	import flash.events.Event;
	
	public class TweetUpdaterEvent extends Event
	{
		public static const UPDATE_SUCCESSFUL:String = "UPDATE_SUCCESSFUL";
		public static const UPDATE_FAILED:String = "UPDATE_FAILED";
		
		public var result:Object;
		
		public function TweetUpdaterEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}