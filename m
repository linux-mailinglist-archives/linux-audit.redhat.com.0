Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8522B688E4
	for <lists+linux-audit@lfdr.de>; Mon, 15 Jul 2019 14:30:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB071356E4;
	Mon, 15 Jul 2019 12:29:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44D57578B;
	Mon, 15 Jul 2019 12:29:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 126BC18355D9;
	Mon, 15 Jul 2019 12:29:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6FCTgap018631 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Jul 2019 08:29:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21CA31001B19; Mon, 15 Jul 2019 12:29:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C03E1001B37;
	Mon, 15 Jul 2019 12:29:39 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
	[209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5B9F30C5858;
	Mon, 15 Jul 2019 12:29:37 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id l15so16724932otn.9;
	Mon, 15 Jul 2019 05:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3pH2wxipPBURKZ6H3HTUGoRrEbRKDJZmi0iXvJAPiEc=;
	b=hFNxFp+bgFUp5XwQ6di5EQ4ZONP4n0gQGUU09gTrHjl+/1tO3pNwi4DiPDuXkY6BM/
	9DhvETGusL6zvr8R1ceGB3W3myHxXDxpo8jlhK1+mjgCZgdlmCIV2l51SfOJfEjorlMA
	BAf00GBGCeOHSEuzWkn8dq88/X2XDfgQKbO90bu8ulqY51CRqlqvc1mOf+8Y6LMZsVC3
	oS7/w3rIULRaMuZEFk9KmMXQpJ0ZqW2Cn2zHRcBxnnEA9YYwJQfjUKCvvtyrmadqXOtQ
	xEpd7BCOyf90JuHZYx89BsKI+Vzxuhbl4E5A0Nr5cIVe127clQSMIIPQyjTlHwQ03usU
	T17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3pH2wxipPBURKZ6H3HTUGoRrEbRKDJZmi0iXvJAPiEc=;
	b=Pq/r89JfBxsbG8w2qUTRxngsZ656vT0Rk+43AVk7KBw0KvqB1qDzHLw19eRSY6xZma
	WGdAeAc8wBLhh0jA5vVD3L+Ej3uGrbrKcwWzsrQVHRgGDU/VJG5pFPS2bB8HCO3tp1XB
	7hLTbcq3FFm91JFSjrwNvpUhraxjdzkVnafOPS7VvaxzUYZOKoMoH8nC6Ki5ZNDcZG4M
	2eUEOgesYjoG3FvKASpdyx9/m7YjtO5TTxofy6zWrULfRP8+wcdnL4BYHe5RLAVwJkjk
	3YyVOd0iEsYQNiZi6PFR3TbiUtw5XFTZFegDOaCmWI+vHNj0rOnfRvre5tYu75TRGS85
	3xOA==
X-Gm-Message-State: APjAAAVluSYx3WveZvDYLQ+pSQk2/r4+VpMJnB5YlpqSJ68oNRKyKRGI
	Q3t2/pX1NDt82KjWibQo4YYgney8ayJgsTEuFNJf4A==
X-Google-Smtp-Source: APXvYqzBfGg5FEd8aoxG8/T3FM1mSahRFcDjjP6VJW9mBUQIqaldDAziW9yPuen0rWeTdhK5ddKEsx5ued5wOzfMW8I=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr19588177otb.98.1563193777079; 
	Mon, 15 Jul 2019 05:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_5FA425C1329B32126C1D89F1@qq.com> <9307307.NKOEW2x8Z6@x2>
	<tencent_426F741872D994171406DF95@qq.com>
In-Reply-To: <tencent_426F741872D994171406DF95@qq.com>
From: F Rafi <farhanible@gmail.com>
Date: Mon, 15 Jul 2019 08:29:25 -0400
Message-ID: <CABXp1csZ-Luk2CqyhyDgGwvTgHyWAYoF87ncTOWf92nayMkMOQ@mail.gmail.com>
Subject: Re: overhead of auditd
To: =?UTF-8?B?5p2o5rW3?= <hai.yang@magic-shield.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 15 Jul 2019 12:29:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Mon, 15 Jul 2019 12:29:37 +0000 (UTC) for IP:'209.85.210.47'
	DOMAIN:'mail-ot1-f47.google.com' HELO:'mail-ot1-f47.google.com'
	FROM:'farhanible@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.118  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.47 mail-ot1-f47.google.com 209.85.210.47
	mail-ot1-f47.google.com <farhanible@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: linux-audit <linux-audit@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============8294727525357783478=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 15 Jul 2019 12:29:59 +0000 (UTC)

--===============8294727525357783478==
Content-Type: multipart/alternative; boundary="000000000000cc554a058db769c9"

--000000000000cc554a058db769c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You can enable the syscalls that you think will be helpful from an IDS
perspective.

There are also other downstream tools like goaudit and OSS kernel modules
like sysdig falco (not related to auditd) which may be able to simplify
things for you.

Farhan

On Mon, Jul 15, 2019 at 6:25 AM =E6=9D=A8=E6=B5=B7 <hai.yang@magic-shield.c=
om> wrote:

> Hi Steve,
>
> I ever read the document you wrote about laying IDS on top of auditd. And
> I suppose inotify could be lightweight for IDS. Any comment?
>
> Best regards
> Hai
>
>
> ------------------ Original ------------------
> *From: * "Steve Grubb"<sgrubb@redhat.com>;
> *Date: * Fri, Jul 12, 2019 08:14 PM
> *To: * "linux-audit"<linux-audit@redhat.com>;
> *Cc: * "=E6=9D=A8=E6=B5=B7"<hai.yang@magic-shield.com>;
> *Subject: * Re: overhead of auditd
>
> Hello,
>
> On Thursday, July 11, 2019 11:23:45 PM EDT =E6=9D=A8=E6=B5=B7 wrote:
> > Turning on all system calls in audit.rules, and transferring a tar file
> to
> > the target system (CentOS 7, 4 cores), I found "auditd" consumes high C=
PU
> > usage. Is it expected?
>
> It would not be surprising. Some system calls have more overhead than
> others.
> So, depending on everything that is running, you can kill your system.
>
> > BTW, after turning write-logs off, and add dispatcher, both "audispd" a=
nd
> > "auditd" are consuming high CPU.
>
> They have a lot of events to handle.
>
> -Steve
>
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

--000000000000cc554a058db769c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">You can enable the syscalls that you think will be h=
elpful from an IDS perspective.=C2=A0</div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">There are also other downstream tools like goaudit and =
OSS kernel modules like sysdig falco (not related to auditd) which may be a=
ble to simplify things for you.=C2=A0</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Farhan</div><div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Jul 15, 2019 at 6:25 AM =E6=9D=A8=E6=B5=B7=
 &lt;<a href=3D"mailto:hai.yang@magic-shield.com">hai.yang@magic-shield.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Hi Steve,</div=
><div><br></div><div>I ever read the document you wrote about laying IDS on=
 top of auditd. And I suppose inotify could be lightweight for IDS. Any com=
ment?</div><div><u></u><br><u></u></div><div><u></u>Best regards<u></u></di=
v><div><u></u>Hai<u></u><u></u><br><u></u></div><div><u></u><div style=3D"f=
ont-size:14px;font-family:Verdana;color:#000"><div style=3D"overflow:hidden=
"><table class=3D"m_7564073740601526183preview_table"><tbody><tr><td valign=
=3D"middle"><br></td><td valign=3D"middle" style=3D"color:#a0a0a0;font-size=
:12px"></td></tr></tbody></table></div></div><u></u></div><div><u></u><div>=
</div><div>=C2=A0</div><div style=3D"font:Verdana normal 14px;color:#000"><=
div style=3D"FONT-SIZE:12px;FONT-FAMILY:Arial Narrow;padding:2px 0 2px 0">-=
-----------------=C2=A0Original=C2=A0------------------</div><div style=3D"=
FONT-SIZE:12px;background:#efefef;padding:8px"><div id=3D"m_756407374060152=
6183menu_sender"><b>From: </b>=C2=A0&quot;Steve Grubb&quot;&lt;<a href=3D"m=
ailto:sgrubb@redhat.com" target=3D"_blank">sgrubb@redhat.com</a>&gt;;</div>=
<div><b>Date: </b>=C2=A0Fri, Jul 12, 2019 08:14 PM</div><div><b>To: </b>=C2=
=A0&quot;linux-audit&quot;&lt;<a href=3D"mailto:linux-audit@redhat.com" tar=
get=3D"_blank">linux-audit@redhat.com</a>&gt;; </div><div><b>Cc: </b>=C2=A0=
&quot;=E6=9D=A8=E6=B5=B7&quot;&lt;<a href=3D"mailto:hai.yang@magic-shield.c=
om" target=3D"_blank">hai.yang@magic-shield.com</a>&gt;; </div><div><b>Subj=
ect: </b>=C2=A0Re: overhead of auditd</div></div></div></div><div><div styl=
e=3D"font:Verdana normal 14px;color:#000"><div>=C2=A0</div><div><div id=3D"=
m_7564073740601526183tmpcontent_res"></div>Hello,<br><br>On Thursday, July =
11, 2019 11:23:45 PM EDT =E6=9D=A8=E6=B5=B7 wrote:<br>&gt; Turning on all s=
ystem calls in audit.rules, and transferring a tar file to<br>&gt; the targ=
et system (CentOS 7, 4 cores), I found &quot;auditd&quot; consumes high CPU=
<br>&gt; usage. Is it expected?<br><br>It would not be surprising. Some sys=
tem calls have more overhead than others. <br>So, depending on everything t=
hat is running, you can kill your system.<br><br>&gt; BTW, after turning wr=
ite-logs off, and add dispatcher, both &quot;audispd&quot; and<br>&gt; &quo=
t;auditd&quot; are consuming high CPU.<br><br>They have a lot of events to =
handle.<br><br>-Steve<br><br></div></div><u></u></div>--<br>
Linux-audit mailing list<br>
<a href=3D"mailto:Linux-audit@redhat.com" target=3D"_blank">Linux-audit@red=
hat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-audit" rel=3D"nore=
ferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-aud=
it</a></blockquote></div></div>

--000000000000cc554a058db769c9--


--===============8294727525357783478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============8294727525357783478==--

