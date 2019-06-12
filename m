Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C90EC41D37
	for <lists+linux-audit@lfdr.de>; Wed, 12 Jun 2019 09:08:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38DF559469;
	Wed, 12 Jun 2019 07:07:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 238F97BE7C;
	Wed, 12 Jun 2019 07:07:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C32451806B16;
	Wed, 12 Jun 2019 07:07:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5C76Awo007886 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 12 Jun 2019 03:06:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B55CF5D9D1; Wed, 12 Jun 2019 07:06:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B055D5D9C9
	for <linux-audit@redhat.com>; Wed, 12 Jun 2019 07:06:08 +0000 (UTC)
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58CD93087930
	for <linux-audit@redhat.com>; Wed, 12 Jun 2019 07:05:52 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id l21so9122776ita.2
	for <linux-audit@redhat.com>; Wed, 12 Jun 2019 00:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=acalvio-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rqLfZeXYVsiY3QjwQcFdvDXPRJyAlQgYUSwa8z/B1Xo=;
	b=JygUSGrLOaI1VpI652E4p96gkUu8WEKesH6uFzRceSu1y7BQ4iTtVjrEX3NdeepZUx
	sTuyu7WiOOs5tYqSYQ2RoogwY4HZwKWNnn2ra73C2SYSfqFlJrz3de2tInHQtDfZz9ko
	ujqJLfk9K0qYflaURbtao8rb2STSfeGeJIsLZ7OsckGYdJmMy4r1P5hg+tHIBXxRT/Yd
	962G9JHw+9nvcZYlFADPNRT1q1LDO2Ns2280tL3IYjGhxDgwuVYb0eCIjBEecnuErT5P
	gQup32JG9ryVzGUsB14AgC50Mb7HF2ONOY1MVI+VArXSMdFdCtMMYKJv6boJpDyPaRLM
	LMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rqLfZeXYVsiY3QjwQcFdvDXPRJyAlQgYUSwa8z/B1Xo=;
	b=ixRjEdKAV10PUfX7yuuBibemd775jFBMenXBYtO6WnP/1pSr8Em1JD+OZJL+ItN85Z
	aS/OzXLr/kiaBpThSdzgARoM5rKP+e2aN2XXkn3goM6qnTWA7GcauW26ghMRfYDOvKoj
	Izlg4XxUV2Bu29QXAEweosLiOEGJxQu4y8VP8yRPSRx7D2uVN0ESzmTZ3nuuQRRaqK9D
	XbZc/jUf0iWrw/1s0TDnnaAOx9qlVJNiOX5xxh2MXvSUABNETQyat98cLL5GxUONRR2e
	FbEeuLTovEDSBzHcsHXsjcCG35Q3qm3XGMrNgyCXfT3rYtjzyatIp3POJTnD03UDbMWd
	95Qw==
X-Gm-Message-State: APjAAAVXHsrb8WAegLETEnsiM3iWiWf4WAB40EV4OYsIgCsz4DIG9Pee
	W+G7fhzANhWi/oVaTRFmZdIz/OBI6FbUyBg0XGYIsQ==
X-Google-Smtp-Source: APXvYqxNwUoyZdOPbaBBgkwBAkV1cHHf+u+xiHAxq7kTWtWICdzWc03zW/iVD0V1wXDD5mTUFKufuj94I2WCiKv/MZ8=
X-Received: by 2002:a02:862b:: with SMTP id e40mr24996029jai.7.1560323151695; 
	Wed, 12 Jun 2019 00:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAFQMB-USapCi=pV8ZNkNwTAYZ0FuVKaMKKQvK4y19RUmL90zhA@mail.gmail.com>
	<4766346.QBaMZih7XG@x2>
In-Reply-To: <4766346.QBaMZih7XG@x2>
From: Tarun Ramesh <tramesh@acalvio.com>
Date: Wed, 12 Jun 2019 12:35:40 +0530
Message-ID: <CAFQMB-UhU-4-uYVcasZn+E-GonpqqPO_7UZojSZ-7-2Eo81KZQ@mail.gmail.com>
Subject: Re: auparse_feed callback on EOE record
To: Steve Grubb <sgrubb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 12 Jun 2019 07:05:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Wed, 12 Jun 2019 07:05:52 +0000 (UTC) for IP:'209.85.166.176'
	DOMAIN:'mail-it1-f176.google.com'
	HELO:'mail-it1-f176.google.com' FROM:'tramesh@acalvio.com' RCPT:''
