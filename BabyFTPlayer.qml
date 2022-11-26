import controls.Player;
import controls.Media;
import controls.Spinner;
Player
{
    id:babyFTPlayer;
    focus:true;
    property var activeVideo: 0;
    property var videos;
    property bool isVideo: true;
    isFullscreen:true;
    visible:false;
    onFinished:
    {
       
         if(babyFTPlayer.isVideo || interactiveDataView.count  === 1) 
        {
            log("da");
          backgroundInteractiveDataView.visible = false;
          backgroundSelectPanelView.visible = false;
          babyFTPlayer.activeVideo = 0;
          babyFTPlayer.abort();
          babyFTView.setFocus();        
          return;
        }
         babyFTPlayer.activeVideo = (++babyFTPlayer.activeVideo) % babyFTPlayer.videos.length;
        if(interactiveDataView.model.get(0).gameData === null)
        {
            interactiveDataView.model.remove(0);        
            babyFTPlayer.PlayVideo(babyFTPlayer.videos[babyFTPlayer.activeVideo]);
            babyFTPlayer.visible = false;
        }else
        {
            babyFTPlayer.pause();
            rectCardView.visible = true;
            partyTimeApp.game.generate(interactiveDataView.model.get(0).gameData["gameData"]);         
            cardObj.setFocus();
            babyFTPlayer.pause();
        }
       
    }
    function PlayVideo(url)
    {
        babyFTPlayer.abort();
        babyFTPlayer.playUrl(url);
    }
    
       
}