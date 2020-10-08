Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 11AA8287067
	for <lists+linux-audit@lfdr.de>; Thu,  8 Oct 2020 10:01:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-kd48z5AIOxar7bdTsso0FQ-1; Thu, 08 Oct 2020 04:01:46 -0400
X-MC-Unique: kd48z5AIOxar7bdTsso0FQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4D73804018;
	Thu,  8 Oct 2020 08:01:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 933DA76648;
	Thu,  8 Oct 2020 08:01:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 060E479FF4;
	Thu,  8 Oct 2020 08:01:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09880Dpf004667 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 8 Oct 2020 04:00:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2770A2166B28; Thu,  8 Oct 2020 08:00:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 221C92166BA3
	for <linux-audit@redhat.com>; Thu,  8 Oct 2020 08:00:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4046B18AE940
	for <linux-audit@redhat.com>; Thu,  8 Oct 2020 08:00:10 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-348-od9tfg5RNf-04268kZH8wA-1; Thu, 08 Oct 2020 04:00:05 -0400
X-MC-Unique: od9tfg5RNf-04268kZH8wA-1
Received: by mail-lf1-f51.google.com with SMTP id h6so5441447lfj.3;
	Thu, 08 Oct 2020 01:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QhVguWDRcrFtRZsDGbiQdetkvTNREuSr9RYqHteR0dI=;
	b=FCzEcFJbWKg959ARGYlLgytdMBAYJYxNZLANc9RDTJnlJFUGFLcEEkV8NqOoFNdQZI
	mdntACDECO0ASfeL6PJDzvk8+DxRDoTF7q8bUcS8mNDeuxtWj1uBie7CCvO0MrdTsdR+
	+9x6tLbvmTKexkN0wIt0cqCgduIFQQx8Q6JefcJrGNw55+3GQU5kFnu+VhPnpP47D+Ih
	l05Dr9q7uhX1XAKB5Cf64jOeKtlxZrSTQh9w8xxNq7ieKCw2tgTwkozXxmAgB2N3CX5m
	gt26CJaXAhPcpnToyzFQW6SrIfTiAKnDnO3uxv9P84iAcdE40xWANJHliiCCeC53KslF
	/7mg==
X-Gm-Message-State: AOAM5318LBS28hsS2Mm54UcKXsJmLG4bruizZyJpEuBdq4B6NTO1prjT
	HXleZfx59i4sGBvqb9DtyoR5mIZ81Tnqj99a3X10u3PFz1U=
X-Google-Smtp-Source: ABdhPJwnPXacUvUnhprpYuhJ1gkunoWOYPRmU/NHZSvnoy+rXrZd2KFrp5XUoQvB7WD6Ejp5tIegwZ3bKmsZeA6wcPU=
X-Received: by 2002:ac2:418c:: with SMTP id z12mr2368937lfh.231.1602144003217; 
	Thu, 08 Oct 2020 01:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAPErmPdDACGemKqTrUk4xKNBwnoj6FEeWbsvmk7jS0TjOyaOqg@mail.gmail.com>
	<5549003.MhkbZ0Pkbq@x2>
	<CAHC9VhThN4R7jsukKrmjVG=6Rm07jWwjcNQ5CS4v6JzMh+NQbg@mail.gmail.com>
In-Reply-To: <CAHC9VhThN4R7jsukKrmjVG=6Rm07jWwjcNQ5CS4v6JzMh+NQbg@mail.gmail.com>
From: Natan Yellin <aantny@gmail.com>
Date: Thu, 8 Oct 2020 10:59:51 +0300
Message-ID: <CAPErmPfEQZj22G5rrGykSxp7Tawzmd_Y=yJzexRBkN55LrpE_A@mail.gmail.com>
Subject: Re: Identifying thread/process termination
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3640261549561252788=="

--===============3640261549561252788==
Content-Type: multipart/alternative; boundary="00000000000030ddae05b12438dc"

--00000000000030ddae05b12438dc
Content-Type: text/plain; charset="UTF-8"

