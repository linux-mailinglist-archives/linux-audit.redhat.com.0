Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 948CCA7628
	for <lists+linux-audit@lfdr.de>; Tue,  3 Sep 2019 23:29:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2204A81F19;
	Tue,  3 Sep 2019 21:29:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E853100195C;
	Tue,  3 Sep 2019 21:29:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28AE189CF;
	Tue,  3 Sep 2019 21:29:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83LSwKN027846 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 17:28:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 656A75C21A; Tue,  3 Sep 2019 21:28:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E89E5C219
	for <linux-audit@redhat.com>; Tue,  3 Sep 2019 21:28:55 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE8D510C6973
	for <linux-audit@redhat.com>; Tue,  3 Sep 2019 21:28:54 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id a21so20145472edt.11
	for <linux-audit@redhat.com>; Tue, 03 Sep 2019 14:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cs-stonybrook-edu.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xPLgX/FpWaTz2ejixGCLZ+XNJZR9s1lNEsskkVdA6Ok=;
	b=VQOeGXzhzlwPdsFL/WcMb4qyvi7ToMA2Mg83v8kQrrolskgBv5H0401DPUrRxPOY51
	dxa6qRK23BF3SWVL3vuqRzyBKg4fDbQfifPD+ADnzk3Z2By/RDAz8FXpqMcFySXvVHJs
	lHnJ5UGfXNuuUPybm32RD8+2sFon54/sX7hVGTDi7TZ6qvB58Bazq4BNPOsFEAF0cS5M
	kgfGqbqDdSeWYUFlxVtcQOU8XXG4HfY6VCuzaBI9mhnkro65+ixyhvTIj9aDKEq5J3KF
	mwYIlFlnM3aB66zAjxbNhTfpn+twUW3Fnn8BNqFuXtQvRoOVbj/lvp6/f1Tjc2N4Smnp
	LIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xPLgX/FpWaTz2ejixGCLZ+XNJZR9s1lNEsskkVdA6Ok=;
	b=phXnITPQ9H7nJ0KpSPcXtCx1G4u54UXwMVoptqJ022v4b2LUfAjyNA5f+EyNin56sn
	T/5HziyfiPhLmYzoTUnyf7xoXZ+aaeeEYn8ld3/sRfNtn5BrwOc3ztLRrbvbIK295UKT
	ZTLhHufrPBHvi8xjIwOejnTIhdH8khbBRFol7OG2nJDC4Pq8nmUL5Rj8sgXzMi1zT4LH
	Tla/fT18zC7qyPL/7HZG5rVWV9Vq4WWIyW+WRwFcWixVQs7tz0+kzDNL9p8Fq3dJdv3Z
	27ddd2MR6hxZiTAM0N95j9GvYaMm3sHAoOfHoRq5k2PQ1whu1rCpqZg+PIM+bnhNtqH2
	CVcg==
X-Gm-Message-State: APjAAAUZEGFgUvMzZDMedijWZzA4+FPuvf36McWH5uIT+gj0eief+/Lb
	ecnuvfvNPeGb3QYYUNwvqTOlAayRZOOPQ1DhcR8ucRAL
X-Google-Smtp-Source: APXvYqy9zqaS/W4KGvomxBgPbotHm88WkUcND9jRlUnt6RYKatSekyY95cOXswvnoKE53YQ0xEtzebmlkvm4dwI4T5I=
X-Received: by 2002:aa7:d0d1:: with SMTP id u17mr6612709edo.99.1567546133408; 
	Tue, 03 Sep 2019 14:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAG-5c_G5ULcbh_TEZEefm0VM8XeDW=OJoLBVRq+1=VO-BtMczA@mail.gmail.com>
	<12155994.AWt580abvh@x2>
