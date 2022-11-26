class Game
{
    constructor()
    {
        
    }
    ShuffleListOfIconsId(arr) {
        let currentIndex = arr.length,  randomIndex;
        while (currentIndex != 0) {
          randomIndex = Math.floor(Math.random() * currentIndex);
          currentIndex--;
          [arr[currentIndex], arr[randomIndex]] = [
            arr[randomIndex], arr[currentIndex]];
        }
      
        return arr;
    }
    loadData(data)
    {
        interactiveDataView.loading = true;
        interactiveDataView.interactiveModel.reset();
        let t = [];
        let parsedData = JSON.parse(data);
        parsedData.forEach((Item)=> {                  
            interactiveDataView.interactiveModel.append( {id:Item["id"],image:Item["imageUrl"],gameData:Item["babyFTGame"] } );
            t.push(Item["audioUrl"]);
        });
        playerObj.videos = t;
        interactiveDataView.loading = false;
        return parsedData;
    }
    generate(data)
    {
        cardObj.cardModel.reset();
        
        this.ShuffleListOfIconsId(data).forEach(x=>
            {
              cardObj.cardModel.append({color:"#00000000",id:x["id"],img:x["imageUrl"]});
            });
    }
    Answer(answerId,currentId)
    {
        return answerId === currentId;
    }
}

this.Game = Game;