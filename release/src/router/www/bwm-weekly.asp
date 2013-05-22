<!DOCTYPE html>
<!--
Tomato GUI
Copyright (C) 2006-2010 Jonathan Zarate
http://www.polarcloud.com/tomato/

For use with Tomato Firmware only.
No part of this file may be used without permission.
-->
<html lang="en">
    <head>
        <meta charset="utf-8">

        <meta http-equiv='content-type' content='text/html;charset=utf-8'>
        <meta name='robots' content='noindex,nofollow'>
        <title>[<% ident(); %>] Bandwidth: Weekly</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/tomato.css" rel="stylesheet">
        <% css(); %>

        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">


        <script type="text/javascript" src="js/jquery.lite.min.js"></script>


        <script type='text/javascript' src='tomato.js'></script>

        <!-- / / / -->

        <script type='text/javascript' src='js/bwm-hist.js'></script>

        <script type='text/javascript'>

            //	<% nvram("at_update,tomatoanon_answer,wan_ifname,lan_ifname,rstats_enable"); %>
            try {
                //	<% bandwidth("daily"); %>
            }
            catch (ex) {
                daily_history = [];
            }
            rstats_busy = 0;
            if (typeof(daily_history) == 'undefined') {
                daily_history = [];
                rstats_busy = 1;
            }

            var weeks = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
            var weeksShort = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
            var startwk = 0;
            var summary = 1;

            function save()
            {
                cookie.set('weekly', scale + ',' + startwk + ',' + summary, 31);
            }

            function changeStart(e)
            {
                startwk = e.value * 1;
                redraw();
                save();
            }

            function changeMode(e)
            {
                summary = e.value * 1;
                redraw();
                save();
            }

            function nth(n)
            {
                n += '';
                switch (n.substr(n.length - 1, 1)) {
                    case '1':
                        return n + 'st';
                    case '2':
                        return n + 'nd';
                    case '3':
                        return n + 'rd';
                }
                return n + 'th';
            }

            function redraw()
            {
                var h;
                var grid;
                var block;
                var rows;
                var dend;
                var dbeg;
                var dl, ul;
                var d, diff, ds;
                var tick, lastSplit;
                var yr, mo, da, wk;
                var gn;
                var swk;

                rows = 0;
                block = [];
                gn = 0;
                w = 0;
                lastSplit = 0;
                ul = dl = 0;
                dend = dbeg = '';

                swk	= startwk - 1;
                if (swk < 0) swk = 6;

                if (summary) {
                    grid = '<table class="table table-striped table-bordered">';
                    grid += '<thead><tr><th>Date</th><th>Download</th><th>Upload</th><th>Total</th></tr></thead>';
                }
                else {
                    grid = '';
                }

                function flush_block()
                {
                    grid += '<h4>' + dbeg + ' to ' + dend + '</h4>' +
                    '<table class="table table-striped table-bordered">' +
                    '<thead><tr><th>Date</th><th>Download</th><th>Upload</th><th>Total</th></tr></thead>' +
                    block.join('') +
                    makeRow('footer', 'Total', rescale(dl), rescale(ul), rescale(dl + ul)) +
                    '</table><br>';
                }

                for (i = 0; i < daily_history.length; ++i) {
                    h = daily_history[i];
                    yr = (((h[0] >> 16) & 0xFF) + 1900);
                    mo = ((h[0] >>> 8) & 0xFF);
                    da = (h[0] & 0xFF);
                    d = new Date(yr, mo, da);
                    wk = d.getDay();

                    tick = d.getTime();
                    diff = lastSplit - tick;

                    ds = ymdText(yr, mo, da) + ' <small>(' + weeksShort[wk] + ')</small>';

                    /*	REMOVE-BEGIN

                    Jan 2007
                    SU MO TU WE TH FR SA
                    01 02 03 04 05 06
                    07 08 09 10 11 12 13
                    14 15 16 17 18 19 20
                    21 22 23 24 25 26 27
                    28 29 30 31

                    Feb 2007
                    SU MO TU WE TH FR SA
                    01 02 03
                    04 05 06 07 08 09 10
                    11 12 13 14 15 16 17
                    18 19 20 21 22 23 24
                    25 26 27 28

                    Mar 2007
                    SU MO TU WE TH FR SA
                    01 02 03
                    04 05 06 07 08 09 10
                    11 12 13 14 15 16 17
                    18 19 20 21 22 23 24
                    25 26 27 28 29 30 31

                    REMOVE-END */

                    if ((wk == swk) || (diff >= (7 * 86400000)) || (lastSplit == 0)) {
                        if (summary) {
                            if (i > 0) {
                                grid += makeRow(((rows & 1) ? 'odd' : 'even'),
                                    dend + '<br>' + dbeg, rescale(dl), rescale(ul), rescale(dl + ul));
                                ++rows;
                                ++gn;
                            }
                        }
                        else {
                            if (rows) {
                                flush_block();
                                ++gn;
                            }
                            block = [];
                            rows = 0;
                        }
                        dl = ul = 0;
                        dend = ds;
                        lastSplit = tick;
                    }

                    dl += h[1];
                    ul += h[2];
                    if (!summary) {
                        block.unshift(makeRow(((rows & 1) ? 'odd' : 'even'), weeks[wk] + ' <small>' + (mo + 1) + '-' + da + '</small>', rescale(h[1]), rescale(h[2]), rescale(h[1] + h[2])))
                        ++rows;
                    }

                    dbeg = ds;
                }

                if (summary) {
                    if (gn < 9) {
                        grid += makeRow(((rows & 1) ? 'odd' : 'even'),
                            dend + '<br>' + dbeg, rescale(dl), rescale(ul), rescale(dl + ul));
                    }
                    grid += '</table>';
                }
                else {
                    if ((rows) && (gn < 9)) {
                        flush_block();
                    }
                }
                E('bwm-weekly-grid').innerHTML = grid;
            }

            function init()
            {
                var s;

                if (nvram.rstats_enable != '1') return;

                if ((s = cookie.get('weekly')) != null) {
                    if (s.match(/^([0-2]),([0-6]),([0-1])$/)) {
                        E('scale').value = scale = RegExp.$1 * 1;
                        E('startwk').value = startwk = RegExp.$2 * 1
                        E('shmode').value = summary = RegExp.$3 * 1;
                    }
                }

                initDate('ymd');
                daily_history.sort(cmpHist);
                redraw();
            }
        </script>

    </head>
    <body onload='init()'>
        <div id="navigation">
            <div class="container">
                <div class="logo"><a href="/">AdvancedTomato</a></div>
                <div class="navi">
                    <ul>
                        <script type="text/javascript">navi()</script>
                    </ul>
                </div>
            </div>
        </div>

        <div id="main" class="container">
            <div class="row">
                <div class="span12">

                    <!-- / / / -->

                    <h3>WAN Bandwidth - Weekly</h3>
                    <div id='bwm-weekly-grid'></div>
                    <div>
                        <b>Show</b> <select onchange='changeMode(this)' id='shmode'><option value=1 selected>Summary<option value=0>Full</select><br>
                        <b>Date</b> <select onchange='changeDate(this, "ymd")' id='dafm'><option value=0>yyyy-mm-dd</option><option value=1>mm-dd-yyyy</option><option value=2>mmm dd, yyyy</option><option value=3>dd.mm.yyyy</option></select><br>
                        <b>Start</b> <select onchange='changeStart(this)' id='startwk'><option value=0 selected>Sun<option value=1>Mon<option value=2>Tue<option value=3>Wed<option value=4>Thu<option value=5>Fri<option value=6>Sat</select><br>
                        <b>Scale</b> <select onchange='changeScale(this)' id='scale'><option value=0>KB</option><option value=1>MB</option><option value=2 selected>GB</option></select><br>
                        <br>
                        <a href="admin-bwm.asp" class="btn">Configure</a>
                    </div>

                    <script type='text/javascript'>checkRstats();</script>
                    <button style="float: right; margin-top: -25px;" class="btn" type='button' onclick='reloadPage()'>Refresh</button>


                    <!-- / / / -->

                </div><!--/span-->
            </div><!--/row-->
            <hr>
<div class="footer">
                <p><a href="about.asp">&copy; AdvancedTomato 2013</a> <span style="padding: 0 15px; float:right; text-align:right;">Version: <b><% version(1); %></b></span></p> 
            </div>
        </div><!--/.fluid-container-->
    </body>
</html>