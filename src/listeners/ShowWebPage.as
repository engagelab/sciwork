package listeners
{
	import flash.events.Event;
	
	public class ShowWebPage extends Event
	{
		public var url:String;
		
		public function ShowWebPage(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}