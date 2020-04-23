Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 93E291B6195
	for <lists+linux-audit@lfdr.de>; Thu, 23 Apr 2020 19:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587661718;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WxeqI/LrjdfemD79UzjmW4mU6Hyrwlz/mXsQ3BF9dRA=;
	b=D5uSCLSdQOcAxU0+XmHXne3jF8ZKw8h40sUq8N+pjVMhPkoC/HWIqSyl0nQYkW342Ye04n
	d0NWO59tnGFt0WdAaHhZGUxk78/+RmyVVksjhCvExgaBJ0pfKVyxRz2YrVVJfJKW5x3b2D
	sogVR1H7LCpkx2FHuY7gEIzYebPN/dM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-4vA7BYMpPKKCBQlNa0cnQw-1; Thu, 23 Apr 2020 13:08:36 -0400
X-MC-Unique: 4vA7BYMpPKKCBQlNa0cnQw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01BC7180F10B;
	Thu, 23 Apr 2020 17:08:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8CCF60E1C;
	Thu, 23 Apr 2020 17:08:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B68A01809541;
	Thu, 23 Apr 2020 17:08:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NGkNns018616 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 12:46:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50B075C1D0; Thu, 23 Apr 2020 16:46:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast02.extmail.prod.ext.phx2.redhat.com [10.5.110.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41FE25C1BE
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 16:46:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B38E107ACCA
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 16:46:20 +0000 (UTC)
Received: from gardel.0pointer.net (gardel.0pointer.net [85.214.157.71])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-100-cbCft_AqPymjEIDJDqtRow-1; Thu, 23 Apr 2020 12:44:04 -0400
X-MC-Unique: cbCft_AqPymjEIDJDqtRow-1
Received: from gardel-login.0pointer.net (gardel.0pointer.net [85.214.157.71])
	by gardel.0pointer.net (Postfix) with ESMTP id 56E81E80645;
	Thu, 23 Apr 2020 18:44:02 +0200 (CEST)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
	id F3538160364; Thu, 23 Apr 2020 18:44:01 +0200 (CEST)
Date: Thu, 23 Apr 2020 18:44:01 +0200
From: Lennart Poettering <lennart@poettering.net>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: multicast listeners and audit events to kmsg
Message-ID: <20200423164401.GA63285@gardel-login>
References: <20200414092740.2fdf0f78@xantho>
	<20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
	<20200416120612.GA52165@gardel-login>
	<CAHC9VhTxW5S9Nv8Z_3eTNDHiu9SmDsHvBG_7abH+Db1the19UQ@mail.gmail.com>
	<20200423073021.GA62700@gardel-login>
	<CAHC9VhSu=cbr_f3fyX_wdBdt_+xHwBBjOJojrk-iNgwhhBCg7w@mail.gmail.com>
	<20200423135743.GB63067@gardel-login>
	<f88f306c-9274-e2a6-fbc8-9e750e1289ef@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <f88f306c-9274-e2a6-fbc8-9e750e1289ef@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03NGkNns018616
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 23 Apr 2020 13:08:17 -0400
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

On Do, 23.04.20 09:19, Casey Schaufler (casey@schaufler-ca.com) wrote:

> > For example, Fedora CoreOS wants to enable selinux, thus is interested
> > in audit messages, but have no intention to install auditd, in the
> > typical, minimal images they generate. See:
> >
> > https://github.com/systemd/systemd/issues/15324
>
> If you can do a better job of consuming audit data than auditd I for one
> would be impressed. I've written multiple audit systems over the years
> (not this one, but the issues are all familiar and the solutions similar)
> and the kernel -> user interface is much, much harder than it looks.

The audit support in journald is really not about doing "a better
job", or being "faster". Totally not. It's about making a common case
easy, that's all.

There are at least two very different usecases for the audit data:

1. auditing for the purpose of auditing (i.e. government style)

2. people who just want to debug their frickin selinux issues

auditd is great for #1. for #2 people don't want to bother, journald
is fine, speed or reliability or any such don't matter, the mcast
stuff is definitely good enough, and the benefit of collecting the
AVCs via audit from earliest boot on is a lot more interesting and
important for such uses than to wonder what happens if the queue runs
over...

I mean, can't you understand that there's a theme here of people
wanting to pick up basic audit messages without installing the whole
auditd package and running a daemon all the time? CoreOS wants this,
and journald implements this for a reason...

I am not sure what the big problem would be with just providing us
with a control to turn off the kmsg forwarding with a sysctl or
netlink command or so, when userspace requests that. if we had that,
auditd could do its own thing owning audit, journald could do its own
thing with a stream at the side, and we wouldn't step on each others
toes.

Anyway, I accept this discussion is not leading anywhere, let's end it
here. I do sense the condescension, and I don't need more of that.

Lennart

--
Lennart Poettering, Berlin


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

