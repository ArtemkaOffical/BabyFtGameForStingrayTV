import controls.Button;
Delegate
{
    id: cardDelegate;
    width:cardItem.width;
    height:cardItem.height;
    anchors.centerIn:parent;
    anchors.rightMargin:cardImg.width+parent.width/3;
    
        Button 
        {
            id:cardItem;
            color: cardView.ans == false && activeFocus ? "#ff0000" : "#7FFF00";
            visible:true;
              width:activeFocus ? 150: 130;
            height:activeFocus ? 180: 130;
            Image
            {   
                id:cardImg;
                    width:activeFocus ? 150: 130;
                    
            height:activeFocus ? 150: 130;
                    anchors.centerIn:parent;
                    registerInCacheSystem: false;
                    source: model.img;
                    fillMode: PreserveAspectFit;
                    focus:true;
            }
            
        }
    

}