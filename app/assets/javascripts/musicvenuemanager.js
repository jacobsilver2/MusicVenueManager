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
        let posting = $.post('/acts', values);
        posting.done(function(data) {
            let act = data;
            $('#acts').empty();
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
            $('#message').html(`<br><button id="add_act" class="btn btn-primary">Add An Act</button>`)
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
                //create new js model for each show
                let concert = new Show(show.id, show.date, show.start_time, show.notes, show.user_id, show.confirmed, show.acts);
                //create variable of html data for shows buttons
                let showsInsert = concert.renderShowButton();
                //create variable of html data for individual shows
                let showInsert = concert.viewShow();
                // add shows buttons to dom
                $('#shows').append(showsInsert);
                // add click handlers which route user to individual show page
                $(`#showid-${show.id}`).on('click', function(){
                    $('#shows').empty();
                    $('#shows').append(showInsert)
                })
                // let showHTML = `<button id="showid-${show.id}" class="btn btn-secondary">${show.date}</button><br><br>`;
                // $('#shows').append(showHTML);
                // $(`#showid-${show.id}`).on('click', function(){
                //     viewShow(show.id);
                // });
            })
        } else {
            $('#message').html("there are currently no shows in the database.")
        }
    })
}

function displayNewActForm() {
    let id = $('.list-group h1')[0].id
    let intId = parseInt(id);
    $.get(`/shows/${intId}/acts/new`, function (response) {
        $('#shows').empty();
        $('#acts').empty();
        $('#acts').html(response);
    })
}

class Show {
    constructor(id, date, start_time, notes, user_id, confirmed, acts) {
        this.id = id;
        this.date = date;
        this.start_time = start_time;
        this.notes = notes;
        this.user_id = user_id;
        this.confirmed = confirmed;
        this.acts = acts;
    }

    renderShowButton() {
        let htmlToInsert = `
        <button id="showid-${this.id}" class="btn btn-secondary">${this.date}</button><br><br>`;
        return htmlToInsert;
    }

    viewShow() {
        return `
            <ul class="list-group">
            <h1 class="list-group-item-primary" id="${this.id}">${moment(this.date).format("MMMM Do YYYY")} - ${moment(this.start_time).format("h:mm a")}</h1>
            ${this.acts.map(function (act){
                return `
                    <li class="list-group-item-secondary"><h2><a href="${act.website}">${act.name}</h2> - ${act.blurb}</a></li>
                `
                })}
            </ul>` 
    }
}
