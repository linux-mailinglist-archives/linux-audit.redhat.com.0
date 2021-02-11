Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB703194D3
	for <lists+linux-audit@lfdr.de>; Thu, 11 Feb 2021 22:03:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613077426;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LgAfkHRxUBu9VtPTYSpN7nexDK6zybuwtxsLF0a/g98=;
	b=JUiLsyxEWWHgngQzpW392+KdmMHAnm8r3r2P6zqNXi7t+fPy7HJxqi1PK5o5UcGBCWn4ih
	mAlMB9Z4ZKGq4Al86Kokvv3iIxs2FioCFZDgNtwDiZ5Q7SFg1R/4daytZDpDWk5jmMWsYW
	lajFJb01cCGJRdYqHsmjGLUYxuP/2iI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-w3APhE5LMUetQOLzBv-KXA-1; Thu, 11 Feb 2021 16:03:44 -0500
X-MC-Unique: w3APhE5LMUetQOLzBv-KXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CD74801975;
	Thu, 11 Feb 2021 21:03:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD8B560636;
	Thu, 11 Feb 2021 21:03:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED0A450033;
	Thu, 11 Feb 2021 21:03:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11BL38q9025914 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 11 Feb 2021 16:03:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C65092BFED; Thu, 11 Feb 2021 21:03:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-118-15.rdu2.redhat.com [10.10.118.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B31E60636;
	Thu, 11 Feb 2021 21:02:57 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Phil Sutter <phil@nwl.cc>, Richard Guy Briggs <rgb@redhat.com>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	Ondrej Mosnacek <omosnace@redhat.com>, fw@strlen.de,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org, Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Date: Thu, 11 Feb 2021 16:02:55 -0500
Message-ID: <4087569.ejJDZkT8p0@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20210211151606.GX3158@orbyte.nwl.cc>
	<CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, February 11, 2021 11:29:34 AM EST Paul Moore wrote:
> > If I'm not mistaken, iptables emits a single audit log per table, ipset
> > doesn't support audit at all. So I wonder how much audit logging is
> > required at all (for certification or whatever reason). How much
> > granularity is desired?
 
  <snip> 

> I believe the netfilter auditing was mostly a nice-to-have bit of
> functionality to help add to the completeness of the audit logs, but I
> could very easily be mistaken.  Richard put together those patches, he
> can probably provide the background/motivation for the effort.

There are certifications which levy requirements on information flow control. 
The firewall can decide if information should flow or be blocked. Information 
flow decisions need to be auditable - which we have with the audit target. 
That then swings in requirements on the configuration of the information flow 
policy.

The requirements state a need to audit any management activity - meaning the 
creation, modification, and/or deletion of a "firewall ruleset". Because it 
talks constantly about a ruleset and then individual rules, I suspect only 1 
summary event is needed to say something happened, who did it, and the 
outcome. This would be in line with how selinux is treated: we have 1 summary 
event for loading/modifying/unloading selinux policy.

Hope this helps...

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

