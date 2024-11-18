module main

import vweb
import os

struct App {
    vweb.Context
}

// Route: Dashboard
@['/']
pub fn (mut app App) dashboard() vweb.Result {
    return $vweb.html()
}

// Route: Events List
@['/events']
pub fn (mut app App) events() vweb.Result {
    api_url := 'http://127.0.0.1:3000/api/events'
    response := os.execute('curl $api_url')
    if response.exit_code != 0 {
        return app.text('Error fetching events')
    }
    return $vweb.html()
}

// Route: Single Event
@['/events/:id']
pub fn (mut app App) event(id string) vweb.Result {
    api_url := 'http://127.0.0.1:3000/api/events/$id'
    response := os.execute('curl $api_url')
    if response.exit_code != 0 {
        return app.text('Error fetching event with ID: $id')
    }
    return $vweb.html()
}

// Route: Podcasts List
@['/podcasts']
pub fn (mut app App) podcasts() vweb.Result {
    api_url := 'http://127.0.0.1:3000/api/podcasts'
    response := os.execute('curl $api_url')
    if response.exit_code != 0 {
        return app.text('Error fetching podcasts')
    }
    return $vweb.html()
}

// Route: Single Podcast
@['/podcasts/:id']
pub fn (mut app App) podcast(id string) vweb.Result {
    api_url := 'http://127.0.0.1:3000/api/podcasts/$id'
    response := os.execute('curl $api_url')
    if response.exit_code != 0 {
        return app.text('Error fetching podcast with ID: $id')
    }
    return $vweb.html()
}

// Main function to start the server
fn main() {
    vweb.run<App>(mut App{}, 8080)
}
