package listeners
{
	import flash.events.Event;
	
	public class LogoutEvent extends Event {
		
		public function LogoutEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}