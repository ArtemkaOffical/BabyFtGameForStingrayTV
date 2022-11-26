import "InteractiveDataDelegate.qml";
import controls.Button;

ListView
{
    id:interactiveDataView;
    focus:true;
    property bool loading: false;
    model: ListModel
    { 
        id: interactiveModel;
    }
    visible: !loading;
    delegate: InteractiveDataDelegate
    {
    }

}