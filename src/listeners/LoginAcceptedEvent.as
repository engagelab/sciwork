package listeners
{
	import flash.events.Event;
	
	public class LoginAcceptedEvent extends Event {
		
		public var groupId:String;
		
		public function LoginAcceptedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}