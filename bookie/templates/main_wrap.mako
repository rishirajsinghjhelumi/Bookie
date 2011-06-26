<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=8" />
        <title>Bookie: ${self.title()}</title>
        <link type="text/css" href="/static/css/custom-theme/jquery-ui-1.8.12.custom.css" rel="Stylesheet" />
        <link rel="stylesheet" type="text/css" href="/static/css/yui_reset_layout_grids_3.3.0.css">

        <link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Cabin+Sketch:bold&text=Bookie' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" type="text/css" href="/static/tagfield/superbly-tagfield.css">
        <link rel="stylesheet" type="text/css" href="/static/css/bookie.css">

        % if hasattr(self, 'header'):
            ${self.header()}
        % endif
        <script type="text/javascript" charset="utf-8">
            <%
                app_url = request.route_url('home').rstrip('/')
                # if this is a request with a user then api call for that user
                if request.user:
                    app_url = app_url + "/" + request.user.username
            %>
            APP_URL = '${app_url}';
        </script>
    </head>

    <body>
        <div id="navigation" class="yui3-g">
            <div class="yui3-u-2-3">
                <div class="logo">
                    <a href="${app_url}" class="logo">Bookie</a>
                    <span class="alt_logo">&nbsp;&#45; bookmark your web</span>
                </div>
            </div>
            <div class="yui3-u-1-3 navigation">
                <% 
                    if username:
                        prefix = "/" + username
                    else:
                        prefix = ""
                %>
                <span class="item"><a href="${prefix}/recent" class="nav_button">Recent</a></span>
                <span class="item"><a href="${prefix}/popular" class="nav_button">Popular</a></span>
                <span class="item"><a href="${prefix}/search" class="nav_button">Search</a></span>
                % if request.user:
                    <span class="item"><a href="${request.route_url('user_account', username=request.user.username)}" class="nav_button">Account</a></span>
                % else:
                    <span class="item"><a href="/login" class="nav_button">Login</a></span>
                % endif

                <!--<span class="item">-->

                <!--</span>-->
            </div>
        </div>
        <div id="body">
            <div class="yui3-g">
                <div class="yui3-u-1">
                    ${next.body()}
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="yui3-g">
            <div class="yui3-u-1-4"></div>
            <div class="yui3-u-3-4">
                <div class="right body">
                    <a href="http://docs.bmark.us">Bookie</a> |
                    <a href="http://github.com/mitechie/Bookie/issues">Support</a> |
                    <a href="#changelog">Changes</a> |
                    % if request.user:
                        <a href="${request.route_url('user_import', username=request.user.username)}">Import</a> |
                        <a href="${request.route_url('user_export', username=request.user.username)}">Export</a> |
                        <a href="${request.route_url('user_mobile', username=request.user.username) }">Mobile</a>
                    % endif
                </div>
            </div>
            </div>
        </div>

        <script type="text/javascript" src="/static/js/lib/jquery.min.js"></script>
        <script type="text/javascript" src="/static/js/lib/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/static/js/lib/underscore.min.js"></script>
        <script type="text/javascript">
            // prepare for the great bookie js files
            var logger = {}
            logger.log = function(msg) {
                console.log(msg);
            };
            var bookie_opts = {
                'bookie': typeof(bookie) !== 'undefined' ? bookie : {},
                'jquery': $,
                'console_log': logger
            }
        </script>
        <script type="text/javascript" src="/static/js/bookie.api.js"></script>
        <script type="text/javascript" src="/static/js/bookie.js"></script>
        <script type="text/javascript" src="/static/tagfield/superbly-tagfield.js"></script>

        <script type="text/javascript">
            $(document).ready(function() {
                bookie.init();
            });
        </script>
    </body>
</html>
