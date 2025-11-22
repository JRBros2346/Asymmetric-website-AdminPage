import vweb

struct App {
    vweb.Context
    middlewares map[string][]vweb.Middleware
}

fn main() {
	mut app := &App {
		middlewares: {
            // chaining is allowed, middleware will be evaluated in order
            '/path/to/': [middleware_func, other_func]
            '/':         [global_middleware]
        }
	} 
    vweb.run(app, 7000)
}

fn middleware_func(mut ctx vweb.Context) bool {
    // ...
    return true
}

fn other_func(mut ctx vweb.Context) bool {
    // ...
    return true
}

fn global_middleware(mut ctx vweb.Context) bool {
    // ...
    return true
}

fn (mut app App) hello() vweb.Result {
    return app.text('Hello')
}

@['/foo']
fn (mut app App) world() vweb.Result {
    return app.text('World')
}

@[post]
fn (mut app App) hehe() vweb.Result {
    return app.text('Haha')
}

@['/product/create'; post]
fn (mut app App) create_product() vweb.Result {
    return app.text('product')
}


@['/hello/:user']
fn (mut app App) hello_user(user string) vweb.Result {
    return app.text('Hello $user')
}

@['/user'; get]
pub fn (mut app App) controller_get_user_by_id() vweb.Result {
    // http://localhost:3000/user?q=vpm&order_by=desc => { 'q': 'vpm', 'order_by': 'desc' }
    return app.text(app.query.str())
}

@['/'; host: 'example.com']
pub fn (mut app App) hello_web() vweb.Result {
    return app.text('Hello World')
}

@['/'; host: 'api.example.org']
pub fn (mut app App) hello_api() vweb.Result {
    return app.text('Hello API')
}

// define the handler without a host attribute last if you have conflicting paths.
@['/']
pub fn (mut app App) hello_others() vweb.Result {
    return app.text('Hello Others')
}

@['/demo/:path...']
fn (mut app App) wildcard(path string) vweb.Result {
    return app.text('URL path = "${path}"')
}
