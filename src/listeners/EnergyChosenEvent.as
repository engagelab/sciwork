package listeners
{
	import flash.events.Event;
	
	public class EnergyChosenEvent extends Event {
		
		public var energyId:String;
		public var energyTitle:String;
		
		public function EnergyChosenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}