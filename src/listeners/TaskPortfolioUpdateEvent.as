package listeners
{
	import flash.events.Event;
	
	public class TaskPortfolioUpdateEvent extends Event
	{
		public var eventType:String;
		
		public function TaskPortfolioUpdateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}