X-RedHat-Spam-Score: 0.191  (DKIM_INVALID, DKIM_SIGNED, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.176 mail-it1-f176.google.com 209.85.166.176
	mail-it1-f176.google.com <tramesh@acalvio.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Content-Type: multipart/mixed; boundary="===============1091569821036100862=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 12 Jun 2019 07:08:25 +0000 (UTC)

--===============1091569821036100862==
Content-Type: multipart/alternative; boundary="000000000000312bd9058b1b0ba0"

--000000000000312bd9058b1b0ba0
Content-Type: text/plain; charset="UTF-8"

Hi Steve,

Thanks for the reply. I compared the record string I was passing to
auparse_feed() against the example string in auparse/test/auparse_test.c
(in audit-userspace git repo).
Looks like I needed to prepend "msg=" before the audit message and pass the
exact length of the record string to auparse_feed().

Changing the lines in to the code to:

snprintf(record_buffer, (record_buffer_len - 1), "type=%s msg=%.*s\n",
type_name, reply.len, reply.message);
auparse_feed(au, record_buffer, strlen(record_buffer));

worked.

Also I noticed that the EOE record is treated as its own event even though
there were other records with the same audit serial number. I guess this is
expected as after EOE there will be no more records for this event and if
EOE was treated as a part of the previous event, then it will not be
possible to tell when this event is complete.

Thanks for the help,
Tarun

On Tue, Jun 11, 2019 at 9:49 PM Steve Grubb <sgrubb@redhat.com> wrote:

> On Tuesday, June 11, 2019 2:56:23 AM EDT Tarun Ramesh wrote:
> > The callback function on_audit_event() just goes through the records one
> by
> > one and prints the fields and values. I have added a rule to watch for
> > file edits in the /home folder. I see the records for file creation in
> > this folder being received, however it looks like the callback function
> is
> > not being called when an EOE record is received. Please let me know if
> I'm
> > missing something.
>
> As long as the format exactly matched how auditd creates the record,
> cursory
> glance appears ok, then the records get grouped inside auparse to form a
> complete event. When the event is determined to be complete, it is passed
> to
> the registered callback function. You need to iterate over the individual
> records to see the whole event.
>
> So, you do not get a callback on an individual record, you are called back
> on
> a complete event. The EOE record should be the last record. You can use
> auparse_next_record() to iterate across records.
>
> -Steve
>
>
>
>

--000000000000312bd9058b1b0ba0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Steve,</div><div><br></div><div>T=
hanks for the reply. I compared the record string I was passing to auparse_=
feed() against the example string in auparse/test/auparse_test.c (in audit-=
userspace git repo).</div><div>Looks like I needed to prepend &quot;msg=3D&=
quot; before the audit message and pass the exact length of the record stri=
ng to auparse_feed().</div><div><br></div><div>Changing the lines in to the=
 code to:</div><div><br></div><div>snprintf(record_buffer, (record_buffer_l=
en - 1), &quot;type=3D%s msg=3D%.*s\n&quot;, type_name, reply.len, reply.me=
ssage);</div><div>auparse_feed(au, record_buffer, strlen(record_buffer));</=
div><div><br></div><div>worked.</div><div><br></div><div>Also I noticed tha=
t the EOE record is treated as its own event even though there were other r=
ecords with the same audit serial number. I guess this is expected as after=
 EOE there will be no more records for this event and if EOE was treated as=
 a part of the previous event, then it will not be possible to tell when th=
is event is complete.</div><div><br></div><div>Thanks for the help,</div><d=
iv>Tarun<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Jun 11, 2019 at 9:49 PM Steve Grubb &lt;<a href=
=3D"mailto:sgrubb@redhat.com">sgrubb@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Tuesday, June 11, 2019 2:=
56:23 AM EDT Tarun Ramesh wrote:<br>
&gt; The callback function on_audit_event() just goes through the records o=
ne by<br>
&gt; one and prints the fields and values. I have added a rule to watch for=
<br>
&gt; file edits in the /home folder. I see the records for file creation in=
<br>
&gt; this folder being received, however it looks like the callback functio=
n is<br>
&gt; not being called when an EOE record is received. Please let me know if=
 I&#39;m<br>
&gt; missing something.<br>
<br>
As long as the format exactly matched how auditd creates the record, cursor=
y <br>
glance appears ok, then the records get grouped inside auparse to form a <b=
r>
complete event. When the event is determined to be complete, it is passed t=
o <br>
the registered callback function. You need to iterate over the individual <=
br>
records to see the whole event. <br>
<br>
So, you do not get a callback on an individual record, you are called back =
on <br>
a complete event. The EOE record should be the last record. You can use <br=
>
auparse_next_record() to iterate across records.<br>
<br>
-Steve<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000312bd9058b1b0ba0--


--===============1091569821036100862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1091569821036100862==--

