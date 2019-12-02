Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BE47610F5EB
	for <lists+linux-audit@lfdr.de>; Tue,  3 Dec 2019 04:50:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575345016;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N17YzmB8hOy7WpQib0wKm03eveTph0AkCGeTWowAAXk=;
	b=EMY7daNcLdMSjmffS5f5pOr6+e+aa534NUhjeXTvvrvfnpGgJF4GNzj+lKzc36t2EoNCiF
	rcnSxutryM8JIySJ8jtPr7+DzjZ0Bw6wdxWLAKgSh40m+VYLRs5EqO0fTDSrF7qfcugqYM
	Ot+yy9XFsnwweFeOAP4AKvksW5Q3s0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137--JpgVcUcMPePyLuw1EPp1g-1; Mon, 02 Dec 2019 22:50:15 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E897800D5B;
	Tue,  3 Dec 2019 03:50:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 867F91001B03;
	Tue,  3 Dec 2019 03:50:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3B6F18089CD;
	Tue,  3 Dec 2019 03:50:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB2NZ6M0025829 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Dec 2019 18:35:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2CD7C2038B96; Mon,  2 Dec 2019 23:35:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28D442038BAC
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 23:35:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4A568E315A
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 23:35:03 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-329-j6eIMbutMsKTl6R5DpnniA-1; Mon, 02 Dec 2019 18:35:01 -0500
Received: by mail-pl1-f196.google.com with SMTP id ay6so770487plb.0
	for <linux-audit@redhat.com>; Mon, 02 Dec 2019 15:35:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NqtaB9MKOQhSliHwumWMYNqfR+eF1LGGZAxjF3ljDPg=;
	b=tq+7JRTN0OTBzOYICsZ8Sydb7O+OsEMUd9saB6y5D0Op5JZRtG8Im2eOV1SCGo9zSS
	d6noePh3UJ2HC0+1Ugg5eGCiBaBBqPhfa1fUa3lYPcm7mKtKo8FwM7/JivNWoeHhAGl5
	y6Y84wZQdz2d9z42W30xV5BEhTJ9tGLJMC73K6fNTW+WgWOJmwKWrxJA0o7BvmtCPBiR
	AOTwiymyZeIv7j+wz/XE1f419oBOCU7nOA5snCQW4l2OQmNOOwByDomnK8WBX1Wh2Sx9
	mxwKWDxZB4+Qng1EEot6/PmfRpZLiB1XoWPXPt+h+1k+7tb7EwCv1IXy/pAnx5es/st4
	Jwkw==
X-Gm-Message-State: APjAAAU0x/CJ7ygF3NYrW2ZfhSMYKu+CtXAdUEt8jo7N5hlQ0dQDQoC2
	w2MixoA+C8NvwyJHw4p7muomBA==
X-Google-Smtp-Source: APXvYqwi12259yJbqYXkvJ9Obbu0PA3rzoi2KUWw1tLwRCP44TS0LXGWkJD+SD/WZ0yQglnk8HAcNA==
X-Received: by 2002:a17:902:b20c:: with SMTP id
	t12mr1790521plr.191.1575329700251; 
	Mon, 02 Dec 2019 15:35:00 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
	by smtp.gmail.com with ESMTPSA id h9sm596572pfo.139.2019.12.02.15.34.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 15:34:59 -0800 (PST)
Date: Mon, 2 Dec 2019 18:34:58 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v3] kernel: audit.c: Add __rcu annotation to RCU pointer
Message-ID: <20191202233458.GN17234@google.com>
References: <20191201183347.18122-1-frextrite@gmail.com>
	<20191202211915.GF17234@google.com>
	<CAHC9VhTTS43aKQojtoBRRipP7TwhaVnK7DAqpFN0J0_FNLY+sw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTTS43aKQojtoBRRipP7TwhaVnK7DAqpFN0J0_FNLY+sw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: j6eIMbutMsKTl6R5DpnniA-1
X-MC-Unique: -JpgVcUcMPePyLuw1EPp1g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB2NZ6M0025829
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 02 Dec 2019 22:49:48 -0500
Cc: paulmck@kernel.org, Amol Grover <frextrite@gmail.com>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	linux-audit@redhat.com, Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org, rostedt@kernel.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Dec 02, 2019 at 06:24:29PM -0500, Paul Moore wrote:
> On Mon, Dec 2, 2019 at 4:19 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> > Good idea to CC the following on RCU patches:
> > Paul McKenney
> > Steven Rostedt
> > (Any others on the RCU maintainers list).
> > And, the list: rcu@vger.kernel.org
> >
> > Could anyone Ack the patch? Looks safe and straight forward.
> 
> FWIW, this looks reasonable to me, but I don't see this as a critical
> fix that needs to go in during the merge window.  Unless I see any
> objections, I'll plan on merging this into audit/next once the merge
> window closes.

Sounds good, thanks!

 - Joel


> > On Mon, Dec 02, 2019 at 12:03:48AM +0530, Amol Grover wrote:
> > > Add __rcu annotation to RCU-protected global pointer auditd_conn.
> > >
> > > auditd_conn is an RCU-protected global pointer,i.e., accessed
> > > via RCU methods rcu_dereference() and rcu_assign_pointer(),
> > > hence it must be annotated with __rcu for sparse to report
> > > warnings/errors correctly.
> > >
> > > Fix multiple instances of the sparse error:
> > > error: incompatible types in comparison expression
> > > (different address spaces)
> > >
> > > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > ---
> > > v3:
> > > - update changelog to be more descriptive
> > >
> > > v2:
> > > - fix erroneous RCU pointer initialization
> > >
> > >  kernel/audit.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index da8dc0db5bd3..ff7cfc61f53d 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -102,12 +102,13 @@ struct audit_net {
> > >   * This struct is RCU protected; you must either hold the RCU lock for reading
> > >   * or the associated spinlock for writing.
> > >   */
> > > -static struct auditd_connection {
> > > +struct auditd_connection {
> > >       struct pid *pid;
> > >       u32 portid;
> > >       struct net *net;
> > >       struct rcu_head rcu;
> > > -} *auditd_conn = NULL;
> > > +};
> > > +static struct auditd_connection __rcu *auditd_conn;
> > >  static DEFINE_SPINLOCK(auditd_conn_lock);
> > >
> > >  /* If audit_rate_limit is non-zero, limit the rate of sending audit records
> > > --
> > > 2.24.0
> > >
> 
> 
> 
> --
> paul moore
> www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

