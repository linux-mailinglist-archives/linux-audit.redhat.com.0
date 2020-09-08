Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 90D31262524
	for <lists+linux-audit@lfdr.de>; Wed,  9 Sep 2020 04:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599618100;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3vfiA67g1SveFRwXLvMKCB0lnRp+nvd0PhvgoV4aW7k=;
	b=UCh4qOTuDOEC/SjaUfyvjfLotWoXiA5USlee1/EL8WWMBHGU4BxKmGBHeYUyECbsQqhXqx
	qtKI0l2O5BULjRZMIqrQC4cyfkG2r9eiZIAcDDoqLpBGM9vxp5lf1hQOrQU4QBC+2dSxIq
	FfjftbOVwMiAzfoH3OYJy5WRL9xsYTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-f5ayl1ExMCu0YVmf4NSzow-1; Tue, 08 Sep 2020 22:21:37 -0400
X-MC-Unique: f5ayl1ExMCu0YVmf4NSzow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E555A1074647;
	Wed,  9 Sep 2020 02:21:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCF921002D5F;
	Wed,  9 Sep 2020 02:21:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21BA07A00C;
	Wed,  9 Sep 2020 02:21:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 088N2JNd027394 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 19:02:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A5F3215670C; Tue,  8 Sep 2020 23:02:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3657C2156708
	for <linux-audit@redhat.com>; Tue,  8 Sep 2020 23:02:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50B96800296
	for <linux-audit@redhat.com>; Tue,  8 Sep 2020 23:02:16 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-325-6_F1taW4OySKHrneYkqBUw-1; Tue, 08 Sep 2020 19:02:13 -0400
X-MC-Unique: 6_F1taW4OySKHrneYkqBUw-1
Received: by mail-wr1-f72.google.com with SMTP id g6so193506wrv.3
	for <linux-audit@redhat.com>; Tue, 08 Sep 2020 16:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=u8AIjLGglkkm/8RQeJO8KCiFmiU8QjNGNk00zdPHCTM=;
	b=ooJO2nBN2H5WumKGPuWs/RgcUn1z+25SUrdoUcaZzcj4woUTTfep2GZ9gbY6ihBpde
	k4NIzMa9rxKOH9ClX2DI9Rt4gPwoJ//It4HzrhWw/eBCQt6HzwTMM6iu6Og2q8aaRZV4
	uc41Nm6mPk3caqxjQ0ULwvz+S5r58m9Ci5CR4Ahua6lxU3zCD18HrthzspNOdreox7gh
	V2cROGpPdq8yogB5QLF0OXHmfuqAKeeaugG2bX3kfccIMddvpysEc7yITRFbsZiP8ibj
	KH1HWVZn5EBcNSUKcEp2r9/VTgjiMw2OyV6f/V3DdwODXv+TyCarU2A/7JhvdicTnHP1
	qGyA==
X-Gm-Message-State: AOAM532e/21JBY1jBTiQYdUG6o+LponITrYeUNGbDxn47L94jW8vEx4w
	wp8IxX2p9zPIw3g/+gub5F7Bl1/dyJ+nzHX5Ybt0w+sE0j7WuwPvt/A1S6EcgKGxqPd+xFxTWLW
	uS9aDOuC7xXPCFC+ZFThs0Xa/Cm3mFLItX7Y=
X-Received: by 2002:adf:ba83:: with SMTP id p3mr905280wrg.246.1599606132577;
	Tue, 08 Sep 2020 16:02:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJ+Ss3Jt9VGVntAFYMo9yYcgMcMaYnT4BWMk8QKx8gUMsRgSkEanYhSKTZnsbE7YQotur5OEi0u9U28pk/a34=
X-Received: by 2002:adf:ba83:: with SMTP id p3mr905260wrg.246.1599606132309;
	Tue, 08 Sep 2020 16:02:12 -0700 (PDT)
MIME-Version: 1.0
From: Gabriel Alford <ralford@redhat.com>
Date: Tue, 8 Sep 2020 17:02:01 -0600
Message-ID: <CAOxyEpnvNQzBsweRmH5HTDuAY5umpoBQsLCLnEDOde7zkFZiVg@mail.gmail.com>
Subject: -F perm in audit rules
To: linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 08 Sep 2020 22:21:21 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8934034694979488708=="

--===============8934034694979488708==
Content-Type: multipart/alternative; boundary="0000000000004c1b7605aed553b5"

--0000000000004c1b7605aed553b5
Content-Type: text/plain; charset="UTF-8"

