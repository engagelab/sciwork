package listeners
{
	import flash.events.Event;
	
	public class SimQuestionChangeEvent extends Event
	{
		public var questionId:String;
		public var questionAnswer:String;
		
		public function SimQuestionChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}