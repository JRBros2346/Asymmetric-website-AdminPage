module main
import vweb


struct App {
    vweb.Context
}

// Serve the main route
@['/']
pub fn (mut app App) index() vweb.Result {
    return $vweb.html()
}
@["/login"]
pub fn (mut app App) login() vweb.Result {
    return $vweb.html()
}
@["/dashboard"]
pub fn (mut app App) dashboard() vweb.Result {
    return $vweb.html()
}
@["/document"]
pub fn (mut app App) document() vweb.Result {
    return $vweb.html()
}
@["/event"]
pub fn (mut app App) event() vweb.Result {
    return $vweb.html()
}
@["/podcast"]
pub fn (mut app App) podcast() vweb.Result {
    return $vweb.html()
}
@["/member"]
pub fn (mut app App) member() vweb.Result {
    return $vweb.html()
}
@["/project"]
pub fn (mut app App) project() vweb.Result {
    return $vweb.html()
}



fn main() {
    mut app := App{}
    // Mount static folder for serving assets
    app.mount_static_folder_at('./assets', '/assets')
    vweb.run(&app, 8080)
}
