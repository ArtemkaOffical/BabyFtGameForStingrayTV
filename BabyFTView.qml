import "BabyFTDelegate.qml";

import "js/constants.js" as constants;

GridView
{
    id: babyFTView;
    property bool loading: false;
    cellWidth: constants.poster["width"] + 20;
    cellHeight: constants.poster["height"] + 85;
    visible: !loading;
    clip: true;
    delegate: BabyFTDelegate
    {
    }
    model: ListModel
    {
        id: babyFTModel;
    }
   function loadCatalog(url) {
        
        babyFTView.loading = true;
        babyFTModel.reset();
        var request = new XMLHttpRequest();
        request.onreadystatechange = function() {
            if (request.readyState !== XMLHttpRequest.DONE)
                return;

            if (request.status && request.status === 200) 
            {
                var babyFTs = JSON.parse(request.responseText);
                 
                babyFTs["babyFts"].forEach(function (babyFTItem) {
                    
                    babyFTModel.append( {Id:babyFTItem["id"],Video:babyFTItem["videoUrl"],Poster:babyFTItem["posterUrl"],Name:babyFTItem["name"],Data:JSON.stringify(babyFTItem["interactiveData"])  } );
                });
               babyFTView.loading = false;
                babyFTView.setFocus();
            }
        }
        
        request.open("GET", url, true);
        request.send();
        
        log("request was sended");
    }
}