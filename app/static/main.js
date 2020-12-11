function updateSlide(e){
    files = [
        "n15.ogg",
        "n12.ogg",
        "n10.ogg",
        "n9.ogg",
        "n8.ogg",
        "n6.ogg",
        "n4.ogg",
        "n3.ogg",
        "n2.ogg",
        "0.ogg",
        "2.ogg",
        "3.ogg",
        "4.ogg",
        "6.ogg",
        "8.ogg",
        "9.ogg",
        "10.ogg",
        "12.ogg",
        "15.ogg"
    ]
    var filename = document.getElementById('filename');
    filename.innerHTML = files[e];

    var audio = document.getElementById('audio');
    
    var source = document.getElementById('audioSource');
    source.src = "static/" + files[e];

    audio.load();
    audio.play();
      
}

function updateCheck(e) {
    var audio = document.getElementById('audio');
    audio.loop = !audio.loop
    audio.play()
}