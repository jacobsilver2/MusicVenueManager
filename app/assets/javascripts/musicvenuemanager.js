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
            $('#message').html("You are viewing all shows")
            shows.forEach(function(show){
                let showHTML = `<button id="showid-${show.id}" class="btn btn-secondary">${show.date}</button><br>`;
                $('#shows').append(showHTML);
                $(`#showid-${show.id}`).on('click', function(){
                    viewShow(show.id);
                });
            })
        } else {
            $('#message').html("there are currently no shows in the database.")
        }
    })
}

function viewShow(showId) {
    $.get("/shows/" + showId, function(show) {
        $('#message').html(`Currently viewing the show on ${show.date}`)
        $('#shows').empty();
        let showHTML = renderShow(show);
        $('#shows').append(showHTML)
    })
}

function renderShow(show) {
    return `
    <h1 id="${show.id}">${moment(show.date).format("MMMM Do YYYY")}</h1>
    <h1>${moment(show.start_time).format("h:mm a")}</h1>
    <ul>
        <li></li>
    </ul>
    `
}
