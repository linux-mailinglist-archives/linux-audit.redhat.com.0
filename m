Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A85AA1B5B58
	for <lists+linux-audit@lfdr.de>; Thu, 23 Apr 2020 14:24:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587644697;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ecIikKsDzI7FDUj0i3X4tw3ktufElOQhuF7QpiHHMrY=;
	b=AiK33UPHub3QRkRuzEbTtCKRkOz1PIPp4+QJBSsKY5u3ydz09LCq8p6LI+0HyG+4PzMjPt
	Db4uAu5y/QJqDQDjaNSWhoAkWHMYVoypn+tPxNYOhHDysnh1rDDAiwy6UsS14bELli7lrx
	u9UApg5bDlDjxt0J7rJi7uNLEAurlms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-qN_ZICCtPmqAgoSh9NydcA-1; Thu, 23 Apr 2020 08:24:55 -0400
X-MC-Unique: qN_ZICCtPmqAgoSh9NydcA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D973100A8EE;
	Thu, 23 Apr 2020 12:24:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11964610EC;
	Thu, 23 Apr 2020 12:24:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4AEA14CA95;
	Thu, 23 Apr 2020 12:24:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03N7UYjN008590 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 03:30:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0ABC544116; Thu, 23 Apr 2020 07:30:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0507AB07B1
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 07:30:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33916811768
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 07:30:28 +0000 (UTC)
Received: from gardel.0pointer.net (gardel.0pointer.net [85.214.157.71])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-432--sYvSGyHMJirajJPR2VZ8g-1; Thu, 23 Apr 2020 03:30:25 -0400
X-MC-Unique: -sYvSGyHMJirajJPR2VZ8g-1
Received: from gardel-login.0pointer.net (gardel.0pointer.net [85.214.157.71])
	by gardel.0pointer.net (Postfix) with ESMTP id 7B936E80645;
	Thu, 23 Apr 2020 09:30:22 +0200 (CEST)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
	id 93526160364; Thu, 23 Apr 2020 09:30:21 +0200 (CEST)
Date: Thu, 23 Apr 2020 09:30:21 +0200
From: Lennart Poettering <lennart@poettering.net>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: multicast listeners and audit events to kmsg
Message-ID: <20200423073021.GA62700@gardel-login>
References: <20200414092740.2fdf0f78@xantho>
	<20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
	<20200416120612.GA52165@gardel-login>
	<CAHC9VhTxW5S9Nv8Z_3eTNDHiu9SmDsHvBG_7abH+Db1the19UQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTxW5S9Nv8Z_3eTNDHiu9SmDsHvBG_7abH+Db1the19UQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03N7UYjN008590
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 23 Apr 2020 08:24:20 -0400
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mi, 22.04.20 17:59, Paul Moore (paul@paul-moore.com) wrote:

> > In systemd we just think that audit information is pretty interesting
> > even if you don't want to buy into the whole government regulation
> > stuff, even if you don't want the auditd to run, and the full audit
> > package installed. i.e. we want to collect the data as one of our
> > various data streams, as a secondary consumer of it, and leave it to
> > the audit package itself to do everything else and be the primary
> > consumer of it.
> >
> > Using the multicast group is our way of saying: "we don't want to own
> > the audit stream, you can keep it; we just want to have a look
> > too".
>
> The problem is that on systems without a running audit daemon there is
> no one to "own" the audit stream so it floods the kmsg, spills onto
> the console, and everyone's feet get wet.  Are we going to blame the
> source of the stream, or the person who turned on the tap in the first
> place and caused the mess?

It's not a question of blaming anyone. We are just looking for a nice
way so that we can get the mcast stuff without the kmsg stuff. it can
totally be something we toggle explicitly, i have no problem with
that.

> If systemd enables the audit stream, and doesn't want the stream to
> flood kmsg, it needs to make sure that the stream is directed to a
> suitable sink, be it auditd or some other daemon.

This sounds as if journald should start using the unicast stream. This
basically means auditd is out of the game, and cannot be added in
anymore, because the unicast stream is then owned by journald. It
wouldn't be sufficient to just install the audit package to get
classic audit working anymore. You'd have to reconfigure everything.

I mean, we try to be non-intrusive, not step into your territory too
much, not replace auditd, not kick auditd out of the game. But you are
basically telling us to do just that?

Lennart

--
Lennart Poettering, Berlin


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

