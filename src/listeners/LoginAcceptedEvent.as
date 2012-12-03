package listeners
{
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	public class LoginAcceptedEvent extends Event {
		
		public var selectedGroup:Object;
		public var groupColorDico:Dictionary;
		public var groupIdDico:Dictionary;
		
		public function LoginAcceptedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}