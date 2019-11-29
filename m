Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 520E910DE04
	for <lists+linux-audit@lfdr.de>; Sat, 30 Nov 2019 16:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575127709;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bSDeiE7s3gqEyeyrbojcJei0yBznIYfeIQxBlgJMcEE=;
	b=KQXGrXi16PoxStRkCu1y3O5ZGWSHikBLkp3iwLUyDZFevMhcqLURujcySdtQhIEdzj4zF3
	zNOPv4UQNmE5Z/u9mgB3HMITHODhfwDTPQNSMNbJ6/d3rYvsoYRaPTxAdrHyVQHEQuqpov
	Z0sKJMNnA/9xZMh13qdQuD8X4NivxdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-bZ71sr7cNNCgep8H1KJgkQ-1; Sat, 30 Nov 2019 10:28:27 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F3BE800D4E;
	Sat, 30 Nov 2019 15:28:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 760D35D9E1;
	Sat, 30 Nov 2019 15:28:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CE644BB78;
	Sat, 30 Nov 2019 15:28:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xATK8QgU004443 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 29 Nov 2019 15:08:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 41C55167EFC; Fri, 29 Nov 2019 20:08:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D53213BF5F
	for <linux-audit@redhat.com>; Fri, 29 Nov 2019 20:08:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B849803AF0
	for <linux-audit@redhat.com>; Fri, 29 Nov 2019 20:08:24 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-1-GNCReXvXPvudWQ86hbyoIQ-1; Fri, 29 Nov 2019 15:08:20 -0500
Received: by mail-pg1-f196.google.com with SMTP id 6so10340797pgk.0
	for <linux-audit@redhat.com>; Fri, 29 Nov 2019 12:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=DvDMSJKpd/DCMvLbsXJa6FXI7w1LfpYRNLVlppSW228=;
	b=d+Lf7VCiZ/0AgmB+ECbNtWCegcpBpUo+Q4CClbAYscpCt8nLpiCXtMGGImSnWmti79
	lcP9xdXo/FsNnof+Ach+uu7D8zkE0m8D0DuGtUJBb2H1YEKUS+M0eGK23XxAEVbNrJc9
	q0tGeywOSmAhSYchRk+S1f2/Z5e5ZHmBbJOTFq6hBWLXOHE1azd/ZDJZCDEVNRjpBcYK
	WLqpPaXmgYNxJCI9u3zmbUlsTGkNGo5tXz3/c9s4qDyZKmDYnoKHKI7X8ysEgM2eWnKL
	3HGrObmEzNdQmkRFe/ooth92K6v0nG86RhF9joQCKTDG057PBV60F/+Jw/6YAWR3CDAp
	gh3Q==
X-Gm-Message-State: APjAAAUWZG8ZNkGDhGx82NSIIovgtp3Wnr/1iJg+2spsdpkwFBbjfC7q
	pZmCKrS6olrBCATPSoSJoocyRQ==
X-Google-Smtp-Source: APXvYqyvHDa6weyYNMuYF7suMbcRmWdL7aPk8WE9JYrA5LAZ4jm/TAuWpWHyle/hpFduKHzrIZi9mA==
X-Received: by 2002:a63:d544:: with SMTP id v4mr18283741pgi.288.1575058098939; 
	Fri, 29 Nov 2019 12:08:18 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
	by smtp.gmail.com with ESMTPSA id
	y6sm23937455pfm.12.2019.11.29.12.08.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 Nov 2019 12:08:18 -0800 (PST)
Date: Fri, 29 Nov 2019 15:08:17 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Subject: Re: [PATCH] kernel: audit.c: Add __rcu notation to RCU pointer
Message-ID: <20191129200817.GB239292@google.com>
References: <20191126172723.GA12759@workstation-kernel-dev>
	<20191127022925.GB157739@google.com>
	<20191127052827.GA9782@workstation-portable>
	<CAEXW_YS=eDhmv+MaKLoRTCcPknscxqfHa2TyrjAEXpug1g67jw@mail.gmail.com>
	<20191128150949.GA30181@workstation-portable>
MIME-Version: 1.0
In-Reply-To: <20191128150949.GA30181@workstation-portable>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: GNCReXvXPvudWQ86hbyoIQ-1
X-MC-Unique: bZ71sr7cNNCgep8H1KJgkQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xATK8QgU004443
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sat, 30 Nov 2019 10:28:00 -0500
Cc: LKML <linux-kernel@vger.kernel.org>, linux-audit@redhat.com,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Nov 28, 2019 at 08:39:49PM +0530, Amol Grover wrote:
> On Wed, Nov 27, 2019 at 10:25:57AM -0500, Joel Fernandes wrote:
> > On Wed, Nov 27, 2019 at 12:29 AM Amol Grover <frextrite@gmail.com> wrote:
> > >
> > > On Tue, Nov 26, 2019 at 09:29:25PM -0500, Joel Fernandes wrote:
> > > > On Tue, Nov 26, 2019 at 10:57:23PM +0530, Amol Grover wrote:
> > > > > add __rcu notation to RCU protected global pointer auditd_conn
> > > > >
> > > > > Fixes multiple instances of sparse error:
> > > > > error: incompatible types in comparison expression
> > > > > (different address spaces)
> > > > >
> > > > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > > > ---
> > > > >  kernel/audit.c | 6 ++++--
> > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > > index da8dc0db5bd3..30e7fc9b8da2 100644
> > > > > --- a/kernel/audit.c
> > > > > +++ b/kernel/audit.c
> > > > > @@ -102,12 +102,14 @@ struct audit_net {
> > > > >   * This struct is RCU protected; you must either hold the RCU lock for reading
> > > > >   * or the associated spinlock for writing.
> > > > >   */
> > > > > -static struct auditd_connection {
> > > > > +struct auditd_connection {
> > > > >     struct pid *pid;
> > > > >     u32 portid;
> > > > >     struct net *net;
> > > > >     struct rcu_head rcu;
> > > > > -} *auditd_conn = NULL;
> > > > > +};
> > > > > +static struct auditd_connection __rcu *auditd_conn;
> > > > > +RCU_INIT_POINTER(auditd_conn);
> > > >
> > > > Looks like this causes a build error. Always please build test your patches
> > > > in the very least. And I also did not understand how RCU_INIT_POINTER can
> > > > even be used outside of a function. In C, executable code cannot be outside
> > > > functions.
> > > >
> > > > Is doing the following not sufficient to fix the sparse issue?
> > > >
> > > > thanks,
> > > >
> > > >  - Joel
> > > >
> > > > ---8<-----------------------
> > > >
> > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > index 49b6049b26ac..c5d4b5a2dea1 100644
> > > > --- a/kernel/audit.c
> > > > +++ b/kernel/audit.c
> > > > @@ -108,8 +108,8 @@ struct auditd_connection {
> > > >       struct net *net;
> > > >       struct rcu_head rcu;
> > > >  };
> > > > -static struct auditd_connection __rcu *auditd_conn;
> > > > -RCU_INIT_POINTER(auditd_conn);
> > > > +static struct auditd_connection __rcu *auditd_conn = NULL;
> > >
> > > I ran a quick checkpatch and it gave me this error:
> > > ERROR: do not initialise statics to NULL
> > >
> > > So in order to fix it I decided to INIT the pointer (and failed)
> > 
> > Well, try to understand the checkpatch error then, and do the right thing :)
> 
> I read-up a few articles about this. I think I've understood the problem. I'm
> sending in the ammended patch now. Sorry for this. Won't happen again.

Oh, no need apology. You are learning. But yeah always do a thorough job
before sending patches.

thanks,

 - Joel


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

