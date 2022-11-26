import "SelectButtonDelegate.qml";
import controls.Button;

    ListView
    {
        id:babyFTSelectButtons;
        anchors.fill:parent;
        property string videoUrl;
        property string dataInteractive;
        focus:true;
        
        model: ListModel
        {
        }

        delegate: SelectButtonDelegate
        {
        }

        function NotData(){
       babyFTSelectButtons.model.reset(); 
       babyFTSelectButtons.model.append({id:3,title:"Сказка ещё в разработке",image:"apps/BabyFT/resources/data.png"})
       babyFTSelectButtons.model.append({id:4,title:"ВЫХОД",image:"apps/BabyFT/resources/exit.png"})
        
        };
        function Data(){
       babyFTSelectButtons.model.reset(); 
       babyFTSelectButtons.model.append({id:1,title:"Видео режим",image:"apps/BabyFT/resources/playMode.png"});
           babyFTSelectButtons.model.append({id:2,title:"Интерактивный режим",image:"apps/BabyFT/resources/interactiveMode.png"});
        
        }
    }


  