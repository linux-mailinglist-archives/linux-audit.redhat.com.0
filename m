Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7436E1B4FB6
	for <lists+linux-audit@lfdr.de>; Thu, 23 Apr 2020 00:00:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587592801;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r//wERCCRsoZzAwe3hT3HGsFNSd/VYwvGLl7GCbRGjU=;
	b=M5RVqwto+eWPInGCNCSngj5VLZpMSBLS9iNvZlPrIv5iTqJ6ut8Li7kOMzDlTav8EJ7dJr
	6XwjXzcWjJPqWaJt4peCRJVneY+M4REi2V2pKACZx41wPFoK1ZsXOhFVf11RGu5NDOCK58
	FMZzPI+I/hgdr+0sXgr5/qUMg3yDrDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-YXu2zppvMt6awIwyYdOHIw-1; Wed, 22 Apr 2020 17:59:58 -0400
X-MC-Unique: YXu2zppvMt6awIwyYdOHIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A71E38017FD;
	Wed, 22 Apr 2020 21:59:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42A2F104C43E;
	Wed, 22 Apr 2020 21:59:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E963941C9;
	Wed, 22 Apr 2020 21:59:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MLxhiD010984 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 17:59:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D1542166B2A; Wed, 22 Apr 2020 21:59:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 696292166B29
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 21:59:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F2FB833B44
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 21:59:41 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-112-n5ZZSSvPO2u1b0mmjfBLSg-1; Wed, 22 Apr 2020 17:59:39 -0400
X-MC-Unique: n5ZZSSvPO2u1b0mmjfBLSg-1
Received: by mail-ej1-f68.google.com with SMTP id q8so3101588eja.2
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 14:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sB7UerWht73utL9yTMfZumT5EIk0o9n6BAMgOe3swJ8=;
	b=ipT3zufShxvWpUyC7Z2ZoDlGsG7iOKnVIk8GJNbqacZXnwayDppSe4NAdnkdiMhEDU
	o4m8+r6yaNty0So+wct3pdW7ZJt3oCUIFfpXY1zpIZkPBujwB8+3AIcejBCGkQEbm49E
	5JkfPaBbGdaUwuqZKXS60tC74+CAB+54aDxc+OHip98B3xaiZqu7oU975xuei7bN+Q7M
	FvMkyjN1iPsuXMtiL0oomHZV2Ss2QVG7OlvwQLWyP1Fa3dxGSYABlCEZOQbLF+u+heAK
	RB1KtXP4thoDQCtE2dDl7GVmzppfCEqbB0PUIbYaTrwKE9d1FW5O1ViAWY6vN8L3vr/F
	1njA==
X-Gm-Message-State: AGi0PuZQjkaDy4tQXFybIF/AFXeqpUXQeURuiMNn8V90PpaSgArzeBXM
	RBWQopr8Q4naP2I/4Ze00ye52Ky2Rd7o7Af+qGwA
X-Google-Smtp-Source: APiQypLbzxLFxCZq62ivh9TFEz8HtbY04ZZpjoxo1rI5KzGOoYP4Xsa18zO0IY6MyQ+lsiz1rReb2ltJSn3ts116lHY=
X-Received: by 2002:a17:906:f288:: with SMTP id
	gu8mr345724ejb.281.1587592777959; 
	Wed, 22 Apr 2020 14:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200414092740.2fdf0f78@xantho>
	<20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
	<20200416120612.GA52165@gardel-login>
