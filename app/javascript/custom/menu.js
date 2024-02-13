//Menu manipulator


//Add toggle listeners to listen to clicks.
document.addEventListener("turbo:load", function() {
let hamburger = document.querySelector("#hamburger");
    hamburger.addEventListener("click", function(event) {
        event.preventDefault();
        event.stopPropagation();
        let menu = document.querySelector("#navbar-menu");
        menu.classList.toggle("collapse");
    });
});

//Add toggle listeners to clicks
document.addEventListener("turbo:load", function() {
    let account = document.querySelector("#account");
    account.addEventListener("click", function(event) {
        event.preventDefault();
        event.stopPropagation();
        let menu = document.querySelector("#dropdown-menu");
        menu.classList.toggle("show");
    });
});