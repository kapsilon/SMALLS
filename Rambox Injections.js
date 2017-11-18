//VK: Disable social junk
document.getElementById('side_bar').style.display = "none";

//Whatsapp: Enter <=> Ctrl+Enter
document.addEventListener('keydown', function(e){
    if(e.keyCode === 13 && e.ctrlKey) {
        e.preventDefault();
        alert("You are Ctrl+Enter");
        retun;
    }
    if(e.keyCode === 13) {
        e.preventDefault();
        alert("You are Enter");
    }

});
