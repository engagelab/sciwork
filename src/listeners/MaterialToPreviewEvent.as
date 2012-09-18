package listeners
{
	import flash.events.Event;
	
	public class MaterialToPreviewEvent extends Event
	{
		public var previewSource:String;
		public var fullSizeSource:String;
		public var previewType:String;
		
		public function MaterialToPreviewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}