What would be so messy about adding the extra field?

I'm happy to put together a patch myself which adds it to all syscalls and
to process lifecycle events. My goal isn't to identify the exact thread
that performs every audit event but rather to allow tracking thread
lifecycle which isn't currently possible.

Natan

On Thu, Oct 8, 2020, 04:27 Paul Moore <paul@paul-moore.com> wrote:

> On Tue, Oct 6, 2020 at 4:20 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > On Monday, October 5, 2020 3:07:12 PM EDT Natan Yellin wrote:
> > > I've been tracking all process terminations using a rule for the exit
> and
> > > exit_group syscalls. However, by looking at the audit events for exit
> it is
> > > impossible to differentiate between the death of different threads in
> the
> > > same thread group. Is there an alternative way to track this?
> >
> > I don't think the audit system was ever designed to distinguish between
> > threads. But there is a general need to determine the exit of a process
> > rather than a thread.
> >
> > Paul, Richard, Do you have any thoughts?
>
> Almost everywhere in the kernel we record the TGID for the "pid="
> values and not the actual task/thread ID.  That decision was made
> before my heavy involvement with audit, but my guess is that most
> audit users are focused more on security relevant events at the
> process level, not the thread level.  After all, there isn't really
> much in the way of significant boundaries between threads.
>
> To get the information you are looking for, I think we would need to
> add an additional task/thread ID to the relevant records and that
> would be *very* messy.
>
> --
> paul moore
> www.paul-moore.com
>

--00000000000030ddae05b12438dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">What would be so messy about adding the extra field?<div =
dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m happy to put together a pa=
tch myself which adds it to all syscalls and to process lifecycle events. M=
y goal isn&#39;t to identify the exact thread that performs every audit eve=
nt but rather to allow tracking thread lifecycle which isn&#39;t currently =
possible.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Natan</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, Oct 8, 2020, 04:27 Paul Moore &lt;<a href=3D"mailto:paul@paul-moore.co=
m">paul@paul-moore.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On Tue, Oct 6, 2020 at 4:20 PM Steve Grubb &lt;<a href=3D"mailto:sgrubb@=
redhat.com" target=3D"_blank" rel=3D"noreferrer">sgrubb@redhat.com</a>&gt; =
wrote:<br>
&gt; On Monday, October 5, 2020 3:07:12 PM EDT Natan Yellin wrote:<br>
&gt; &gt; I&#39;ve been tracking all process terminations using a rule for =
the exit and<br>
&gt; &gt; exit_group syscalls. However, by looking at the audit events for =
exit it is<br>
&gt; &gt; impossible to differentiate between the death of different thread=
s in the<br>
&gt; &gt; same thread group. Is there an alternative way to track this?<br>
&gt;<br>
&gt; I don&#39;t think the audit system was ever designed to distinguish be=
tween<br>
&gt; threads. But there is a general need to determine the exit of a proces=
s<br>
&gt; rather than a thread.<br>
&gt;<br>
&gt; Paul, Richard, Do you have any thoughts?<br>
<br>
Almost everywhere in the kernel we record the TGID for the &quot;pid=3D&quo=
t;<br>
values and not the actual task/thread ID.=C2=A0 That decision was made<br>
before my heavy involvement with audit, but my guess is that most<br>
audit users are focused more on security relevant events at the<br>
process level, not the thread level.=C2=A0 After all, there isn&#39;t reall=
y<br>
much in the way of significant boundaries between threads.<br>
<br>
To get the information you are looking for, I think we would need to<br>
add an additional task/thread ID to the relevant records and that<br>
would be *very* messy.<br>
<br>
-- <br>
paul moore<br>
<a href=3D"http://www.paul-moore.com" rel=3D"noreferrer noreferrer" target=
=3D"_blank">www.paul-moore.com</a><br>
</blockquote></div>

--00000000000030ddae05b12438dc--

--===============3640261549561252788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3640261549561252788==--

