Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3499610F35C
	for <lists+linux-audit@lfdr.de>; Tue,  3 Dec 2019 00:25:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575329103;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QfdnnSZwgglFuDQqVM+uqnqpf8g3kxsi7DGrRpv+cdI=;
	b=VvTSNeC6nClL5za2BGeGligifuIhB4EJ61hNmB4q8DzUmtKRxdGh4XVDOl2X6fwdq2XSNT
	3Kgq0PJ/D5O0Q21MvqYRizmNzFpN7UbAPBflgwNuU9P9PI3P3CCV5QBtJ3Pz1D8iPFSgBp
	0Wvs6zw63FfyzWLNn8s9jVjtuTGuimM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-j9v5zSBtPNW-nAVTl0dMAg-1; Mon, 02 Dec 2019 18:25:01 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CABE71005502;
	Mon,  2 Dec 2019 23:24:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98E1F1081314;
	Mon,  2 Dec 2019 23:24:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1836C4EA71;
	Mon,  2 Dec 2019 23:24:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB2NOkiL024830 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Dec 2019 18:24:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 00E12ED164; Mon,  2 Dec 2019 23:24:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0F41ED162
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 23:24:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99F63905998
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 23:24:43 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-414-QBHJv_yROEuDQ6sLIuhfkQ-1; Mon, 02 Dec 2019 18:24:41 -0500
Received: by mail-lj1-f194.google.com with SMTP id h23so1481917ljc.8
	for <linux-audit@redhat.com>; Mon, 02 Dec 2019 15:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AzQ+1A7+ETKD73tFjtgF7MkvN8fC39GSMBwN2Sm2LGs=;
	b=CAIANoFY4SsiOLFZojzVjWWf2ee9UO10hNBwR83kbMMG0SUW7EioI8jANSQtUWUUsv
	lAi5lFSY8v9SGn4q1a3yWpen3taSp199tZj9y50fiy9XXeUk72rtMT9eRn8XRVxTA3Ro
	2+uUT0lyKSVHdJ+MzPKWfKHs8FaZPtV1++LNyoSVeNf9elrGCS7BuFJTZykt3LKrBvY4
	+0KNg3G4VcogdPWzeknmMLLvuX39IUucYPYiR3aQPkGKf4NEUn+Fz5Dj9rOKZqgWCm3t
	ezQCE7S3Aw6oac3cIzxujJr78v3rcmQfWBCDv42oFicsvpjtt0vxLi1zQrnpzMhAllXn
	wMDg==
X-Gm-Message-State: APjAAAWZUidkDUTc/LEw1P5u0uzu6F5hanGd4aDit6In17qYsLnwU8WJ
	e9cX7++deg0xT0rkHg84YGQq2hXJ6uCo9re3V99f
X-Google-Smtp-Source: APXvYqykUQo2KP90VW0MNxkrGcDGJ4i6AJcEymHsB4IKVcZLiqRu7unrYT+Jeupmhlc8Z/8+gCMxFOuX8RJXtya79Bc=
X-Received: by 2002:a2e:970e:: with SMTP id r14mr712772lji.57.1575329080094;
	Mon, 02 Dec 2019 15:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20191201183347.18122-1-frextrite@gmail.com>
	<20191202211915.GF17234@google.com>
In-Reply-To: <20191202211915.GF17234@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 2 Dec 2019 18:24:29 -0500
Message-ID: <CAHC9VhTTS43aKQojtoBRRipP7TwhaVnK7DAqpFN0J0_FNLY+sw@mail.gmail.com>
Subject: Re: [PATCH v3] kernel: audit.c: Add __rcu annotation to RCU pointer
To: Joel Fernandes <joel@joelfernandes.org>
X-MC-Unique: QBHJv_yROEuDQ6sLIuhfkQ-1
X-MC-Unique: j9v5zSBtPNW-nAVTl0dMAg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB2NOkiL024830
X-loop: linux-audit@redhat.com
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

On Mon, Dec 2, 2019 at 4:19 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> Good idea to CC the following on RCU patches:
> Paul McKenney
> Steven Rostedt
> (Any others on the RCU maintainers list).
> And, the list: rcu@vger.kernel.org
>
> Could anyone Ack the patch? Looks safe and straight forward.

FWIW, this looks reasonable to me, but I don't see this as a critical
fix that needs to go in during the merge window.  Unless I see any
objections, I'll plan on merging this into audit/next once the merge
window closes.

> On Mon, Dec 02, 2019 at 12:03:48AM +0530, Amol Grover wrote:
> > Add __rcu annotation to RCU-protected global pointer auditd_conn.
> >
> > auditd_conn is an RCU-protected global pointer,i.e., accessed
> > via RCU methods rcu_dereference() and rcu_assign_pointer(),
> > hence it must be annotated with __rcu for sparse to report
> > warnings/errors correctly.
> >
> > Fix multiple instances of the sparse error:
> > error: incompatible types in comparison expression
> > (different address spaces)
> >
> > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > ---
> > v3:
> > - update changelog to be more descriptive
> >
> > v2:
> > - fix erroneous RCU pointer initialization
> >
> >  kernel/audit.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index da8dc0db5bd3..ff7cfc61f53d 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -102,12 +102,13 @@ struct audit_net {
> >   * This struct is RCU protected; you must either hold the RCU lock for reading
> >   * or the associated spinlock for writing.
> >   */
> > -static struct auditd_connection {
> > +struct auditd_connection {
> >       struct pid *pid;
> >       u32 portid;
> >       struct net *net;
> >       struct rcu_head rcu;
> > -} *auditd_conn = NULL;
> > +};
> > +static struct auditd_connection __rcu *auditd_conn;
> >  static DEFINE_SPINLOCK(auditd_conn_lock);
> >
> >  /* If audit_rate_limit is non-zero, limit the rate of sending audit records
> > --
> > 2.24.0
> >



--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

