Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5E96F19DEB8
	for <lists+linux-audit@lfdr.de>; Fri,  3 Apr 2020 21:45:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585943104;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JCxjuQ1xVGpFG5jKlXDM8xB/tH0Fp42f/GSJAMvhcxc=;
	b=LfaCzwLeuCNklLh7J4SpC6PafutonsDu7BS7K7goFnH9FOCTylhKHU/dx4w81W3nW/CEMI
	mh74Lj8dGiy7UnbmdF4mvNw7MxfQZPeBCTKw/nwR/z+eWDvHn0VEBE4f0BdDBC1Kh7ULAN
	v2hkYTw1qogpNxHPPKN0RB0gOh/7+ms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-Lh-6XwmcNhCK5UMWfD0SwQ-1; Fri, 03 Apr 2020 15:45:00 -0400
X-MC-Unique: Lh-6XwmcNhCK5UMWfD0SwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62697149C0;
	Fri,  3 Apr 2020 19:44:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76BA796B9B;
	Fri,  3 Apr 2020 19:44:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 773BD4E44F;
	Fri,  3 Apr 2020 19:44:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 033JPxnS009078 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 15:25:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 800B31050186; Fri,  3 Apr 2020 19:25:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C5C81050182
	for <linux-audit@redhat.com>; Fri,  3 Apr 2020 19:25:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 342FB8EC760
	for <linux-audit@redhat.com>; Fri,  3 Apr 2020 19:25:57 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-415-N0Xy9vmKOVOmSVLlHe7v1Q-1; Fri, 03 Apr 2020 15:25:54 -0400
X-MC-Unique: N0Xy9vmKOVOmSVLlHe7v1Q-1
Received: by mail-ed1-f68.google.com with SMTP id a43so10636780edf.6
	for <linux-audit@redhat.com>; Fri, 03 Apr 2020 12:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=65rVr9Q9wr51d57tXR6aU7HcBrvBAcXIjk9gkyTDJto=;
	b=G8CuyrtpKwwtQxTlsXXyhPxOFJWbiVm5Gg7YgP+dXH9ufqovKzitxcDdAr57K1C7fm
	ibui5oGjr2EGsafefYq7UZXRr7DekEi32FVSIQpfBzD9VHgZ1D8W+pR4Xzjg1pbZ9AxD
	LoXRFBcHGg/y0DGoR0nweTftNb8vS0q1K498bYqUoo6T5vXcxVlrYtljWcXZaDCAJgvc
	BqJZZHuvRE8+GUxag4m9HAhZyuQH1lONrEXwEkapLkE2e2i6RYw5SV3BOihbH7Kkc6Ut
	ZqHUaTzUojyGr9LM9WiDTCuiDM74A1WRe6inB98H9jRZZTkaNWrWR2XbYtA6lXYhnQhE
	BF0A==
X-Gm-Message-State: AGi0PubJiSScteiQc2icPf9JYIOeUQkFBO9M9zzlfTePRyQvNF6caoBg
	tpoUlGGacJ9poevzu6ntOG0r/v60Sqgnl9rU7FyR
X-Google-Smtp-Source: APiQypIZXiwhRJiYQ//8F1YOVZN8BCmsRLIweQL3yqTmNbA6vuDSg3BLgdnvN3ElHRl4kaEFeY8Y9PTi9EbazfoxGjw=
X-Received: by 2002:a17:906:583:: with SMTP id 3mr9741790ejn.308.1585941953025;
	Fri, 03 Apr 2020 12:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200402055640.6677-1-frextrite@gmail.com>
	<20200402055640.6677-3-frextrite@gmail.com>
	<CAHC9VhTUKepKiGZgAaWDADyTPnnM5unbM65T7jXZ3p8MFTNUuQ@mail.gmail.com>
	<20200403075613.GA2788@workstation-portable>
In-Reply-To: <20200403075613.GA2788@workstation-portable>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 3 Apr 2020 15:25:42 -0400
Message-ID: <CAHC9VhRFFoRQfOa=UkO2fNP-KNANrrKPnr0j+gNr7gtJp94W4A@mail.gmail.com>
Subject: Re: [PATCH 3/3 RESEND] auditsc: Do not use RCU primitive to read from
	cred pointer
To: Amol Grover <frextrite@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 033JPxnS009078
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 03 Apr 2020 15:44:31 -0400
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	David Howells <dhowells@redhat.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	James Morris <jamorris@linux.microsoft.com>,
	Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
	Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Paul E . McKenney" <paulmck@kernel.org>, Jann Horn <jannh@google.com>,
	Steven Rostedt <rostedt@goodmis.org>, Shakeel Butt <shakeelb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, "Eric W . Biederman" <ebiederm@xmission.com>,
	Andrew Morton <akpm@linux-foundation.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 3, 2020 at 3:56 AM Amol Grover <frextrite@gmail.com> wrote:
> On Thu, Apr 02, 2020 at 08:56:36AM -0400, Paul Moore wrote:
> > On Thu, Apr 2, 2020 at 1:57 AM Amol Grover <frextrite@gmail.com> wrote:
> > > task_struct::cred is only used task-synchronously and does
> > > not require any RCU locks, hence, rcu_dereference_check is
> > > not required to read from it.
> > >
> > > Suggested-by: Jann Horn <jannh@google.com>
> > > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > ---
> > >  kernel/auditsc.c | 15 +++++----------
> > >  1 file changed, 5 insertions(+), 10 deletions(-)
> >
> > This is the exact same patch I ACK'd back in February, yes?
> >
> > https://lore.kernel.org/linux-audit/CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com
> >
>
> Hi Paul,
>
> That's correct. I've resend the series out of the fear that the first 2
> patches might've gotten lost as it's been almost a month since I last
> sent them. Could you please ack this again, and if you don't mind could
> you please go through the other 2 patches and ack them aswell?

If you hadn't changed the patch at all, and it doesn't look like you
did, you could have (and likely should have) just carried over my ACK.
Regardless, I'll re-ACK it now (below).  As far as the other two
patches are concerned, they look okay to me but I would defer my ACK
to maintainer of that code.

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

