Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CBBC25FA
	for <lists+linux-audit@lfdr.de>; Mon, 30 Sep 2019 20:29:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48FB51056FAD;
	Mon, 30 Sep 2019 18:29:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D54F5D6D0;
	Mon, 30 Sep 2019 18:29:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 119751803517;
	Mon, 30 Sep 2019 18:29:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8UIT9X3032686 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 30 Sep 2019 14:29:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A510019D70; Mon, 30 Sep 2019 18:29:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F22619C58
	for <linux-audit@redhat.com>; Mon, 30 Sep 2019 18:29:05 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4C7D5945B
	for <linux-audit@redhat.com>; Mon, 30 Sep 2019 18:29:03 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v4so6071001pff.6
	for <linux-audit@redhat.com>; Mon, 30 Sep 2019 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to;
	bh=GGW5YTXB7k7QAffkQ+fScbfTHXGGFiBFSDibbhauwME=;
	b=ddO9ZvygJD5jwLI0fO07174NlB0/rckqIoShTN/ebn3GwVz316fFEx2WakWKR5sYT1
	n1wUwL4TWIuKSmPK7EzKxoWzexpzPb8fvtxG0OWlv1rxrYwzi8mbbujhCqPMVfVfpAGB
	EiFhgPPdEASb6t7MJLkcrmY9zuDq/76TDIaqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=GGW5YTXB7k7QAffkQ+fScbfTHXGGFiBFSDibbhauwME=;
	b=Z7jD0lOXYqt0viJKIlvOreM5GN7zK8zaOelun8OajinK0KrZKJ3IhEpBF8ytTw1n+K
	Hh9iB0N9lLNGj/gE0Puqrf097zGf/RyGsYQ7ChmjVCdmoyb+LZwdqkSUhANwHZT+l7Of
	jYg48CDidD6GaUzkbFnOsQ6EsbKxJEBc1qcuYijBQ/hnmmudrnrpHkkI9z3c01HuXNxS
	SoxikWHAABqzhcCMoHNoaOVOePKiY+ytIiPRLY3u7v8J4cm+Goz5kolzlOgOEP8gXSAb
	bDxHvNYtKwTqdJdbkBpoeGt6+njF/XxU5gQCqMTfMJ4GBGGjPXfLDqEymC5uDkP1mRIe
	E0lQ==
X-Gm-Message-State: APjAAAUvc2TcqtZhiroMs1fs4FvNXC9JqKZ6awnWG2SQDlRDpBEGUpsn
	vs3ZX0cTshI+lBSs/F5TiIlP7UJvXMc=
X-Google-Smtp-Source: APXvYqzVvSQuFKi3OxDeHFdYnh9nwIIGKErryn+jU3ze4WyjYrcAVGpbNuJovH6XmCbtnOJ72fI7Mg==
X-Received: by 2002:a17:90a:ab85:: with SMTP id
	n5mr629907pjq.117.1569868143340; 
	Mon, 30 Sep 2019 11:29:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	u18sm14868888pge.69.2019.09.30.11.29.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Sep 2019 11:29:02 -0700 (PDT)
Date: Mon, 30 Sep 2019 11:29:01 -0700
From: Kees Cook <keescook@chromium.org>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH] audit: Report suspicious O_CREAT usage
Message-ID: <201909301128.5951C390@keescook>
References: <201909251348.A1542A52@keescook>
	<CAHC9VhRNmWw1__-haD1ZEekADTho3EJyXQMd6ETpOv4c8Qn9nw@mail.gmail.com>
	<2065829.xbNJnTdZ4q@x2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2065829.xbNJnTdZ4q@x2>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 30 Sep 2019 18:29:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 30 Sep 2019 18:29:03 +0000 (UTC) for IP:'209.85.210.195'
	DOMAIN:'mail-pf1-f195.google.com'
	HELO:'mail-pf1-f195.google.com' FROM:'keescook@chromium.org'
	RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.210.195 mail-pf1-f195.google.com 209.85.210.195
	mail-pf1-f195.google.com <keescook@chromium.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: s.mesoraca16@gmail.com, kernel-hardening@lists.openwall.com,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	=?iso-8859-1?Q?J=E9r=E9mie?= Galarneau <jeremie.galarneau@efficios.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Mon, 30 Sep 2019 18:29:32 +0000 (UTC)

On Mon, Sep 30, 2019 at 09:50:00AM -0400, Steve Grubb wrote:
> On Thursday, September 26, 2019 11:31:32 AM EDT Paul Moore wrote:
> > On Wed, Sep 25, 2019 at 5:02 PM Kees Cook <keescook@chromium.org> wrote:
> > > This renames the very specific audit_log_link_denied() to
> > > audit_log_path_denied() and adds the AUDIT_* type as an argument. This
> > > allows for the creation of the new AUDIT_ANOM_CREAT that can be used =
to
> > > report the fifo/regular file creation restrictions that were introduc=
ed
> > > in commit 30aba6656f61 ("namei: allow restricted O_CREAT of FIFOs and
> > > regular files"). Without this change, discovering that the restriction
> > > is enabled can be very challenging:
> > > https://lore.kernel.org/lkml/CA+jJMxvkqjXHy3DnV5MVhFTL2RUhg0WQ-XVFW3n=
gDQO
> > > dkFq0PA@mail.gmail.com
> > > =

> > > Reported-by: J=E9r=E9mie Galarneau <jeremie.galarneau@efficios.com>
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > ---
> > > This is not a complete fix because reporting was broken in commit
> > > 15564ff0a16e ("audit: make ANOM_LINK obey audit_enabled and
> > > audit_dummy_context")
> > > which specifically goes against the intention of these records: they
> > > should _always_ be reported. If auditing isn't enabled, they should be
> > > ratelimited.
> > > =

> > > Instead of using audit, should this just go back to using
> > > pr_ratelimited()?
> > =

> > I'm going to ignore the rename and other aspects of this patch for the
> > moment so we can focus on the topic of if/when/how these records
> > should be emitted by the kernel.
> > =

> > Unfortunately, people tend to get very upset if audit emits *any*
> > records when they haven't explicitly enabled audit, the significance
> > of the record doesn't seem to matter, which is why you see patches
> > like 15564ff0a16e ("audit: make ANOM_LINK obey audit_enabled and
> > audit_dummy_context").  We could consider converting some records to
> > printk()s, rate-limited or not, but we need to balance this with the
> > various security certifications which audit was created to satisfy.
> > In some cases a printk() isn't sufficient.
> > =

> > Steve is probably the only one who really keeps track of the various
> > auditing requirements of the different security certifications; what
> > say you Steve on this issue with ANOM_CREAT records?
> =

> Common Criteria and other security standards I track do not call out for =

> anomoly detection. So, there are no requirements on this. That said, we d=
o =

> have other anomaly detections because they give early warning that someth=
ing =

> strange is happening. I think adding this event is a nice improvement as =
long =

> as it obeys audit_enabled before emitting an event - for example, look at=
 the =

> AUDIT_ANOM_ABEND event.

Okay, so the patch is good as-is? (The "report things always" issue I
will deal with separately. For now I'd just like to gain this anomaly
detection corner case...)

Paul, what do you see as next steps here?

-- =

Kees Cook

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
