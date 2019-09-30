Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A93EEC2278
	for <lists+linux-audit@lfdr.de>; Mon, 30 Sep 2019 15:52:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E92678553F;
	Mon, 30 Sep 2019 13:52:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83B535C219;
	Mon, 30 Sep 2019 13:52:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD28B4EE68;
	Mon, 30 Sep 2019 13:52:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8UDoHRp013714 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 30 Sep 2019 09:50:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 46028261B0; Mon, 30 Sep 2019 13:50:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-72.phx2.redhat.com [10.3.117.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7D0E261D1;
	Mon, 30 Sep 2019 13:50:01 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: Report suspicious O_CREAT usage
Date: Mon, 30 Sep 2019 09:50:00 -0400
Message-ID: <2065829.xbNJnTdZ4q@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhRNmWw1__-haD1ZEekADTho3EJyXQMd6ETpOv4c8Qn9nw@mail.gmail.com>
References: <201909251348.A1542A52@keescook>
	<CAHC9VhRNmWw1__-haD1ZEekADTho3EJyXQMd6ETpOv4c8Qn9nw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8UDoHRp013714
X-loop: linux-audit@redhat.com
Cc: s.mesoraca16@gmail.com, kernel-hardening@lists.openwall.com,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	=?ISO-8859-1?Q?J=E9r=E9mie?= Galarneau <jeremie.galarneau@efficios.com>,
	viro@zeniv.linux.org.uk,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
	dan.carpenter@oracle.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 30 Sep 2019 13:52:44 +0000 (UTC)

On Thursday, September 26, 2019 11:31:32 AM EDT Paul Moore wrote:
> On Wed, Sep 25, 2019 at 5:02 PM Kees Cook <keescook@chromium.org> wrote:
> > This renames the very specific audit_log_link_denied() to
> > audit_log_path_denied() and adds the AUDIT_* type as an argument. This
> > allows for the creation of the new AUDIT_ANOM_CREAT that can be used to
> > report the fifo/regular file creation restrictions that were introduced
> > in commit 30aba6656f61 ("namei: allow restricted O_CREAT of FIFOs and
> > regular files"). Without this change, discovering that the restriction
> > is enabled can be very challenging:
> > https://lore.kernel.org/lkml/CA+jJMxvkqjXHy3DnV5MVhFTL2RUhg0WQ-XVFW3ngD=
QO
> > dkFq0PA@mail.gmail.com
> > =

> > Reported-by: J=E9r=E9mie Galarneau <jeremie.galarneau@efficios.com>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> > This is not a complete fix because reporting was broken in commit
> > 15564ff0a16e ("audit: make ANOM_LINK obey audit_enabled and
> > audit_dummy_context")
> > which specifically goes against the intention of these records: they
> > should _always_ be reported. If auditing isn't enabled, they should be
> > ratelimited.
> > =

> > Instead of using audit, should this just go back to using
> > pr_ratelimited()?
> =

> I'm going to ignore the rename and other aspects of this patch for the
> moment so we can focus on the topic of if/when/how these records
> should be emitted by the kernel.
> =

> Unfortunately, people tend to get very upset if audit emits *any*
> records when they haven't explicitly enabled audit, the significance
> of the record doesn't seem to matter, which is why you see patches
> like 15564ff0a16e ("audit: make ANOM_LINK obey audit_enabled and
> audit_dummy_context").  We could consider converting some records to
> printk()s, rate-limited or not, but we need to balance this with the
> various security certifications which audit was created to satisfy.
> In some cases a printk() isn't sufficient.
> =

> Steve is probably the only one who really keeps track of the various
> auditing requirements of the different security certifications; what
> say you Steve on this issue with ANOM_CREAT records?

Common Criteria and other security standards I track do not call out for =

anomoly detection. So, there are no requirements on this. That said, we do =

have other anomaly detections because they give early warning that somethin=
g =

strange is happening. I think adding this event is a nice improvement as lo=
ng =

as it obeys audit_enabled before emitting an event - for example, look at t=
he =

AUDIT_ANOM_ABEND event.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
