package listeners
{
	import flash.events.Event;
	
	public class TaskPortfolioUpdateEvent extends Event
	{
		public var isTaskCompleted:Boolean;
		
		public function TaskPortfolioUpdateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}