In-Reply-To: <20200416120612.GA52165@gardel-login>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Apr 2020 17:59:26 -0400
Message-ID: <CAHC9VhTxW5S9Nv8Z_3eTNDHiu9SmDsHvBG_7abH+Db1the19UQ@mail.gmail.com>
Subject: Re: multicast listeners and audit events to kmsg
To: Lennart Poettering <lennart@poettering.net>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03MLxhiD010984
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 16, 2020 at 8:45 AM Lennart Poettering
<lennart@poettering.net> wrote:
> On Mi, 15.04.20 11:53, Richard Guy Briggs (rgb@redhat.com) wrote:
> > On 2020-04-14 09:27, Luca BRUNO wrote:
> > > Hi all,
> > > I'm trying to re-spin a very old thread related to multicast listeners
> > > and audit events to kmsg.
> > >
> > > One surprising kernel behavior when using only a multicast listener
> > > to collect audit events (in this case, systemd-journald) is that
> > > audit events end up spamming the console [0].
> > >
> > > [0] https://github.com/systemd/systemd/issues/15324
> >
> > This is not surprising, since the multicast audit socket is not
> > considered a reliable sink for the audit log and thus cannot be relied
> > upon to key the decision to forward potentially lost messages to the
> > system log.
>
> kmsg is not reliable either, it aggressively and silently drops
> messages if the log buffer runs full, which it does pretty quickly.
>
> hence there's really no difference here if data is written to the
> mcast socket or to kmsg, in both cases messages are dropped when the
> buffer limits are hit, hence it should be entirely fine to do only one
> of the twoif the unicast client to audit is not running.

I'm a little late to this discussion due to some other audit and
kernel issues, but I wanted to both add a little content and
additional voice to what Richard and Lenny have already said.

As far as reliability is concerned, the "reliable" communication
channel is the unicast netlink channel between the audit daemon and
the kernel.  Sure, it isn't perfect but it is better than both the
multicast netlink channel and the kernel's message buffer.  If you
look at the kernel's audit code, you'll see that printk/kmsg is really
only used as a last resort when the main unicast netlink channel is
down.  We are not claiming it is a reliable mechanism, it is just all
the kernel has at that point*.

* A quick comment on the multicast netlink channel: it was always seen
as a separate out-of-band, unreliable mechanism to communicate audit
records to systemd (and presumably others, but I'm not aware of any).
There has never been any serious thought amongst the audit developers
to support the multicast netlink channel beyond this, and I don't see
anything changing that in the immediate future.  FWIW, I agree with
Richard's comment that the netlink multicast channel was a mistake; it
wasn't my call to make at the time, but I don't think we would merge
that code if it came up today.  However, it was merged and we will
continue to support it within the scope of its original functionality.

> > > Apparently there isn't a clear consensus on how this should be
> > > approached. Looking at the github and bugzilla tickets, it seems to me
> > > that Eric and Paul initially had in mind some logic based on multicast
> > > listener detection, while Richard doesn't deem that reliable and
> > > suggests an explicit configuration.
> >
> > I'm regretting having developped this feature due to the problems it has
> > caused the audit developpers and innocent bystanders.  Instead, an audit
> > daemon plugin should have been used to direct log records to
> > journald.
>
> I am sorry, but this doesn't work for us. We do not want to do IPC to
> some audit daemon (journald runs during early boot and in the initrd,
> it has a very special relationship with early boot stuff and PID1, and
> thus being a client to other daemons is highly problematic, if those
> other daemons are managed by systemd as well, and run only during later
> boot). In fact we don't even want the dependency on the audit
> userspace package at all.
>
> In systemd we just think that audit information is pretty interesting
> even if you don't want to buy into the whole government regulation
> stuff, even if you don't want the auditd to run, and the full audit
> package installed. i.e. we want to collect the data as one of our
> various data streams, as a secondary consumer of it, and leave it to
> the audit package itself to do everything else and be the primary
> consumer of it.
>
> Using the multicast group is our way of saying: "we don't want to own
> the audit stream, you can keep it; we just want to have a look
> too".

The problem is that on systems without a running audit daemon there is
no one to "own" the audit stream so it floods the kmsg, spills onto
the console, and everyone's feet get wet.  Are we going to blame the
source of the stream, or the person who turned on the tap in the first
place and caused the mess?

If systemd enables the audit stream, and doesn't want the stream to
flood kmsg, it needs to make sure that the stream is directed to a
suitable sink, be it auditd or some other daemon.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

