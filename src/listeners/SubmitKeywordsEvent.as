package listeners
{
	import flash.events.Event;
	
	public class SubmitKeywordsEvent extends Event
	{
		public var keywords:Array;
		
		public function SubmitKeywordsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}