package listeners
{
	import flash.events.Event;
	
	public class TaskChangeEvent extends Event
	{
		public var taskId:String;
		
		public function TaskChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}