$(document).ready(function(){
    attachListeners();
})

function attachListeners() {
    $('#create_show').on('click', function(){
        createShow();
    });
    $('#view_shows').on('click', function(){
        viewShows();
    })
}

function createShow() {
    alert("you clicked create show")
}

function viewShows() {
    alert("you clicked view shows")
}

