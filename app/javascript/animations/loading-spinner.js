MatestackUiCore.matestackEventHub.$on('page_loading', function(url){
  //hide old content
  document.querySelector('#page-content').style.opacity = 0;
  // setTimeout(function () {
    //show loading spinner
    document.querySelector('#spinner').style.display = "inline-block";
  // }, 0);
});

MatestackUiCore.matestackEventHub.$on('page_loaded', function(url){
  setTimeout(function () {
    //hide loading spinner
    document.querySelector('#spinner').style.display = "none";
    //show new content
    document.querySelector('#page-content').style.opacity = 1;
  }, 500);
});
