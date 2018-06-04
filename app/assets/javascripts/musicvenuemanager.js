$(document).ready(function(){
    attachListeners();
})

function attachListeners() {
    $('#create_show').on('click', function(){
        displaynewShowForm();
    });
    $('#view_shows').on('click', function(){
        viewShows();
    })
    $("#container").on("click", "#add_act", function(){
        displayNewActForm();
    });

    $('#acts').on("submit", "#new_act", function(e){
        e.preventDefault();
        let values = $(this).serialize();
        // alert(values);
        let posting = $.post('/acts', values);
        posting.done(function(data) {
            let act = data;
            $('#acts').empty();
            // $("#acts").html(act)
            // console.log(act.shows[act.shows.length - 1].id);
            viewShow(act.shows[act.shows.length - 1].id)
        });
    })

    $('#shows').on("submit", "#new_show", function(e) {
        e.preventDefault();
        let values = $(this).serialize();
        let posting = $.post('/shows', values);
        posting.done(function(data) {
            let showHTML = renderShow(data);
            $("#shows").empty();
            $("#message").empty();
            $("#shows").append(showHTML)
            $('#message').html(`<button id="add_act" class="btn btn-primary">Add An Act</button>`)
        });
    })


}
    
function displaynewShowForm() {
    $('#message').empty();
    $.get('/shows/new', function (response) {
        $('#shows').html(response);
    })
    }

function viewShows() {
    $('#shows').empty();
    $.get("/shows", function(shows){
        if (shows.length) {
            $('#message').html("You are viewing all shows")
            shows.forEach(function(show){
                let showHTML = `<button id="showid-${show.id}" class="btn btn-secondary">${show.date}</button><br><br>`;
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
        $('#message').html(`<button id="add_act" class="btn btn-primary">Add An Act</button>`)
        $('#shows').empty();
        let showHTML = renderShow(show);
        $('#shows').append(showHTML)
    })
}

function renderShow(show) {
    return `
    <ul class="list-group">
    <li class="list-group-item" id="${show.id}">${moment(show.date).format("MMMM Do YYYY")} - ${moment(show.start_time).format("h:mm a")}</li>
    ${show.acts.map(function (act){
        return `
        <li class="list-group-item"><h1><a href="${act.website}">${act.name}</h1> - ${act.blurb}</a></li>
        `
    })}
    </ul>`
}

function displayNewActForm() {
    let id = $('.list-group li')[0].id
    let intId = parseInt(id);
    $.get(`/shows/${intId}/acts/new`, function (response) {
        $('#shows').empty();
        $('#acts').empty();
        $('#acts').html(response);
    })
}
