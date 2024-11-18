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
@["/hello"]
pub fn (mut app App) data() vweb.Result {
    return $vweb.html()
}



fn main() {
    mut app := App{}
    // Mount static folder for serving assets
    app.mount_static_folder_at('./assets', '/assets')
    vweb.run(&app, 8080)
}
