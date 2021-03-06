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
        <title>[<% ident(); %>] About</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="css/tomato.css" rel="stylesheet">
        <% css(); %>

        <script type="text/javascript" src="js/jquery.lite.min.js"></script>


        <script type='text/javascript' src='tomato.js'></script>
        <script type='text/javascript'>
            //	<% nvram(''); %>	// http_id
        </script>

        <!-- / / / -->

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

                    <h4>Tomato Firmware <% version(1); %></h4>
                    <!-- USB-BEGIN -->
                    <br>USB support integration and GUI,<br>
                    <!-- USB-END -->
                    <!-- IPV6-BEGIN -->
                    IPv6 support,
                    <!-- IPV6-END -->
                    <br>
                    Linux kernel <% version(2); %> and Broadcom Wireless Driver <% version(3); %> updates,<br>
                    support for additional router models, dual-band and Wireless-N mode.<br>
                    Copyright (C) 2008-2011 Fedor Kozhevnikov, Ray Van Tassle, Wes Campaigne<br>
                    <a href='http://www.tomatousb.org/' target='_new'>http://www.tomatousb.org</a><br>
                    <!-- / / / -->
                    <br>

                    <b>AdvancedTomato:</b><br />
                    - Navigation Style Selection (Jacky)<br />
                    - Clean up Bootstrap, new styles etc... (Jacky) <br />
                    - Ported to Shibby's releases (by Jacky) <br />
                    - Based on Bootstrap (Alex)<br />
                    <a href="http://at.prahec.com">http://at.prahec.com</a> 
                    <br /><br />
                    
                    <!-- OPENVPN-BEGIN -->
                    <b>OpenVPN integration and GUI,</b><br>
                    Copyright (C) 2010 Keith Moyer,<br>
                    <a href='mailto:tomatovpn@keithmoyer.com'>tomatovpn@keithmoyer.com</a><br>
                    <br>
                    <!-- OPENVPN-END -->

                    <b>"Shibby" features:</b><br>
                    <!-- BBT-BEGIN -->
                    - Transmission 2.77 integration<br>
                    <!-- BBT-END -->
                    <!-- BT-BEGIN -->
                    - GUI for Transmission<br>
                    <!-- BT-END -->
                    <!-- NFS-BEGIN -->
                    - NFS utils integration and GUI<br>
                    <!-- NFS-END -->
                    - Custom log file path<br>
                    <!-- LINUX26-BEGIN -->
                    - SD-idle tool integration for kernel 2.6<br>
                    <!-- USB-BEGIN -->
                    - 3G Modem support (big thanks for @LDevil)<br>
                    <!-- USB-END -->
                    <!-- LINUX26-END -->
                    <!-- SNMP-BEGIN -->
                    - SNMP integration and GUI<br>
                    <!-- SNMP-END -->
                    <!-- UPS-BEGIN -->
                    - APCUPSD integration and GUI (implemented by @arrmo)<br>
                    <!-- UPS-END -->
                    <!-- DNSCRYPT-BEGIN -->
                    - DNScrypt-proxy 1.0 integration and GUI<br>
                    <!-- DNSCRYPT-END -->
                    <!-- TOR-BEGIN -->
                    - TOR Project integration and GUI<br>
                    <!-- TOR-END -->
                    - TomatoAnon project integration and GUI<br>
                    - TomatoThemeBase project integration and GUI<br>
                    - Ethernet Ports State<br>
                    Webmon Backup Script<br>
                    Copyright (C) 2011-2013 Michał Rupental<br>
                    <a href='http://openlinksys.info' target='_new'>http://openlinksys.info</a><br>
                    <br>

                    <!-- VPN-BEGIN -->
                    <b>"JYAvenard" Features:</b><br>
                    <!-- OPENVPN-BEGIN -->
                    - OpenVPN enhancements &amp; username/password only authentication<br>
                    <!-- OPENVPN-END -->
                    <!-- PPTPD-BEGIN -->
                    - PPTP VPN Client integration and GUI<br>
                    <!-- PPTPD-END -->
                    Copyright (C) 2010-2012 Jean-Yves Avenard<br>
                    <a href='mailto:jean-yves@avenard.org'>jean-yves@avenard.org</a><br>
                    <br>
                    <!-- VPN-END -->

                    <b>"Victek" features:</b><br>
                    - Extended Sysinfo<br>
                    <!-- NOCAT-BEGIN -->
                    - Captive Portal. (Based in NocatSplash)<br>
                    <!-- NOCAT-END -->
                    <!-- HFS-BEGIN -->
                    - HFS / HFS+ filesystem integration<br>
                    <!-- HFS-END -->
                    Copyright (C) 2007-2011 Ofer Chen & Vicente Soriano<br>
                    <a href='http://victek.is-a-geek.com' target='_new'>http://victek.is-a-geek.com</a><br>
                    <br>

                    <b>"Teaman" features:</b><br>
                    - QOS-detailed & ctrate filters<br>
                    - Realtime bandwidth monitoring of LAN clients<br>
                    - Static ARP binding<br>
                    - VLAN administration GUI<br>
                    - Multiple LAN support integration and GUI<br>
                    - Multiple/virtual SSID support (experimental)<br>
                    - UDPxy integration and GUI<br>
                    <!-- PPTPD-BEGIN -->
                    - PPTP Server integration and GUI<br>
                    <!-- PPTPD-END -->
                    Copyright (C) 2011 Augusto Bott<br>
                    <a href='http://code.google.com/p/tomato-sdhc-vlan/' target='_new'>Tomato-sdhc-vlan Homepage</a><br>
                    <br>

                    <b>"Toastman" features:</b><br>
                    - Configurable QOS class names<br>
                    - Comprehensive QOS rule examples set by default<br>
                    - TC-ATM overhead calculation - patch by tvlz<br>
                    - GPT support for HDD by Yaniv Hamo<br>
                    - Tools-System refresh timer<br>
                    Copyright (C) 2011 Toastman<br>
                    <a href='http://www.linksysinfo.org/index.php?threads/using-qos-tutorial-and-discussion.28349/' target='_new'>Using QoS - Tutorial and discussion</a><br>
                    <br>

                    <b>"Tiomo" Features:</b><br>
                    - IMQ based QOS Ingress<br>
                    - Incoming Class Bandwidth pie chart<br>
                    Copyright (C) 2012 Tiomo<br>
                    <br>

                    <!-- SDHC-BEGIN -->
                    <b>"Slodki" feature:</b><br>
                    - SDHC integration and GUI<br>
                    Copyright (C) 2009 Tomasz Słodkowicz<br>
                    <a href='http://gemini.net.pl/~slodki/tomato-sdhc.html' target='_new'>tomato-sdhc</a><br>
                    <br>
                    <!-- SDHC-END -->

                    <b>"Victek/PrinceAMD/Phykris/Shibby" feature:</b><br>
                    - Revised IP/MAC Bandwidth Limiter<br>
                    <br>
                    <br>
                    Built on <% build_time(); %> by Jacky, <a href='http://openlinksys.info' target='_new'>http://openlinksys.info</a><br><br>
                    <!--
                    Please do not remove or change the homepage link or donate button.
                    Thanks.
                    - Jon
                    -->
                    <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                        <input type="hidden" name="cmd" value="_s-xclick">
                        <input type="image" src="img/pp.gif" border="0" name="submit" alt="Donate">
                        <input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----">
                    </form>
                    <div style='font-size:12px'><br />
                        <b>Thanks to everyone who risked their routers, tested, reported bugs, made
                            suggestions and contributed to this project. ^ _ ^</b>

                    </div>

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
