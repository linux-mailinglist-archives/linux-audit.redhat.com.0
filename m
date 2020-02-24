Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 26677169B2D
	for <lists+linux-audit@lfdr.de>; Mon, 24 Feb 2020 01:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582504115;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0H2Y0mLGUgEuvSWCb0Hecp0Vb40MI7JFIAu6tDVjSmA=;
	b=He4JgUshguzcdxhRpJs+twXeTVXKX7v0CurQy9f1Y9CSU4Q+zlSkzm0QmfUL4YNum6Ertt
	r2IO5TfVNvW96/0XaMMir6zjrNjrLiJ6oXKhmOizawhcSQZgSyz3Q8gMtuUgEdh6UNiwhb
	hs2R9ensv2/Qjn6CSjh5GRQ/S9scBes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479--XlaQ7yTO6qqHC-ODfh2_w-1; Sun, 23 Feb 2020 19:28:32 -0500
X-MC-Unique: -XlaQ7yTO6qqHC-ODfh2_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D5BE185734F;
	Mon, 24 Feb 2020 00:28:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4DF1620D8;
	Mon, 24 Feb 2020 00:28:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E282118089CD;
	Mon, 24 Feb 2020 00:28:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O0Rshn001537 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 23 Feb 2020 19:27:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 130EDA318C; Mon, 24 Feb 2020 00:27:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ECD2A317C
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 00:27:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76DB3185A78F
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 00:27:51 +0000 (UTC)
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
	[209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-187-DvYg0b-TP2SeIfQ2x-T32A-1; Sun, 23 Feb 2020 19:27:49 -0500
X-MC-Unique: DvYg0b-TP2SeIfQ2x-T32A-1
Received: by mail-vk1-f197.google.com with SMTP id d28so3788462vkn.15
	for <linux-audit@redhat.com>; Sun, 23 Feb 2020 16:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d05hR7ZRts1A8l2j03G6QSm5ernV3BdhxfAclChvG+w=;
	b=WXuOfOBPFTIjmXkNzrv4Wh4iivnqEniEA7gkpRpJEDyrdriPljiwTLcSNhoqtazqSn
	IBURssdzbSWnYJYSn8SizK+lLVKQX+NQAKICzSht/bINSHFhk3aHEKuFfQeq+LOXgGjA
	G5jY2arZulTc5vZAHTYbv2MmzFwtb1tapgH233pAfFnarCoslECZjzaSzpC227/DI2ot
	qmUFZXjFy//Jv6Pos79CaA6EFgq8OCg5UTANfLzZdB3ndzWhKoWXrUMRa9cI8DPkSYYA
	iYvUeOtJduMqOSGRqEu+qEhqapV7TrMJ7JgIgDyrZHkheQ8bUZ33IExTyB0a4zjYMqD2
	i0zQ==
X-Gm-Message-State: APjAAAXnn12lF0o93aQ/ChfRtTUWS+qXNMf9rpMWh6n6MY32dpiuJMEW
	WZMW7zTkLQKNTGt1Px1FI3r3FNjMvAr7bqsNIK9jc7aZue7CYk1OanqtWxeoR5umm+leU27CgtK
	bESsW6TLXnPDwk14kcDkRW01aqSYo0U55doQ=
X-Received: by 2002:a67:f847:: with SMTP id b7mr25291669vsp.40.1582504068499; 
	Sun, 23 Feb 2020 16:27:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXVfyuw6DEkJkS9eFPyvtxrXV2UccTcuI50L7eE6KRtzJTdCtwHid8W3ITIw+Fqsm9H8GQYHR8Cu8gu/OK5L4=
X-Received: by 2002:a67:f847:: with SMTP id b7mr25291663vsp.40.1582504068199; 
	Sun, 23 Feb 2020 16:27:48 -0800 (PST)
MIME-Version: 1.0
References: <CAM5ObREwVjihySamgkSGOxBK8Rwe0jgra5+Ec5ZHK5J5XzD_Ow@mail.gmail.com>
	<3341724.7X2qyikPX2@x2>
	<CAM5ObRErKLEDB_2RAWBf_Xp+V+aEdBQhi_dnicM9o2Q7SK_y2g@mail.gmail.com>
	<2890955.nCKnN53pJf@x2>
In-Reply-To: <2890955.nCKnN53pJf@x2>
From: Moshe Rechtman <mrechtma@redhat.com>
Date: Mon, 24 Feb 2020 02:27:37 +0200
Message-ID: <CAM5ObRFgYH=NHmi+Hkhi8Cpmq3xd0HrCN2mx8KPhm17go3Renw@mail.gmail.com>
Subject: Re: Question about excluding rules
To: Steve Grubb <sgrubb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============4618457233288140215=="

--===============4618457233288140215==
Content-Type: multipart/alternative; boundary="000000000000d74983059f477093"

--000000000000d74983059f477093
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Steve,

Thanks so much for your help, I've modified audit.rules as per you
recommendation:
# cat audit.rules
# This file contains the auditctl rules that are loaded
# whenever the audit daemon is started via the initscripts.
# The rules are simply the parameters that would be passed
# to auditctl.

# First rule - delete all
-D

# Increase the buffers to survive stress events.
# Make this bigger for busy systems
-b 320
#-b 32768

# Feel free to add below this line. See auditctl man page

-a exit,always -F arch=3Db64 -F euid=3D0 -F auid=3D-1 -S execve -k rootact

# auditctl -l
LIST_RULES: exit,always arch=3D3221225534 (0xc000003e) euid=3D0 auid=3D-1
(0xffffffff) key=3Drootact syscall=3Dexecve

With the above settings, audit stop from logging all root commands!
Any recommendations/suggestions would be appreciated.

Kind regards,
Moshe


Moshe Rechtman

Technical Support Engineer

Red Hat Israel <https://www.redhat.com/>

34 Jerusalem rd. Ra'anana, 43501

*mrechtma@redhat.com <kweg@redhat.com> *  T: *+972-9-**7692289 *
M: *+972-54-4971516*   F: +972-9-7692223
@RedHat <https://twitter.com/redhat>   Red Hat
<https://www.linkedin.com/company/red-hat>  Red Hat
<https://www.facebook.com/RedHatInc>
<https://red.ht/sig>


On Fri, Feb 21, 2020 at 3:53 PM Steve Grubb <sgrubb@redhat.com> wrote:

> On Friday, February 21, 2020 2:32:58 AM EST Moshe Rechtman wrote:
> > Thanks so much for your help! I've included your suggested filter in
> > audit.rules as shown below:
> >
> > # cat audit.rules1
> >
> >       1 # This file contains the auditctl rules that are loaded
> >       2 # whenever the audit daemon is started via the initscripts.
> >       3 # The rules are simply the parameters that would be passed
> >       4 # to auditctl.
> >       5 # First rule - delete all
> >       6 -D
> >       7 # Increase the buffers to survive stress events.
> >       8 # Make this bigger for busy systems
> >       9 -b 320
> >      10 ### Feel free to add below this line. See auditctl man page
> >      11 -a exit,always -F arch=3Db64 -F euid=3D0 -S execve -k rootact
> >      12 -a exit,always -F arch=3Db32 -F euid=3D0 -S execve -k rootact
> >      13 -a exit,always -F arch=3Db64 -F euid>=3D500 -S execve -k userac=
t
> >      14 -a exit,always -F arch=3Db32 -F euid>=3D500 -S execve -k userac=
t
> >      15 -a exit,always -F arch=3Db64 -F euid=3D0 -F auid!=3Dunset -S ex=
ecve -k
> > rootact
> >      16 -a exit,always -F arch=3Db32 -F euid=3D0 -F auid!=3Dunset -S ex=
ecve -k
> > rootact
>
> It won't work this way. You now have 2 sets of rootact. The audit rule
> engine
> is a first match wins. So, this second set of rules will never trigger.
> The
> rule I mentioned was supposed to replace the rule in the list.
>
> > After restarting the auditd service following error received:
> >
> > # service auditd restart
> > Stopping auditd:                                           [  OK  ]
> > Starting auditd:                                           [  OK  ]
> > Unknown user: unset
> > -F unknown field: auid
>
> OK. I guess this is really old. Then make it auid=3D-1
>
> -Steve
>
>
>

--000000000000d74983059f477093
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Steve,</div><div><br></div><di=
v>Thanks so much for your help, I&#39;ve modified audit.rules as per you re=
commendation:</div><div># cat audit.rules<br># This file contains the audit=
ctl rules that are loaded<br># whenever the audit daemon is started via the=
 initscripts.<br># The rules are simply the parameters that would be passed=
<br># to auditctl.<br><br># First rule - delete all<br>-D<br><br># Increase=
 the buffers to survive stress events.<br># Make this bigger for busy syste=
ms<br>-b 320<br>#-b 32768<br><br># Feel free to add below this line. See au=
ditctl man page<br><br>-a exit,always -F arch=3Db64 -F euid=3D0 -F auid=3D-=
1 -S execve -k rootact</div><div><br></div><div># auditctl -l<br>LIST_RULES=
: exit,always arch=3D3221225534 (0xc000003e) euid=3D0 auid=3D-1 (0xffffffff=
) key=3Drootact syscall=3Dexecve</div><div><br></div><div>With the above se=
ttings, audit stop from logging all root commands!</div><div>Any recommenda=
tions/suggestions would be appreciated.</div><div><br></div><div>Kind regar=
ds,</div><div>Moshe<br></div><div><br></div><div><br></div><div><div><div d=
ir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"=
><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"margin-left:44px=
"><div style=3D"margin-bottom:0px;margin-left:0px;padding-bottom:5px"><div =
dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"=
ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><p style=3D"margin:=
0px;font-weight:bold;padding:0px;font-size:14px;text-transform:capitalize;f=
ont-family:RedHatText,sans-serif">Moshe Rechtman<span style=3D"color:rgb(17=
0,170,170);margin:0px"></span></p><p style=3D"margin:0px;font-size:14px;col=
or:rgb(0,0,0);font-family:overpass,sans-serif;font-weight:bold;padding:0px;=
text-transform:uppercase"><span style=3D"font-family:RedHatText,sans-serif;=
font-size:12px;text-transform:capitalize;font-weight:normal;color:rgb(34,34=
,34)">Technical Support Engineer</span><br></p></div></div></div></div></di=
v></div></div></div></div></div><div style=3D"margin-left:44px"><div style=
=3D"margin-bottom:0px;margin-left:0px;padding-bottom:5px"><div dir=3D"ltr">=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><p style=3D"margin:0px 0px 4px;=
font-size:12px;font-family:RedHatText,sans-serif"><a href=3D"https://www.re=
dhat.com/" style=3D"color:rgb(0,136,206);margin:0px" target=3D"_blank">Red =
Hat=C2=A0Israel</a></p><div style=3D"margin-bottom:4px"><p style=3D"margin:=
0px;font-size:12px;font-family:RedHatText,sans-serif">34 Jerusalem rd. Ra&#=
39;anana, 43501</p></div><p style=3D"margin:0px"><span style=3D"font-family=
:RedHatText,sans-serif;font-size:12px;margin:0px;padding:0px"><u><a href=3D=
"mailto:kweg@redhat.com" style=3D"color:rgb(17,85,204)" target=3D"_blank">m=
rechtma@redhat.com</a>=C2=A0</u>=C2=A0</span><font face=3D"RedHatText, sans=
-serif"><span style=3D"font-size:12px">=C2=A0T:=C2=A0</span></font><u style=
=3D"font-family:RedHatText,sans-serif;font-size:12px">+972-9-</u><font face=
=3D"RedHatText, sans-serif"><span style=3D"font-size:12px"><u>7692289=C2=A0=
</u></span></font><br><font face=3D"RedHatText, sans-serif"><span style=3D"=
font-size:12px">M:=C2=A0</span></font><u style=3D"font-family:RedHatText,sa=
ns-serif;font-size:12px"><span>+972-54-4971516</span></u><font face=3D"RedH=
atText, sans-serif"><span style=3D"font-size:12px">=C2=A0 =C2=A0F:=C2=A0</s=
pan></font><a href=3D"tel:+972-9-7692223" style=3D"color:rgb(0,0,0);font-fa=
mily:RedHatText,sans-serif;font-size:12px;margin:0px" target=3D"_blank">+97=
2-9-7692223</a><font face=3D"RedHatText, sans-serif"><span style=3D"font-si=
ze:12px">=C2=A0=C2=A0 =C2=A0</span></font></p><div style=3D"font-size:12px;=
font-family:RedHatText,sans-serif;margin-bottom:8px"><a href=3D"https://twi=
tter.com/redhat" title=3D"twitter" style=3D"color:rgb(0,0,0);background:tra=
nsparent url(&quot;https://marketing-outfit-prod-images.s3-us-west-2.amazon=
aws.com/3780bd4ede961ef3cd4108b8c0e80186/web-icon-twitter.png&quot;) no-rep=
eat scroll 0px 50%/13px auto;display:inline-block;line-height:20px;padding-=
left:13px" target=3D"_blank"><span style=3D"margin-left:2px">@RedHat</span>=
</a>=C2=A0=C2=A0=C2=A0<a href=3D"https://www.linkedin.com/company/red-hat" =
title=3D"LinkedIn" style=3D"color:rgb(0,0,0);background:transparent url(&qu=
ot;https://marketing-outfit-prod-images.s3-us-west-2.amazonaws.com/8d3507e3=
c6b6c9ad10e301accf1a4af0/web-icon-linkedin.png&quot;) no-repeat scroll 0px =
50%/12px auto;display:inline-block;line-height:20px;padding-left:12px;margi=
n:0px 4px 0px 3px;padding-top:1px" target=3D"_blank"><span style=3D"margin-=
left:4px">Red Hat</span></a>=C2=A0=C2=A0<a href=3D"https://www.facebook.com=
/RedHatInc" title=3D"Facebook" style=3D"color:rgb(0,0,0);background:transpa=
rent url(&quot;https://marketing-outfit-prod-images.s3-us-west-2.amazonaws.=
com/220b85e2f100025e94cb1bcd993bd51d/web-icon-facebook.png&quot;) no-repeat=
 scroll 0px 50%/11px auto;display:inline-block;line-height:20px;padding-lef=
