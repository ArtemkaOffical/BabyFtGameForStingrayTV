import "js/constants.js" as constants;
 Delegate
 {
    id: selectButtonDelegate;
  
    height:selectBtn.height;
    anchors.centerIn:parent;
    anchors.rightMargin:parent.width/2;
    focus:true;
    Button
    {
        id:selectBtn;
        width:selectButtonDelegate.activeFocus ? 180: 120;
        height:selectButtonDelegate.activeFocus ? 180: 120;
        anchors.centerIn:parent;
        Image
        {
            id:selectImg;
            width:120;
            height:120;
            anchors.centerIn:parent;
            registerInCacheSystem: false;
            source: model.image;
            fillMode: PreserveAspectFit;
            focus:true;
        }
        BodyText 
        {
            anchors.top:parent.bottom;    
            anchors.right:parent.right;
            anchors.left:parent.left;
            id:selectText;
            text:model.title;
            font: secondaryFont;		
            color: selectButtonDelegate.activeFocus? "#16D543":"#91949C";
			wrapMode:Wrap; horizontalAlignment:AlignHCenter;
        }
    
    }
 }