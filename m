Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB5110CA5E
	for <lists+linux-audit@lfdr.de>; Thu, 28 Nov 2019 15:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574951443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ih7eMExmmOWs68RsVk7+6JRCy2xxGxR1y5E9+UM9PUA=;
	b=YyE45jHqoEVEpDb3sf1HT8/E/uJpm57gYrVFFs3D7JJ/zQIYePYrO4vgMIAJ8KcCydraxg
	46y5VYZ80ioaUlJEJMA3rQ3bvz/5rL4zwOtHCOLOdL7ZIDzlWa6YhLnTsZziAgCwGpzeOc
	mqFjbf95XDpu56RnXOx+2qXEjATHZwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303--u42PATvNQafeaY3kuVgrg-1; Thu, 28 Nov 2019 09:30:41 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91A3218AAFB8;
	Thu, 28 Nov 2019 14:30:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02E775D9C5;
	Thu, 28 Nov 2019 14:30:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E77E4BB78;
	Thu, 28 Nov 2019 14:30:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xARFQFT2004880 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 27 Nov 2019 10:26:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BA2FB1054598; Wed, 27 Nov 2019 15:26:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B509210F1BF8
	for <linux-audit@redhat.com>; Wed, 27 Nov 2019 15:26:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FB76804C62
	for <linux-audit@redhat.com>; Wed, 27 Nov 2019 15:26:13 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-357-7-VPXMwqOJix67hTRUfmmQ-1; Wed, 27 Nov 2019 10:26:09 -0500
Received: by mail-qk1-f194.google.com with SMTP id e187so19857719qkf.4
	for <linux-audit@redhat.com>; Wed, 27 Nov 2019 07:26:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m8XASQ33ScpPMW9Lk7i08lqftHVIhhUvhoQmKMQABbc=;
	b=hMZ3nHjOH/OwRv2AEBXjr0gbq5+DayIooB3G47afQ9aYYUvZvwcLRaVy0IVq1mX2Xy
	LsrsqElZUxiQLpXP8RFALBtVXBGkNF3GQrpar7QU5fcXWpj1/2nrSBdG2V6vcWNtNVFm
	xO39VP22oyy5lIhxRFW35zXyd8WAv6cNQDsx6LCD7swlCnVg2nFNuiHeLUPC2aFpLgEs
	3cjORRo4pWd8IXcZ5ABPwGYHugOSmhclBMz11srHE+uq4fgw4rWeiJGTOZAximn4toy4
	jIMNNteYPsl7aYzjNyKwJbZqbqUClLdjO8ABy/0NilCxc1vTShXWaxkdKBSnA92Jp6Gy
	fgHQ==
X-Gm-Message-State: APjAAAW+iVZLh3YPQKthVFMz4ZSql4lFqeO+EGfsFyarr8nzEES8cBWL
	zBAyweKDVsN5rK2+Nz+xnh31RBgGfMbQE92xms4u1eh1
X-Google-Smtp-Source: APXvYqxmt7EJm6XHe3c8cZCXvjViANZ57FQDXdBpxpmjlh/GOMdASfyOe+aRvHafsySiNAzQc11Jy+o+X72q47vcr88=
X-Received: by 2002:ae9:c219:: with SMTP id j25mr4939170qkg.470.1574868368530; 
	Wed, 27 Nov 2019 07:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20191126172723.GA12759@workstation-kernel-dev>
	<20191127022925.GB157739@google.com>
	<20191127052827.GA9782@workstation-portable>
In-Reply-To: <20191127052827.GA9782@workstation-portable>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Wed, 27 Nov 2019 10:25:57 -0500
Message-ID: <CAEXW_YS=eDhmv+MaKLoRTCcPknscxqfHa2TyrjAEXpug1g67jw@mail.gmail.com>
Subject: Re: [PATCH] kernel: audit.c: Add __rcu notation to RCU pointer
To: Amol Grover <frextrite@gmail.com>
X-MC-Unique: 7-VPXMwqOJix67hTRUfmmQ-1
X-MC-Unique: -u42PATvNQafeaY3kuVgrg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xARFQFT2004880
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 28 Nov 2019 09:30:15 -0500
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

On Wed, Nov 27, 2019 at 12:29 AM Amol Grover <frextrite@gmail.com> wrote:
>
> On Tue, Nov 26, 2019 at 09:29:25PM -0500, Joel Fernandes wrote:
> > On Tue, Nov 26, 2019 at 10:57:23PM +0530, Amol Grover wrote:
> > > add __rcu notation to RCU protected global pointer auditd_conn
> > >
> > > Fixes multiple instances of sparse error:
> > > error: incompatible types in comparison expression
> > > (different address spaces)
> > >
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > ---
> > >  kernel/audit.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index da8dc0db5bd3..30e7fc9b8da2 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -102,12 +102,14 @@ struct audit_net {
> > >   * This struct is RCU protected; you must either hold the RCU lock for reading
> > >   * or the associated spinlock for writing.
> > >   */
> > > -static struct auditd_connection {
> > > +struct auditd_connection {
> > >     struct pid *pid;
> > >     u32 portid;
> > >     struct net *net;
> > >     struct rcu_head rcu;
> > > -} *auditd_conn = NULL;
> > > +};
> > > +static struct auditd_connection __rcu *auditd_conn;
> > > +RCU_INIT_POINTER(auditd_conn);
> >
> > Looks like this causes a build error. Always please build test your patches
> > in the very least. And I also did not understand how RCU_INIT_POINTER can
> > even be used outside of a function. In C, executable code cannot be outside
> > functions.
> >
> > Is doing the following not sufficient to fix the sparse issue?
> >
> > thanks,
> >
> >  - Joel
> >
> > ---8<-----------------------
> >
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 49b6049b26ac..c5d4b5a2dea1 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -108,8 +108,8 @@ struct auditd_connection {
> >       struct net *net;
> >       struct rcu_head rcu;
> >  };
> > -static struct auditd_connection __rcu *auditd_conn;
> > -RCU_INIT_POINTER(auditd_conn);
> > +static struct auditd_connection __rcu *auditd_conn = NULL;
>
> I ran a quick checkpatch and it gave me this error:
> ERROR: do not initialise statics to NULL
>
> So in order to fix it I decided to INIT the pointer (and failed)

Well, try to understand the checkpatch error then, and do the right thing :)

- Joel


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

