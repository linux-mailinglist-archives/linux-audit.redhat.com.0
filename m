Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9D0EF236
	for <lists+linux-audit@lfdr.de>; Tue,  5 Nov 2019 01:45:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572914747;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WJzBINk9jqvzIVUAqkTJy8xaaqettlHA2jP5pA06WvI=;
	b=NeFkmHSarZy/UmFPwbqppRNZe/h30h2tCjGydTdXhNhvDHaZ/8XFgERdCzghkTXx+4wUa+
	mv9nrOiVYYGCFpBr1fNDdhfz8nCHsyYOmfPlS9F+gfQjyFHuF0Tj4p53+zsmUgNbvolygf
	EOd3Pq2jUgxS0y4Q9NiD1GPw/scw80w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-QqY5TAAJMQSPRIxWBn6QAQ-1; Mon, 04 Nov 2019 19:45:43 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C4BE107ACC3;
	Tue,  5 Nov 2019 00:45:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9696C608A5;
	Tue,  5 Nov 2019 00:45:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E75EB4BB65;
	Tue,  5 Nov 2019 00:45:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA50jUjN025966 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 4 Nov 2019 19:45:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4272E5DA7D; Tue,  5 Nov 2019 00:45:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BBB85DA7C
	for <linux-audit@redhat.com>; Tue,  5 Nov 2019 00:45:27 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8F33308427D
	for <linux-audit@redhat.com>; Tue,  5 Nov 2019 00:45:26 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id t5so19773958ljk.0
	for <linux-audit@redhat.com>; Mon, 04 Nov 2019 16:45:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SD2CAIOJ3/A3r/7BnST1o483HsUD8a95doqEbuDoX4g=;
	b=CHWB3Ar21uPu30dVwtMBUvMdjnYW5i6MH6KGrjkhUvPjbg3fm5YXelTd6LWzv4w/RX
	o4bZUdUlPBOJat4MQmyo0hAJv82HrnmlQ2AD8SL1+iqdWb6EDkPAsRpz8AtBH4RfoQWH
	PLJ1Xrm3o8+R6dcEAgeXKdPPfE8Wl2qS4rN7+VOZO5eRk33eUqA68CzQEx5QKzN7VEq8
	stqrbickiIbR32W5qe3LwyEMMm0maUbvgg6hKVNxWnMWM7RmYdWfUany0h2iELc+/phP
	knujdfEn7AmO0DvwX8VjrbHjKG2kmAM84T1OLKbShqGt7lgl/qrPUafzb0Yo0sD3+H5G
	7rbA==
X-Gm-Message-State: APjAAAUZxd7kLwOfVbINsL1uGL7l1Ap22N5//VDdVvRNWh4h95BJi5n8
	y9w0xrfwn6/mYZCKfEtMxGybb3m8U1BAhwoVXL+i
X-Google-Smtp-Source: APXvYqxzmIO2Oxxz9N98p3P82tzxscbhGFfcMIGu27qi4oBiPuTPzzBOd0XTQXumg7HgDXG6Kuzc/ce0WaomFnFFeAk=
X-Received: by 2002:a2e:7811:: with SMTP id t17mr7122741ljc.225.1572914725114; 
	Mon, 04 Nov 2019 16:45:25 -0800 (PST)
MIME-Version: 1.0
References: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<20191031163931.1102669-1-clm@fb.com>
	<CAHC9VhRwRSGa5JSL0=cXxG-oOg9jUve9OEYyTCqTxzr=aMdGxg@mail.gmail.com>
	<B63048C4-3158-453B-859A-C5574AACDC36@fb.com>
	<CAHC9VhR92Ade8_d1UnTy4_hJDxmwZPU31eubnrq=ejPBjkTS4w@mail.gmail.com>
	<5E08422A-BFE2-4515-A804-3DB42B7D8550@fb.com>
In-Reply-To: <5E08422A-BFE2-4515-A804-3DB42B7D8550@fb.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 4 Nov 2019 19:45:13 -0500
Message-ID: <CAHC9VhSX=BN_9hNO3TO-ZBpxqphuM-xVNAQHcqVuO50Yo8C-Rg@mail.gmail.com>
Subject: Re: [PATCH] audit: set context->dummy even when audit is off
To: Chris Mason <clm@fb.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 05 Nov 2019 00:45:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 05 Nov 2019 00:45:27 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: Dave Jones <davej@codemonkey.org.uk>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	Kyle McMartin <jkkm@fb.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
X-MC-Unique: QqY5TAAJMQSPRIxWBn6QAQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2019 at 7:39 PM Chris Mason <clm@fb.com> wrote:
> On 4 Nov 2019, at 19:15, Paul Moore wrote:
>
> > On Fri, Nov 1, 2019 at 9:24 AM Chris Mason <clm@fb.com> wrote:
> >> On 31 Oct 2019, at 19:27, Paul Moore wrote:
> >>> It's been a while, but I thought we suggested Dave try running
> >>> 'auditctl -a never,task' to see if that would solve his problem and
> >>> I
> >>> believe his answer was no, which confused me a bit as the
> >>> audit_filter_task() call in audit_alloc() should see that rule and
> >>> return a state of AUDIT_DISABLED which not only prevents
> >>> audit_alloc()
> >>> from allocating an audit_context (and remember if the audit_context
> >>> is
> >>> NULL then audit_dummy_context() returns true), but it also clears
> >>> the
> >>> TIF_SYSCALL_AUDIT flag (which I'm guessing you also want).
> >>
> >> Thanks for the reminder on this part, I meant to test it.  Yes,
> >> auditctl
> >> -a never,task does stop the messages, even without my patch applied.
> >
> > I'm glad to hear that worked, I was going to be *very* confused if you
> > came back and said you were still seeing NTP records.
> >
> > I would suggest that regardless of what happens with audit_enabled you
> > likely want to keep this audit rule as part of your boot
> > configuration, not only does it squelch the audit records, but it
> > should improve performance as well (at the cost of no syscall
> > auditing).  A number of Linux distros have this as their default at
> > boot.
> >
>
> Definitely, we'll be testing auditctl -a never,task internally.  Before
> we went down that path I wanted to fully understand what was going on,
> but I think all the big questions have been answered at this point.

Yes, that is why we didn't do anything earlier with Dave's reports; we
couldn't reconcile the results with the code, and the lack of other
similar problem reports made me suspicious.  As you said, we
understand things a bit better now.

> I'm happy to try variations on my patch, but if you want to include it,
> please do remember that I've really only tested it with auditing off.

Understood.  FWIW, I'm not overly in love with the approach in the
patch you posted, but I haven't looked too seriously into alternatives
thus far.  I expect with most everyone running with the "never" audit
rule installed this solves this just fine for the time being.

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

