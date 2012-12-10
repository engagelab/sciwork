package listeners
{
	import flash.events.Event;
	
	public class TweetCreatorEvent extends Event
	{
		public static const CREATE_SUCCESSFUL:String = "CREATE_SUCCESSFUL";
		public static const CREATE_FAILED:String = "CREATE_FAILED";
		
		public var result:Object;
		
		public function TweetCreatorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}