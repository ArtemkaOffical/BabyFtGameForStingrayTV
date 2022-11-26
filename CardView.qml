import "CardDelegate.qml";
import controls.Button;

ListView
{
    id:cardView;
    property bool ans:true;
    focus:true;
    anchors.fill:parent;
    model: ListModel
    { 
        id: cardModel;
    }
    
    delegate: CardDelegate
    {
    }
 
}