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
    $('#shows').empty();
    $.get("/shows", function(shows){
        if (shows.length) {
            shows.forEach(function(show){
                let showHTML = `<button id="showid-${show.id}" class="btn btn-secondary">${show.date}</button><br>`;
                $('#shows').append(showHTML);
                $(`#showid-${show.id}`).on('click', function(){
                    viewShow(show.id);
                });
            })
        }
    })
}

function viewShow(showId) {
    alert("you want to view a show")
}
