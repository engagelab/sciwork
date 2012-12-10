package listeners
{
	import flash.events.Event;
	
	public class QuestionsRefreshEvent extends Event {
		
		public var stateToSet:String = null;
		
		public function QuestionsRefreshEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}