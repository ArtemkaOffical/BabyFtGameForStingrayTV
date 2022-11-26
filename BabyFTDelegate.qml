import "js/constants.js" as constants;

Delegate
{
	id: babyFTDelegate;
	width:  constants.poster["width"] ;
	height: constants.poster["height"];
	opacity: activeFocus ? 1.0 : 0.3;
	focus: true;
	Button
	{
		width:  parent.width+5;
		height: parent.height+5;
		anchors.fill:parent;
		Image
		{
			id: posterDefaultImage;
			width:  constants.poster["width"]-15;
			height: constants.poster["height"]-15;
			anchors.centerIn:parent;
			registerInCacheSystem: false;
			source: model.Poster;
			fillMode: Stretch ;
		}
		BodyText 
		{
			
			id: dd;
		
			width:  constants.poster["width"];
			anchors.top:posterDefaultImage.bottom;
			anchors.topMargin:15;
			font: secondaryFont;
			color:"#ffffff";
			opacity: activeFocus ? 1.0 : 0.8;
			text: model.Name;
			wrapMode:Wrap;
		}
	}
	
}