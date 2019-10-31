Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3CCEBA5D
	for <lists+linux-audit@lfdr.de>; Fri,  1 Nov 2019 00:28:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572564502;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IVL8Uwhz1gTjYv+clVHOAABI+Xhk455Sa7fmL+c77QU=;
	b=HwRd+iw/CCpGU9Z9McU6+Z5+l0bd1ODhBfaseOphHIKk0X/zZEQqH24E3fB0bFv5iw31St
	AoZEY2byVNEQCt0MmzlAZAmoh09gkAd5l1NzDtmBc93UtZB1UjZRTvBSwGPyAOzqz5yWLn
	iq97BL1ehExier+CQKN74UhyDZw76z0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-538bXeSuNNOSzd4MM_bnyQ-1; Thu, 31 Oct 2019 19:28:19 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20ACB107ACC0;
	Thu, 31 Oct 2019 23:28:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 390F860852;
	Thu, 31 Oct 2019 23:28:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB3414BB78;
	Thu, 31 Oct 2019 23:28:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9VNRM2a018364 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 31 Oct 2019 19:27:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8886410016E8; Thu, 31 Oct 2019 23:27:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 838EF1001B23
	for <linux-audit@redhat.com>; Thu, 31 Oct 2019 23:27:19 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 815CE18C786C
	for <linux-audit@redhat.com>; Thu, 31 Oct 2019 23:27:18 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y6so5984599lfj.2
	for <linux-audit@redhat.com>; Thu, 31 Oct 2019 16:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e2ffogDpozyAqtkdcsJAMC3COCP/ysptTvprfPko7e4=;
	b=sEjhmRyyE0g6lWevWcOhw/78Kr8e1eb5YCeZz2hfV44TwDvLZqPnOibiu+GEYPNhci
	QxRHkfu061TstaJfZmU0CsUVkMX7Rh1QQiIrpk/25P1DCTnp282D6Pe/La3U37mDldsY
	fygBpj0i/C+U6Yxy2jw15gBvRdkuL29XwVkryaMfK+Wyx94gRu/ki/jqo0CtUvYvUu98
	R+Yx4AiOyxlnHPj9nUx5iy7PRigHoInfqlh1Ljb5Q9q8y1hED4gsHkQYt5926z+z48DE
	snxcF6kYIsOhGW2DIIbkJu0ZnN4j3AV2qN5B+g9AMX9RmQPrxgGH2RoFenpwHDO5Bu7T
	zFNQ==
X-Gm-Message-State: APjAAAV0XQVtrSRFn3H8QMGOUmWWyC69rfoJv3PNY1WLXBaJO7l9dYxO
	9Mygx40RDiQVJnROp2yLH9DCuwtu9xCeA75mvMFy
X-Google-Smtp-Source: APXvYqwe1J+xrVrIbls/ckNmuEOFARoFrNb3empdiGVKUDofsl/X5rtVrSeg1VsPy+Ie8l364ZaF6NL2PfaR+fnb23Y=
X-Received: by 2002:a19:8092:: with SMTP id b140mr5180757lfd.13.1572564435823; 
	Thu, 31 Oct 2019 16:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<20191031163931.1102669-1-clm@fb.com>
In-Reply-To: <20191031163931.1102669-1-clm@fb.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 31 Oct 2019 19:27:04 -0400
Message-ID: <CAHC9VhRwRSGa5JSL0=cXxG-oOg9jUve9OEYyTCqTxzr=aMdGxg@mail.gmail.com>
Subject: Re: [PATCH] audit: set context->dummy even when audit is off
To: Chris Mason <clm@fb.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.70]);
	Thu, 31 Oct 2019 23:27:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Thu, 31 Oct 2019 23:27:19 +0000 (UTC) for IP:'209.85.167.65'
	DOMAIN:'mail-lf1-f65.google.com' HELO:'mail-lf1-f65.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.65 mail-lf1-f65.google.com 209.85.167.65
	mail-lf1-f65.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.70
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Dave Jones <davej@codemonkey.org.uk>, linux-audit@redhat.com,
	Kyle McMartin <jkkm@fb.com>, linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 538bXeSuNNOSzd4MM_bnyQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2019 at 12:40 PM Chris Mason <clm@fb.com> wrote:
> Dave Jones reported that we're finding a considerable amount of dmesg
> traffic from NTP time adjustments being reported through the audit
> subsystem.  His original post is here:
>
> https://lore.kernel.org/lkml/20190923155041.GA14807@codemonkey.org.uk/
>
> The confusing part is that we're seeing this on machines that don't have
> audit on.  The NTP code uses audit_dummy_context() to decide if it
> should log things:
>
>         static inline void audit_ntp_log(const struct audit_ntp_data *ad)
>         {
>                 if (!audit_dummy_context())
>                         __audit_ntp_log(ad);
>         }
>
> I confirmed with perf probes that:
>
>         context->dummy =3D 0
>         audit_n_rules =3D 0
>         audit_enabled =3D 0
>         audit_ever_enabled =3D 1 // seems to be from journald
>
> The box boots, journald turns audit on, some time later our
> configuration management runs around and turns audit off.  This journald
> feature is discussed here: https://github.com/systemd/systemd/issues/959
>
> From what I can tell, audit_syscall_entry is responsible for setting
> context->dummy, but we never get down to the test for audit_n_rules:
>
> __audit_syscall_entry(int major, unsigned long a1, unsigned long a2,
>                            unsigned long a3, unsigned long a4)
> {
>         struct audit_context *context =3D audit_context();
>         enum audit_state     state;
>
>         if (!audit_enabled || !context)
>                 return;
>                 ^^^^^^^^^^^^^^^^^^  --- we bail here
>
>         [ ... ]
>
>         context->dummy =3D !audit_n_rules;
>
> This leaves context->dummy at 0, which appears to be the original value
> from kzalloc().
>
> If you've gotten this far, you've read everything I know about the audit
> code.  With that said, my preference is to make a single source of truth =
for
> decisions about logging.  This commit changes __audit_syscall_entry() to
> set context->dummy when audit is off.
>
> Reported-by: Dave Jones <davej@codemonkey.org.uk>
> Signed-off-by: Chris Mason <clm@fb.com>
> ---
>  kernel/auditsc.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Hi Chris,

This is a rather hasty email as I'm at a conference right now, but I
wanted to convey that I'm not opposed to making sure that the NTP
records obey the audit configuration (that was the original intent
after all), I think it is just that we are all a little confused as to
why you are seeing the NTP records *and*only* the NTP records.

It's been a while, but I thought we suggested Dave try running
'auditctl -a never,task' to see if that would solve his problem and I
believe his answer was no, which confused me a bit as the
audit_filter_task() call in audit_alloc() should see that rule and
return a state of AUDIT_DISABLED which not only prevents audit_alloc()
from allocating an audit_context (and remember if the audit_context is
NULL then audit_dummy_context() returns true), but it also clears the
TIF_SYSCALL_AUDIT flag (which I'm guessing you also want).

Can you confirm the results of 'auditctl -a never,task' on your systems?

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

