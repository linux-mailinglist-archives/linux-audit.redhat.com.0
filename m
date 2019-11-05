Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 69D02EF1C2
	for <lists+linux-audit@lfdr.de>; Tue,  5 Nov 2019 01:16:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572912975;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NUyoWL2B4y8n039U8w54HlKpLAyz+lkyvCo4Ma/Yyuc=;
	b=DlTG0SZQ6Q+q9dVOrcuFFrgIM9doeqQagZHVIDFO0lCYiavDMraA9G816yFW001hFjU901
	ygaLhjwMvxsjmc9x5lv9O9hT1dk2ofNovtBGSAVgx7JHMVt89fmWuo3t/LOUsz8jETAo7e
	g79nWcfpKKaE7CJ3gMvIUDVK+PEk5l0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-4SdXI9tUM7GPIK_ZgAkJlg-1; Mon, 04 Nov 2019 19:16:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16378107ACC2;
	Tue,  5 Nov 2019 00:16:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99389608AC;
	Tue,  5 Nov 2019 00:16:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A6C94BB65;
	Tue,  5 Nov 2019 00:15:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA50Fkj6023691 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 4 Nov 2019 19:15:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4D1A15C241; Tue,  5 Nov 2019 00:15:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 487E75C1B2
	for <linux-audit@redhat.com>; Tue,  5 Nov 2019 00:15:43 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FE159EB503
	for <linux-audit@redhat.com>; Tue,  5 Nov 2019 00:15:42 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id l20so1018439lje.4
	for <linux-audit@redhat.com>; Mon, 04 Nov 2019 16:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QMuC3tr/0UBfYG4ZEfeYIEAvWDx3av1aIgwA3EiGrEs=;
	b=N196thvieLB0szIsRvQM3dBflkUw5W0aHrUVtCdARZDPelpb7rGRMfEf8+SISIZa5B
	n6TjSLV0aKUjYxF7RwC9wLx+VCZrZ/kAX+YC5sScU5wrWZv6YoNLbxTGUmK6BOnSQk/c
	eilwzJBT+4qSMQVZrC/myHBmsMJJztDIrAZpRhIalKRfYNnGNbXu2weJnFodu3mNINXm
	LRXDCw5C/MYGZWGI+LUMJbmG2Bb5A63O9zKLWtgiFcMTpHnqw0ROYsDwV5ux+8dXFKdF
	B0MpU3+rsCFk9eOWTF+K33EMSUNxaLAIHU+zmbkh5UPV1496y/L/2cudxS4OLky0Yp1r
	H5nA==
X-Gm-Message-State: APjAAAVPO6e3m6OdCgLSdxvzW/UfpIRiMZtZtuuY5/wzRfHTyLAz19qm
	0UwA0yDU/Ktz5biCUV2sfhR1an3CrjoOjzcraeHK
X-Google-Smtp-Source: APXvYqzQ3F0w1LnoBKtNmYA7UzzirU/5+6urePX+H2cel1miQ1FMYk5R2ZZ10jmWs8tjnDlAZ1A+l79gr8sx5vOrqA0=
X-Received: by 2002:a2e:898d:: with SMTP id c13mr17354236lji.54.1572912940893; 
	Mon, 04 Nov 2019 16:15:40 -0800 (PST)
MIME-Version: 1.0
References: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<20191031163931.1102669-1-clm@fb.com>
	<CAHC9VhRwRSGa5JSL0=cXxG-oOg9jUve9OEYyTCqTxzr=aMdGxg@mail.gmail.com>
	<B63048C4-3158-453B-859A-C5574AACDC36@fb.com>
In-Reply-To: <B63048C4-3158-453B-859A-C5574AACDC36@fb.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 4 Nov 2019 19:15:29 -0500
Message-ID: <CAHC9VhR92Ade8_d1UnTy4_hJDxmwZPU31eubnrq=ejPBjkTS4w@mail.gmail.com>
Subject: Re: [PATCH] audit: set context->dummy even when audit is off
To: Chris Mason <clm@fb.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Tue, 05 Nov 2019 00:15:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Tue, 05 Nov 2019 00:15:43 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-MC-Unique: 4SdXI9tUM7GPIK_ZgAkJlg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2019 at 9:24 AM Chris Mason <clm@fb.com> wrote:
> On 31 Oct 2019, at 19:27, Paul Moore wrote:
> > It's been a while, but I thought we suggested Dave try running
> > 'auditctl -a never,task' to see if that would solve his problem and I
> > believe his answer was no, which confused me a bit as the
> > audit_filter_task() call in audit_alloc() should see that rule and
> > return a state of AUDIT_DISABLED which not only prevents audit_alloc()
> > from allocating an audit_context (and remember if the audit_context is
> > NULL then audit_dummy_context() returns true), but it also clears the
> > TIF_SYSCALL_AUDIT flag (which I'm guessing you also want).
>
> Thanks for the reminder on this part, I meant to test it.  Yes, auditctl
> -a never,task does stop the messages, even without my patch applied.

I'm glad to hear that worked, I was going to be *very* confused if you
came back and said you were still seeing NTP records.

I would suggest that regardless of what happens with audit_enabled you
likely want to keep this audit rule as part of your boot
configuration, not only does it squelch the audit records, but it
should improve performance as well (at the cost of no syscall
auditing).  A number of Linux distros have this as their default at
boot.

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

