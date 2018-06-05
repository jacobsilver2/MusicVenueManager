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
            let newAct = new Act(data.id, data.name, data.website, data.blurb, data.shows)
            $('#acts').empty();
            $.get(`/shows/${newAct.shows[0].id}`, function(show){
                $("#shows").empty();
                let showHTML = getActShowHTML(show);
                $('#shows').append(showHTML)    
            })
        });
    })

    $('#shows').on("submit", "#new_show", function(e) {
        e.preventDefault();
        let values = $(this).serialize();
        let posting = $.post('/shows', values);
        posting.done(function(data) {
            let newConcert = new Show(data.id, data.date, data.start_time, data.notes, data.user_id, data.confirmed, data.acts)
            let newConcertHTML = newConcert.viewShow();
            $("#shows").empty();
            $("#message").empty();
            $('#shows').append(newConcertHTML)
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

function getActShowHTML(show) {
    let showHTML = `
        <ul class="list-group">
        <h1 class="list-group-item-primary" id="${show.id}">${moment(show.date).format("MMMM Do YYYY")} - ${moment(show.start_time).format("h:mm a")}</h1>
        ${show.acts.map(function (act){
            return `
                <li class="list-group-item-secondary"><h2><a href="${act.website}">${act.name}</h2> - ${act.blurb}</a></li>
                `
                })}
            </ul>` 
    return showHTML
}

function viewShows() {
    $('#shows').empty();
    $('#acts').empty();
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
                    $('#message').html('<br><button id="add_act" class="btn btn-primary">Add An Act</button>');
                })
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
        let showHTML = `
            <ul class="list-group">
            <h1 class="list-group-item-primary" id="${this.id}">${moment(this.date).format("MMMM Do YYYY")} - ${moment(this.start_time).format("h:mm a")}</h1>
            ${this.acts.map(function (act){
                return `
                    <li class="list-group-item-secondary"><h2><a href="${act.website}">${act.name}</h2> - ${act.blurb}</a></li>
                `
                })}
        </ul>` 
    return showHTML
    }
}

class Act {
    constructor(id, name, website, blurb, shows) {
        this.id = id;
        this.name = name;
        this.website = website;
        this.blurb = blurb;
        this.shows = shows;
    }
}


