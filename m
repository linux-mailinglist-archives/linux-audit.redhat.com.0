Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A560D1B5D45
	for <lists+linux-audit@lfdr.de>; Thu, 23 Apr 2020 16:08:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587650889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uf19zU1jy4/Cswf2Vh1a+TmuH37jG9OKq/oGajmNjlc=;
	b=CSZoHUXggF3EgpagLMnfr7ulVJTvh1LeWM+jn5s1FhdBejJBjc5IMM4FPs9yOuqusfAof+
	pNvnWM56kvcMXby0Xr4KnZTzyc/4kLRpM2izkFvpfO7jU4WXQmfFtLpQGGr9RS3qWcxXj0
	rNOwkyIhSR8nsIwvBc05YbsvZeDskAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-dXWDQYjcM3yWNgLTqggjWQ-1; Thu, 23 Apr 2020 10:08:05 -0400
X-MC-Unique: dXWDQYjcM3yWNgLTqggjWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 060F31B2C9AC;
	Thu, 23 Apr 2020 14:08:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C6245D9CC;
	Thu, 23 Apr 2020 14:08:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C84054CA95;
	Thu, 23 Apr 2020 14:07:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NDvr2I004452 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 09:57:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D3CB202683E; Thu, 23 Apr 2020 13:57:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37938202696C
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 13:57:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2429C800FFA
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 13:57:50 +0000 (UTC)
Received: from gardel.0pointer.net (gardel.0pointer.net [85.214.157.71])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-396-UTDQxlXmNHm_5y3MGXUr_Q-1; Thu, 23 Apr 2020 09:57:46 -0400
X-MC-Unique: UTDQxlXmNHm_5y3MGXUr_Q-1
Received: from gardel-login.0pointer.net (gardel.0pointer.net
	[IPv6:2a01:238:43ed:c300:10c3:bcf3:3266:da74])
	by gardel.0pointer.net (Postfix) with ESMTP id E5EF6E80645;
	Thu, 23 Apr 2020 15:57:43 +0200 (CEST)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
	id 7DE4D160364; Thu, 23 Apr 2020 15:57:43 +0200 (CEST)
Date: Thu, 23 Apr 2020 15:57:43 +0200
From: Lennart Poettering <lennart@poettering.net>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: multicast listeners and audit events to kmsg
Message-ID: <20200423135743.GB63067@gardel-login>
References: <20200414092740.2fdf0f78@xantho>
	<20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
	<20200416120612.GA52165@gardel-login>
	<CAHC9VhTxW5S9Nv8Z_3eTNDHiu9SmDsHvBG_7abH+Db1the19UQ@mail.gmail.com>
	<20200423073021.GA62700@gardel-login>
	<CAHC9VhSu=cbr_f3fyX_wdBdt_+xHwBBjOJojrk-iNgwhhBCg7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSu=cbr_f3fyX_wdBdt_+xHwBBjOJojrk-iNgwhhBCg7w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03NDvr2I004452
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 23 Apr 2020 10:07:52 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Do, 23.04.20 09:50, Paul Moore (paul@paul-moore.com) wrote:

> > > If systemd enables the audit stream, and doesn't want the stream to
> > > flood kmsg, it needs to make sure that the stream is directed to a
> > > suitable sink, be it auditd or some other daemon.
> >
> > This sounds as if journald should start using the unicast stream. This
> > basically means auditd is out of the game, and cannot be added in
> > anymore, because the unicast stream is then owned by journald. It
> > wouldn't be sufficient to just install the audit package to get
> > classic audit working anymore. You'd have to reconfigure everything.
> >
> > I mean, we try to be non-intrusive, not step into your territory too
> > much, not replace auditd, not kick auditd out of the game. But you are
> > basically telling us to do just that?
>
> My recommendation is that if you are going to enable audit you should
> also ensure that auditd is running; that is what I'm telling you.

Well, that's the "audit is my private kingdom" response, right?

People are interested in collecting the audit stream without having
the full audit daemon installed. There's useful data in the audit
stream, already generated during really early boot, long before auditd
runs, i.e. in the initrd. And for smaller systems auditd is not really
something people want around.

For example, Fedora CoreOS wants to enable selinux, thus is interested
in audit messages, but have no intention to install auditd, in the
typical, minimal images they generate. See:

https://github.com/systemd/systemd/issues/15324

Lennart

--
Lennart Poettering, Berlin


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

