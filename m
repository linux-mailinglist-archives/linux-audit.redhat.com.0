Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 70FD7EC481
	for <lists+linux-audit@lfdr.de>; Fri,  1 Nov 2019 15:17:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572617847;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A/cFvcJg+rPh4Udwt0rzvHxh4isKGKlsozhHCfiyrk4=;
	b=XywiIFmY9w6nct6g+e5PoJ9YaK6Cjc53tiSjEAzxNoaUNqDDhsOEXnZCsPTosz81VWyYKh
	PmTTigrg446S1OoGqpjqW9ZQoIGFoel9jIDMaN8n5jM66CD63cFfz2AmgU6YFdCgatTmlw
	D2GoVJd14s7uXsANinPz0ZiN2PENW/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-oWXfMkDQPDmRNMXY31J9NA-1; Fri, 01 Nov 2019 10:17:21 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BEFC81A334;
	Fri,  1 Nov 2019 14:17:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C00D63148;
	Fri,  1 Nov 2019 14:17:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FBEB4BB65;
	Fri,  1 Nov 2019 14:17:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA1EH4pp011340 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 1 Nov 2019 10:17:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E987608B8; Fri,  1 Nov 2019 14:17:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-239.phx2.redhat.com [10.3.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2302608D0;
	Fri,  1 Nov 2019 14:16:58 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: [PATCH] audit: set context->dummy even when audit is off
Date: Fri, 01 Nov 2019 10:16:56 -0400
Message-ID: <3063279.ZKBa9cPvsK@x2>
Organization: Red Hat
In-Reply-To: <B63048C4-3158-453B-859A-C5574AACDC36@fb.com>
References: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<CAHC9VhRwRSGa5JSL0=cXxG-oOg9jUve9OEYyTCqTxzr=aMdGxg@mail.gmail.com>
	<B63048C4-3158-453B-859A-C5574AACDC36@fb.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Kyle McMartin <jkkm@fb.com>, Chris Mason <clm@fb.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Dave Jones <davej@codemonkey.org.uk>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: oWXfMkDQPDmRNMXY31J9NA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Friday, November 1, 2019 9:24:17 AM EDT Chris Mason wrote:
> On 31 Oct 2019, at 19:27, Paul Moore wrote:
> > On Thu, Oct 31, 2019 at 12:40 PM Chris Mason <clm@fb.com> wrote:
> > [ ... ]
> > Hi Chris,
> >=20
> > This is a rather hasty email as I'm at a conference right now, but I
> > wanted to convey that I'm not opposed to making sure that the NTP
> > records obey the audit configuration (that was the original intent
> > after all), I think it is just that we are all a little confused as to
> > why you are seeing the NTP records *and*only* the NTP records.
>=20
> This part is harder to nail down because there's a window during boot
> where journald has enabled audit but chef hasn't yet run in and turned
> it off, so we get a lot of logs early and then mostly ntp after that.

This is the root of the problem. Journald should never turn on audit since =
it=20
has no idea if auditd even has rules to load. What if the end user does not=
=20
want auditing? By blindly enabling audit without knowing if its wanted, it=
=20
causes a system performance hit even with no rules loaded. It would be best=
=20
if journald leaves audit alone. If it wants to listen on the multicast=20
socket, so be it. It should just listen and not try to alter the system.

Back to ntp, it sounds like the ntp record needs to check for audit_enabled=
=20
rather than the dummy context.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

