$(document).ready(function(){
    attachListeners();
})

function hijackForm(e) {
            e.preventDefault();
            let values = $(e).serialize();
            console.log(e);
            let posting = $.post('/users/1/shows', values);
            posting.done(function(data){
                var show = data;
                $('#showDate').text(show["date"]);
            })
}

function attachListeners() {
    $('#create_show').on('click', function(){
        displaynewShowForm();
    });
    $('#view_shows').on('click', function(){
        viewShows();
    })
    $('form').on('submit', function(e) {
        hijackForm(e);
    })
}

function displaynewShowForm() {
    $.get('/shows/new', )
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
    <h1 id="${show.id}">${moment(show.date).format("MMMM Do YYYY")} - ${moment(show.start_time).format("h:mm a")}</h1>
    ${show.acts.map(function (act){
        return `
        <p><strong><a href="${act.website}">${act.name}</strong> - ${act.blurb}</a></p>
        `
    })}`
}