In-Reply-To: <12155994.AWt580abvh@x2>
From: Ankitha Kundhuru <akundhuru@cs.stonybrook.edu>
Date: Tue, 3 Sep 2019 17:28:38 -0400
Message-ID: <CAG-5c_FVmHLg7mMz2-DuC5Qi97Z2=enc9+O8MKon0_HhH84OJg@mail.gmail.com>
Subject: Re: Help with audit syscall event output
To: Steve Grubb <sgrubb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.65]);
	Tue, 03 Sep 2019 21:28:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Tue, 03 Sep 2019 21:28:55 +0000 (UTC) for IP:'209.85.208.53'
	DOMAIN:'mail-ed1-f53.google.com' HELO:'mail-ed1-f53.google.com'
	FROM:'akundhuru@cs.stonybrook.edu' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.53 mail-ed1-f53.google.com 209.85.208.53
	mail-ed1-f53.google.com <akundhuru@cs.stonybrook.edu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Content-Type: multipart/mixed; boundary="===============4655359671277560334=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 03 Sep 2019 21:29:06 +0000 (UTC)

--===============4655359671277560334==
Content-Type: multipart/alternative; boundary="000000000000738de50591acc6e1"

--000000000000738de50591acc6e1
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks!

Thanks & Regards,
Ankitha Kundhuru


On Tue, Sep 3, 2019 at 5:24 PM Steve Grubb <sgrubb@redhat.com> wrote:

> On Tuesday, September 3, 2019 5:15:29 PM EDT Ankitha Kundhuru wrote:
> > Any help is greatly appreciated.
> >
> > My piece of code can read audit.log file and process it.But when I enable
> > good number of syscalls, disk gets filled really quick (15GB for half a
> day
> > usage)
> > I wanted to know if there is a way to directly get the events from
> > userspace audit daemon instead of writing it to a file. Plan is that my
> > application should process the events as soon as they are created.
>
> Yes, there is a presentation that describes the architecture of the audit
> system including the realtime event interface:
>
> http://people.redhat.com/sgrubb/audit/audit_ids_2011.pdf
>
> And there is sample code for a plugin here:
>
> https://github.com/linux-audit/audit-userspace/tree/master/contrib/plugin
>
> -Steve
>
>
>

--000000000000738de50591acc6e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Awesome, thanks!=C2=A0<div><br clear=3D"all"><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr">Thanks &amp; Regards,<div>Ankitha Kundhuru</div></div></div></d=
iv><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Sep 3, 2019 at 5:24 PM Steve Grubb &lt;<a href=3D"mail=
to:sgrubb@redhat.com">sgrubb@redhat.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Tuesday, September 3, 2019 5:15:2=
9 PM EDT Ankitha Kundhuru wrote:<br>
&gt; Any help is greatly appreciated.<br>
&gt; <br>
&gt; My piece of code can read audit.log file and process it.But when I ena=
ble<br>
&gt; good number of syscalls, disk gets filled really quick (15GB for half =
a day<br>
&gt; usage)<br>
&gt; I wanted to know if there is a way to directly get the events from<br>
&gt; userspace audit daemon instead of writing it to a file. Plan is that m=
y<br>
&gt; application should process the events as soon as they are created.<br>
<br>
Yes, there is a presentation that describes the architecture of the audit <=
br>
system including the realtime event interface:<br>
<br>
<a href=3D"http://people.redhat.com/sgrubb/audit/audit_ids_2011.pdf" rel=3D=
"noreferrer" target=3D"_blank">http://people.redhat.com/sgrubb/audit/audit_=
ids_2011.pdf</a><br>
<br>
And there is sample code for a plugin here:<br>
<br>
<a href=3D"https://github.com/linux-audit/audit-userspace/tree/master/contr=
ib/plugin" rel=3D"noreferrer" target=3D"_blank">https://github.com/linux-au=
dit/audit-userspace/tree/master/contrib/plugin</a><br>
<br>
-Steve<br>
<br>
<br>
</blockquote></div>

--000000000000738de50591acc6e1--


--===============4655359671277560334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============4655359671277560334==--

