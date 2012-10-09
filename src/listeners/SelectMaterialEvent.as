package listeners
{
	import content.workarea.materials.MaterialsItem;
	
	import flash.events.Event;
	
	public class SelectMaterialEvent extends Event
	{
		public var materialItem:MaterialsItem;
		public var addToPortolio:String;
		
		public function SelectMaterialEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}