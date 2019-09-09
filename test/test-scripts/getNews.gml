///getNews()
if (object_game.offlineMode){
    return true;
}
else{
    return onlineGetNews(object_game.euNewsMax);
}
