package
{
	import com.adobe.serialization.json.JSON;
	
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import listeners.TweetUpdaterEvent;
	
	public class TweetUpdater extends EventDispatcher
	{
		public function TweetUpdater(target:IEventDispatcher=null) {
			super(target);
		}
		
		public function postTweetToService(url:String, tweet:Object):void {
			var urlRequest:URLRequest = new URLRequest(url);
			urlRequest.method = URLRequestMethod.PUT;
			urlRequest.contentType = "application/json";
			urlRequest.data = com.adobe.serialization.json.JSON.encode(tweet);
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, completeHandler);
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			loader.load(urlRequest);
		}
		
		protected function completeHandler(evt:Event):void {
			var ev:TweetUpdaterEvent = new TweetUpdaterEvent(TweetUpdaterEvent.UPDATE_SUCCESSFUL, true);
			ev.result = evt.target.data;
			dispatchEvent(ev);
		}
		
		protected function httpStatusHandler(evt:HTTPStatusEvent):void {
			trace("TweetUpdater httpStatusHandler: "+evt.status);
		}
		
		protected function ioErrorHandler(evt:IOErrorEvent):void {
			var ioev:TweetUpdaterEvent = new TweetUpdaterEvent(TweetUpdaterEvent.UPDATE_FAILED, true);
			ioev.result = evt.errorID;
			dispatchEvent(ioev);
		}
	}
}