Hello,

By default, does auditd audit read, write, execute, and attribute in audit
rules or do you need to specify
-F perm=wxra ?

For example,

-a always,exit -F path=/usr/bin/at -F perm=wrxa

vs

-a always,exit -F path=/usr/bin/at

Thanks and let me know if what I am asking doesn't make sense.

Gabriel Alford

Member of the technical staff

office of the chief technologist

red hat Public Sector

Red Hat

<https://www.redhat.com>

ralford@redhat.com    T: 972-707-6483 <650-254-4391>    M: 303-550-7234
<https://red.ht/sig> <https://red.ht/sig>

--0000000000004c1b7605aed553b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>By default, does auditd audit=C2=
=A0<span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSys=
temFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color E=
moji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">read, write, execute,=
 and attribute in audit rules or do you need to specify</span></div><div><s=
pan style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFo=
nt,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&=
quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">-F perm=3Dwxra ?</span></d=
iv><div><span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkM=
acSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Co=
lor Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div=
><div><span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMac=
SystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Colo=
r Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">For example,</span=
></div><div><span style=3D"color:rgb(36,41,46);font-family:-apple-system,Bl=
inkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span><=
/div><div>-a always,exit -F path=3D/usr/bin/at -F perm=3Dwrxa<span style=3D=
"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Seg=
oe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;=
Segoe UI Emoji&quot;;font-size:14px"><br></span></div><div><br></div><div>v=
s</div><div><br></div><div>-a always,exit -F path=3D/usr/bin/at<br></div><d=
iv><br></div><div>Thanks and let me know if what I am asking doesn&#39;t ma=
ke=C2=A0sense.</div><div><font color=3D"#24292e" face=3D"-apple-system, Bli=
nkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif, Apple Color Emoji,=
 Segoe UI Emoji"><span style=3D"font-size:14px"><br clear=3D"all"></span></=
font><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmai=
l_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div><span>Gab=
riel Alford</span><span></span>
<p style=3D"font-weight:normal;font-size:10px;margin:0px 0px 4px;text-trans=
form:uppercase"><span>Member of the technical staff</span></p><p style=3D"f=
ont-weight:normal;font-size:10px;margin:0px 0px 4px;text-transform:uppercas=
e"><span>office of the chief technologist</span></p><p style=3D"font-weight=
:normal;font-size:10px;margin:0px 0px 4px;text-transform:uppercase"><span>r=
ed hat Public Sector<br></span></p></div><p style=3D"font-weight:normal;mar=
gin:0px;font-size:10px;color:rgb(153,153,153)"><a style=3D"color:rgb(0,136,=
206);font-size:10px;margin:0px;text-decoration:none;font-family:&quot;overp=
ass&quot;,sans-serif" href=3D"https://www.redhat.com" target=3D"_blank">Red=
 Hat <span><br><br></span></a></p>


<p style=3D"font-weight:normal;margin:0px 0px 6px;font-size:10px;color:rgb(=
153,153,153)"><span style=3D"margin:0px;padding:0px">
<a style=3D"color:rgb(0,136,206);font-size:10px;margin:0px;text-decoration:=
none;font-family:&quot;overpass&quot;,sans-serif" href=3D"mailto:ralford@re=
dhat.com" target=3D"_blank">ralford@redhat.com</a>=C2=A0 =C2=A0</span>
<span>T: <a href=3D"tel:650-254-4391" style=3D"color:rgb(0,136,206);font-si=
ze:10px;margin:0px;text-decoration:none;font-family:&quot;overpass&quot;,sa=
ns-serif" target=3D"_blank">972-707-6483</a>  =C2=A0 =C2=A0</span><span>M: =
<a href=3D"tel:303-550-7234" style=3D"color:rgb(0,136,206);font-size:11px;m=
argin:0px;text-decoration:none;font-family:&quot;overpass&quot;,sans-serif"=
 target=3D"_blank">303-550-7234</a>  =C2=A0 =C2=A0</span>
</p>
<a href=3D"https://red.ht/sig" target=3D"_blank"> </a><a href=3D"https://re=
d.ht/sig" target=3D"_blank"><img src=3D"https://static.redhat.com/libs/redh=
at/brand-assets/latest/corp/logo.png" width=3D"90" height=3D"auto"></a></di=
v></div></div></div></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div></div></div></div></div>

--0000000000004c1b7605aed553b5--

--===============8934034694979488708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============8934034694979488708==--

