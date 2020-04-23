Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 84A0F1B61BA
	for <lists+linux-audit@lfdr.de>; Thu, 23 Apr 2020 19:17:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587662244;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+HWwqXUVUAV9dSY9SEAbqG3mawzK+yre8z+rWY2IOrU=;
	b=X4XZDDgytGPml69JoXffWFMbqj+q+R0mLa84vQT2rSxKK6CLH+st6n4eQ8uUZWRIwPisyg
	on11nAY7kA6ALh+tPkwt0VZMlP6c3JAJe8Lhhomv26BbbIdQ9LE8AIhemu/J+oeJ5fGAm9
	ErYv8JRb61l57Wc9ZcGAdore9wdUwTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-E5HX4VnPPJCEDzF4VbaO6g-1; Thu, 23 Apr 2020 13:17:22 -0400
X-MC-Unique: E5HX4VnPPJCEDzF4VbaO6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B0281052502;
	Thu, 23 Apr 2020 17:17:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 596ED10021B3;
	Thu, 23 Apr 2020 17:17:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 100A04CAA0;
	Thu, 23 Apr 2020 17:17:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NHHAxx020910 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 13:17:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0742760605; Thu, 23 Apr 2020 17:17:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-160.phx2.redhat.com [10.3.113.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B38AD6084D;
	Thu, 23 Apr 2020 17:17:03 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: multicast listeners and audit events to kmsg
Date: Thu, 23 Apr 2020 13:17:03 -0400
Message-ID: <132308961.kn0NcHyqfS@x2>
Organization: Red Hat
In-Reply-To: <20200423164401.GA63285@gardel-login>
References: <20200414092740.2fdf0f78@xantho>
	<f88f306c-9274-e2a6-fbc8-9e750e1289ef@schaufler-ca.com>
	<20200423164401.GA63285@gardel-login>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Lennart Poettering <lennart@poettering.net>
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

On Thursday, April 23, 2020 12:44:01 PM EDT Lennart Poettering wrote:
> On Do, 23.04.20 09:19, Casey Schaufler (casey@schaufler-ca.com) wrote:
> > > For example, Fedora CoreOS wants to enable selinux, thus is interested
> > > in audit messages, but have no intention to install auditd, in the
> > > typical, minimal images they generate. See:
> > > 
> > > https://github.com/systemd/systemd/issues/15324
> > 
> > If you can do a better job of consuming audit data than auditd I for one
> > would be impressed. I've written multiple audit systems over the years
> > (not this one, but the issues are all familiar and the solutions similar)
> > and the kernel -> user interface is much, much harder than it looks.
> 
> The audit support in journald is really not about doing "a better
> job", or being "faster". Totally not. It's about making a common case
> easy, that's all.
> 
> There are at least two very different usecases for the audit data:
> 
> 1. auditing for the purpose of auditing (i.e. government style)
> 
> 2. people who just want to debug their frickin selinux issues
> 
> auditd is great for #1. for #2 people don't want to bother, journald
> is fine, speed or reliability or any such don't matter, the mcast
> stuff is definitely good enough, and the benefit of collecting the
> AVCs via audit from earliest boot on is a lot more interesting and
> important for such uses than to wonder what happens if the queue runs
> over...

It won't. Audit events are held until the audit daemon arrives. Also, selinux 
sends AVC's to syslog without any audit daemon intervention. So, you already 
have access to what you say you need.

Try it. Uninstall the audit daemon, set journald to not enable the audit 
system. Look in dmesg or syslog. You should see any AVC's that were created.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

