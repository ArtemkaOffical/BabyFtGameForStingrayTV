import controls.Button;
Delegate
{
    
    width:parent.width;
    height:parent.height;
    anchors.fill:parent;
    Image
    {
        focus:true;
        id:dataImage;
     
            width:parent.width;
            height:parent.height;
            anchors.centerIn:parent;
            registerInCacheSystem: false;
            source: model.image;
            fillMode: PreserveAspectFit;
    }
}