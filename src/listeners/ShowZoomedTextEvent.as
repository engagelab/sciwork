package listeners
{
	import flash.events.Event;
	
	public class ShowZoomedTextEvent extends Event
	{
		public var currentState:String;
		public var text:String;
		public var objId:String;
		
		public function ShowZoomedTextEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}