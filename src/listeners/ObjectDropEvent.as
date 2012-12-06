package listeners
{
	import content.workarea.materials.MaterialsItem;
	
	import flash.events.Event;
	
	public class ObjectDropEvent extends Event {
		
		public var theObject:MaterialsItem;
		public var xPos:int;
		public var yPos:int;
		
		public function ObjectDropEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}