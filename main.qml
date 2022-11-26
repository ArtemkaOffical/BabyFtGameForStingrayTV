import "BabyFTView.qml";
import "InteractiveDataView.qml";
import "BabyFTPlayer.qml";
import "SelectPanelView.qml";
import "CardView.qml";
import "js/Game.js" as engine;
import controls.Button;
import controls.Media;
import controls.Spinner;
Application
{
  id: partyTimeApp;
  
  property var game: new engine.Game();
  Item
  {
    id: searchPanel;
    anchors.left:parent.left;
    anchors.right:parent.right;
    anchors.top:parent.top;
    height: 50;
    Text
    {
      id: fieldSearch;
      anchors.fill:parent;
      font: titleFont;
      text: keyBoardObj.text ? "Поиск: " + keyBoardObj.text : "Поиск";
      color: colorTheme.activeTextColor;
    }
    VirtualKeyboard
    {
      id: keyBoardObj;
      onAccepted:
      {
        partyTimeApp.SearchFT("http://api.energy-rust.ru/GSLabs/BabyFt?name=" + encodeURIComponent(keyBoardObj.text));
      }
    }
    onKeyPressed:
    {
      if (key === "Down" && babyFTView.model.count >= 1) 
      {
        babyFTView.setFocus();
      }
    }

  }

  BabyFTView
  {
    id: babyFTView;
    anchors.top:searchPanel.bottom;
    anchors.left:parent.left;
    anchors.right:parent.right;
    anchors.bottom:parent.bottom;
    anchors.topMargin:15;
    onKeyPressed:{
     if (key==="Up" && babyFTView.currentIndex === 0){
      fieldSearch.setFocus();
          keyBoardObj.visible = true;
     }
    }
    onSelectPressed:
    {
      
      var currentFt = model.get(babyFTView.currentIndex);
      
      selectPanelView.videoUrl = currentFt.Video;
      selectPanelView.dataInteractive = currentFt.Data;
      backgroundSelectPanelView.visible = true;
      selectPanelView.Data();
      selectPanelView.setFocus();
    } 
  }


 Rectangle
 {
  id:backgroundSelectPanelView;
  visible:false;
  width:parent.width/2;
  height:parent.height/2;
  anchors.centerIn:parent;
  SelectPanelView
  {
    id:selectPanelView;
    anchors.left:parent.left;
    anchors.right:parent.right;
    anchors.bottom:parent.bottom;
    anchors.top:parent.top;
    spacing:(parent.width/2)+5;
    orientation:Horizontal;
    color:colorTheme.activePanelColor;
    
    onSelectPressed:
    {
    if(model.get(selectPanelView.currentIndex).id===4)
      {  
        backgroundSelectPanelView.visible = false;
      playerObj.abort();
      babyFTView.setFocus();
      }
      if(model.get(selectPanelView.currentIndex).id===1)
      {  
      if(selectPanelView.videoUrl.length===0 || !selectPanelView.videoUrl)
      {
      selectPanelView.NotData();
      return;
      }
        playerObj.PlayVideo(selectPanelView.videoUrl);
        playerObj.disableControls = false;
         playerObj.isVideo = true; 
        playerObj.setFocus();
      }
      else
      {
        let data = partyTimeApp.game.loadData(selectPanelView.dataInteractive);
        if(!data || Object.keys(data).length === 0){selectPanelView.NotData();return;}
        
        playerObj.PlayVideo(playerObj.videos[0]);
       
        playerObj.isVideo = false; 
        playerObj.visible = false;
        playerObj.disableControls = true;

        backgroundInteractiveDataView.visible = true;
        interactiveDataView.setFocus();
       
        
      }
    }
    onBackPressed:
    {
       
      backgroundSelectPanelView.visible = false;
      playerObj.abort();
      babyFTView.setFocus();
    }
  }
 }
 
  Rectangle
  {
    id:backgroundInteractiveDataView;
    visible:false;
    width:parent.width;
    height:parent.height;
    InteractiveDataView
    {
      anchors.left:parent.left;
      anchors.right:parent.right;
      anchors.bottom:parent.bottom;
      anchors.top:parent.top;
      handleNavigationKeys: false;
      setOverscroll :false;
      id:interactiveDataView;
      onBackPressed:
      {
        backgroundInteractiveDataView.visible = false;
        backgroundSelectPanelView.visible = false;
        
        playerObj.activeVideo = 0;
      playerObj.abort();
      babyFTView.setFocus();
    
      }
    }
  }

 Item
 {
  id:rectCardView;
  visible:false;
  height:300;
  anchors.bottom:parent.bottom;
  anchors.left:parent.left;
  anchors.right:parent.right;
  CardView
  {
      id:cardObj;
      anchors.left:parent.left;
      anchors.right:parent.right;
      anchors.bottom:parent.bottom;
      anchors.top:parent.top;
      spacing:140 ;
      orientation:Horizontal;
      onSelectPressed:
      {
        if(partyTimeApp.game.Answer(interactiveDataView.model.get(0).gameData["answerId"],model.get(cardObj.currentIndex).id))
        {
          rectCardView.visible = false;
          interactiveDataView.setFocus();
          interactiveDataView.model.remove(0);
          playerObj.PlayVideo(playerObj.videos[playerObj.activeVideo]);
          playerObj.visible = false;
        }else
        {
          cardObj.ans = false;
        }
      }
      onKeyPressed:
      {
        if(key === "Left" || key ==="Right") cardObj.ans = true;
      }
      onBackPressed:
    {
       
    
        backgroundInteractiveDataView.visible = false;
        backgroundSelectPanelView.visible = false;
        rectCardView.visible = false;
        playerObj.activeVideo = 0;
      playerObj.abort();
      babyFTView.setFocus();
    
      
    }
  }
 }



  BabyFTPlayer
  {
    id: playerObj;
    anchors.fill:parent;
   
    onBackPressed: 
    {         
      partyTimeApp.closePlayer();
    }

    
  }
  
  onStarted: 
  {
    babyFTView.loadCatalog("http://api.energy-rust.ru/GSLabs/BabyFt");
    babyFTView.setFocus();
    
  }
  onBackPressed:
  {
    keyBoardObj.text="";
    appManager.closeCurrentApp();
  }

  function closePlayer() {
    playerObj.abort();
    babyFTView.visible = true;
    playerObj.visible = false;
    selectPanelView.setFocus();
  }
 
  function SearchFT(url) {
        babyFTView.loadCatalog(url);
  }
  
}