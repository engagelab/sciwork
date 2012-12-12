package
{
	public class PortfolioTaskComment extends Object
	{
		public var text:String = "";
		public var id:String = null;
		public var taskId:String;
		
		public function PortfolioTaskComment(taskId:String)
		{
			super();
			this.taskId = taskId;
		}
	}
}