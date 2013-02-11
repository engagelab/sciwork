package simulation
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import mx.geom.RoundedRectangle;
	
	public class InfoBubble extends Sprite
	{
		private var tfield:TextField = new TextField();
		[Embed(source="assets/simu/ITCFranklinGothicStd-Demi.otf", fontName = "miracleFont", mimeType = "application/x-font", fontWeight="normal", fontStyle="normal", advancedAntiAliasing="true", embedAsCFF="false")]
		private var miracleFont : Class;
	
		public function InfoBubble()
		{
			super();
			
			var tformat:TextFormat = new TextFormat("miracleFont", 18, 0xFFFFFF, true, null, null, null, null);
			tfield.defaultTextFormat = tformat;
			tfield.selectable = false;
			tfield.width += 60;
			this.addChild(tfield);
		}
		
		public function setInfoText(theText:String):void {
			tfield.htmlText = theText;
			tfield.x = 3;
			this.width = tfield.textWidth + 22;
			graphics.clear();
			graphics.beginFill(0x000000,0.8);
			graphics.drawRoundRect(0,0,tfield.textWidth+12,tfield.textHeight+6,5,5);
			graphics.endFill();
		}
	}
}