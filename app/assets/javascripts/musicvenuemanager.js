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

    $('form').submit(function (e){
        alert(e);
    })
}
    
function displaynewShowForm() {
    $('#message').empty();
    $.get('/shows/new', function (response) {
        $('#shows').html(response);
    })
    }

function submitData () {
    $('form').submit(function (event) {
        event.preventDefault();
        let values = $(this).serialize();
        alert(values);
})
}



// function hijackForm(e) {
//             alert(this)
//             e.preventDefault();
//             let values = $(this).serialize();
//             let posting = $.post('/users/1/shows', values);
//             posting.done(function(data){
//                 var show = data;
//                 $('#showDate').text(show["date"]);
//             })
// }



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
        $('#message').html(`You are currently viewing the show on ${show.date}`)
        $('#shows').empty();
        let showHTML = renderShow(show);
        $('#shows').append(showHTML)
    })
}

function renderShow(show) {
    return `
    <ul class="list-group"
    <li class="list-group-item" id="${show.id}">${moment(show.date).format("MMMM Do YYYY")} - ${moment(show.start_time).format("h:mm a")}</li>
    ${show.acts.map(function (act){
        return `
        <li class="list-group-item"><h1><a href="${act.website}">${act.name}</h1> - ${act.blurb}</a></li>
        `
    })}
    </ul>`
}
