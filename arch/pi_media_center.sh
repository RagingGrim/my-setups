#!/bin/bash
if [ "$(id -u)"] != "0" ]; then
  echo "sudo please!"
  exit 1
fi

if [""]
apt-get update
apt-get install kodi vim curl nc lighthttpd dnsmasq
curl -sSL https://install.pi-hole.net | bash
# TODO: Check if installing pavucontrol breaks setup.

echo "Blacklisting spotify ads!"
pihole -b adclick.g.doublecklick.net
pihole -b adeventtracker.spotify.com
pihole -b ads-fa.spotify.com
pihole -b analytics.spotify.com
pihole -b audio2.spotify.com
pihole -b b.scorecardresearch.com
pihole -b bounceexchange.com
pihole -b bs.serving-sys.com
pihole -b content.bitsontherun.com
pihole -b core.insightexpressai.com
pihole -b crashdump.spotify.com
pihole -b d2gi7ultltnc2u.cloudfront.net
pihole -b d3rt1990lpmkn.cloudfront.net
pihole -b desktop.spotify.com
pihole -b doubleclick.net
pihole -b ds.serving-sys.com
pihole -b googleadservices.com
pihole -b googleads.g.doubleclick.net
pihole -b gtssl2-ocsp.geotrust.com
pihole -b js.moatads.com
pihole -b log.spotify.com
pihole -b media-match.com
pihole -b omaze.com
pihole -b open.spotify.com
pihole -b pagead46.l.doubleclick.net
pihole -b pagead2.googlesyndication.com
pihole -b partner.googleadservices.com
pihole -b pubads.g.doubleclick.net
pihole -b redirector.gvt1.com
pihole -b s0.2mdn.net
pihole -b securepubads.g.doubleclick.net
pihole -b spclient.wg.spotify.com
pihole -b tpc.googlesyndication.com
pihole -b v.jwpcdn.com
pihole -b video-ad-stats.googlesyndication.com
pihole -b weblb-wg.gslb.spotify.com
pihole -b www.googleadservices.com
pihole -b www.googletagservices.com
echo "Blacklisting youtube ads!"
pihole -b r4---sn-vgqs7nez.googlevideo.com
pihole -b r4.sn-vgqs7nez.googlevideo.com
pihole -b www.youtube-nocookie.com
pihole -b i1.ytimg.com
pihole -b r17---sn-vgqsenes.googlevideo.com
pihole -b r2---sn-vgqs7n7k.googlevideo.com
pihole -b clients6.google.com
pihole -b r1---sn-vgqsen7z.googlevideo.com
pihole -b r1.sn-vgqsen7z.googlevideo.com
pihole -b r20---sn-vgqs7ne7.googlevideo.com
pihole -b r20.sn-vgqs7ne7.googlevideo.com

pihole -up -gs
pihole restartdns
pihole enable
echo "Adblocking enabled!"

echo "Enabling static ip 10.0.0.4 on eth0"
echo "interface eth0" >> /etc/dhcpcd.conf

echo "static ip_address=10.0.0.4/24" >> /etc/dhcpcd.conf
echo "static routers=10.0.0.2" >> /etc/dhcpcd.conf
echo "static domain_name_servers=10.0.0.4" >> /etc/dhcpcd.conf


echo "_____________ALL DONE_________________________"
echo "After script runs; Please setup configurations for pihole and kodi."
echo "Also change the video memory for the pi otherwise it won't work very well."
echo "Arrrgggg ; Install exodus and add trakt account."