t:13px" target=3D"_blank">Red Hat</a></div><div style=3D"margin-top:12px"><=
table border=3D"0"><tbody><tr><td width=3D"100px"><a href=3D"https://red.ht=
/sig" style=3D"color:rgb(17,85,204)" target=3D"_blank"><img src=3D"https://=
static.redhat.com/libs/redhat/brand-assets/latest/corp/logo.png" width=3D"9=
0" height=3D"auto"></a></td></tr></tbody></table></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div></div=
></div></div></div><br></div></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 21, 2020 at 3:53 PM Steve Gr=
ubb &lt;<a href=3D"mailto:sgrubb@redhat.com">sgrubb@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Friday, Fe=
bruary 21, 2020 2:32:58 AM EST Moshe Rechtman wrote:<br>
&gt; Thanks so much for your help! I&#39;ve included your suggested filter =
in<br>
&gt; audit.rules as shown below:<br>
&gt; <br>
&gt; # cat audit.rules1<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 # This file contains the auditctl rules th=
at are loaded<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02 # whenever the audit daemon is started via=
 the initscripts.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A03 # The rules are simply the parameters that=
 would be passed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A04 # to auditctl.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A05 # First rule - delete all<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A06 -D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A07 # Increase the buffers to survive stress e=
vents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A08 # Make this bigger for busy systems<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A09 -b 320<br>
&gt;=C2=A0 =C2=A0 =C2=A0 10 ### Feel free to add below this line. See audit=
ctl man page<br>
&gt;=C2=A0 =C2=A0 =C2=A0 11 -a exit,always -F arch=3Db64 -F euid=3D0 -S exe=
cve -k rootact<br>
&gt;=C2=A0 =C2=A0 =C2=A0 12 -a exit,always -F arch=3Db32 -F euid=3D0 -S exe=
cve -k rootact<br>
&gt;=C2=A0 =C2=A0 =C2=A0 13 -a exit,always -F arch=3Db64 -F euid&gt;=3D500 =
-S execve -k useract<br>
&gt;=C2=A0 =C2=A0 =C2=A0 14 -a exit,always -F arch=3Db32 -F euid&gt;=3D500 =
-S execve -k useract<br>
&gt;=C2=A0 =C2=A0 =C2=A0 15 -a exit,always -F arch=3Db64 -F euid=3D0 -F aui=
d!=3Dunset -S execve -k<br>
&gt; rootact<br>
&gt;=C2=A0 =C2=A0 =C2=A0 16 -a exit,always -F arch=3Db32 -F euid=3D0 -F aui=
d!=3Dunset -S execve -k<br>
&gt; rootact<br>
<br>
It won&#39;t work this way. You now have 2 sets of rootact. The audit rule =
engine <br>
is a first match wins. So, this second set of rules will never trigger. The=
 <br>
rule I mentioned was supposed to replace the rule in the list.<br>
<br>
&gt; After restarting the auditd service following error received:<br>
&gt; <br>
&gt; # service auditd restart<br>
&gt; Stopping auditd:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0[=C2=A0 OK=C2=A0 ]<br>
&gt; Starting auditd:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0[=C2=A0 OK=C2=A0 ]<br>
&gt; Unknown user: unset<br>
&gt; -F unknown field: auid<br>
<br>
OK. I guess this is really old. Then make it auid=3D-1<br>
<br>
-Steve<br>
<br>
<br>
</blockquote></div>

--000000000000d74983059f477093--

--===============4618457233288140215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============4618457233288140215==--

