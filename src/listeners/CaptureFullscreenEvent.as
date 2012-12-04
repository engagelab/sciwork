package listeners
{
	import flash.events.Event;
	
	public class CaptureFullscreenEvent extends Event
	{	
		public function CaptureFullscreenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}