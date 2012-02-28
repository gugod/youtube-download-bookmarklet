(function(){
    var x = document.createElement("script");
    var u =encodeURIComponent( location.href );
    x.setAttribute("id", "youtube-downloader");
    x.setAttribute("src", "http://localhost:3000/dl.js?url="+u);
    document.body.appendChild(x);
})();

