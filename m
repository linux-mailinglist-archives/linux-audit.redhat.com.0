Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CF7F42FBD04
	for <lists+linux-audit@lfdr.de>; Tue, 19 Jan 2021 17:57:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611075456;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JExp1w8mcDiPH9YkbK51hnRbLHc8Qx4tDrpQ5dr7PuI=;
	b=UBWmTHHK62sdY97T6CyQ9NBDNtgjjDndXSPTvGVwIBrgmMBMa2l1X0zmJUbudRDrMYXeyl
	uB2dV241gdl/qG/NERlkReeVUNj3yzQLAtd52RLbp21pTJBPP8SK9UxZ+/Jl/D9QsGJsMp
	gPf58GnHCzFZgoXsuHlXbecMOjOVlI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-ifAlwH-rOu-_iWcwRo8xfA-1; Tue, 19 Jan 2021 11:57:33 -0500
X-MC-Unique: ifAlwH-rOu-_iWcwRo8xfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90D6A1966320;
	Tue, 19 Jan 2021 16:57:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A64719CB2;
	Tue, 19 Jan 2021 16:57:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 618164BB7B;
	Tue, 19 Jan 2021 16:57:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JGutCj005224 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 11:56:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A3E5019C93; Tue, 19 Jan 2021 16:56:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-90.rdu2.redhat.com [10.10.116.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43E8019C84;
	Tue, 19 Jan 2021 16:56:52 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: Re: AuditRule Questions
Date: Tue, 19 Jan 2021 11:56:51 -0500
Message-ID: <2759467.e9J7NaK4W3@x2>
Organization: Red Hat
In-Reply-To: <61239576.993577.1611062133080@mail.yahoo.com>
References: <61239576.993577.1611062133080.ref@mail.yahoo.com>
	<61239576.993577.1611062133080@mail.yahoo.com>
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

On Tuesday, January 19, 2021 8:15:33 AM EST Joe Wulf wrote:
> 1. In audit rules 2.8.5 (front portion of the rules):
> 
> ## Unsuccessful file access (any other opens) This has to go last.
> -a always,exit -F arch=b32 -S
> open,creat,truncate,ftruncate,openat,open_by_handle_at -F exit=-EACCES-a
> always,exit -F arch=b64 -S
> open,creat,truncate,ftruncate,openat,open_by_handle_at -F exit=-EACCES-a
> always,exit -F arch=b32 -S
> open,creat,truncate,ftruncate,openat,open_by_handle_at -F exit=-EPERM-a
> always,exit -F arch=b64 -S
> open,creat,truncate,ftruncate,openat,open_by_handle_at  -F exit=-EPERM
> Whereas in audit rules 3.0, the same portion of the same rules looks like:
> -a always,exit -F arch=b32 -S
> open,creat,truncate,ftruncate,openat,open_by_handle_at -F exit=-EACCES-a
> always,exit -F arch=b32 -S
> open,creat,truncate,ftruncate,openat,open_by_handle_at -F exit=-EPERM-a
> always,exit -F arch=b64 -S
> open,truncate,ftruncate,creat,openat,open_by_handle_at -F exit=-EACCES-a
> always,exit -F arch=b64 -S
> open,truncate,ftruncate,creat,openat,open_by_handle_at  -F exit=-EPERM
> 
> The ordering of the syscalls differs between the two, as well as the
> sequential order of the rules themselves. I better understand that the
> first audit-rule matched 'wins'.-  Please help me understand the reason
> for the change in sequence, but also for the change in the order of the
> syscalls (i.e. between 2.8.5 and 3.0).

There were several 3.0 alpha releases. I'm not sure which one you are calling 
3.0. Because I can't find an exact match. Based on the text above, I do not 
see the syscall ordering changed at all. The only thing that I see is in 
2.8.5 they are grouped by exit code whereas 3.0 is grouped by arch. Since 
this group of rules all have the same key, they are working as a team. That 
means that what matters is the placement of this group of rules relative to 
other groups of rules is what matters. In both cases a syscall can ever only 
match one of them - the exit code either is or isn't EPERM, it either is or 
isn't b32.


> 2.  I notice there are many rules across the entire set (both 2.8.5 and
> 3.0) that define their key with "-F key=<name>", and others simply with
> "-k <name>".-  Why are their two methods for KEY naming, and does one have
> a distinct meaning, or precedence, over the other?

This is explained in the audit.rules man page in the discussion about 
watches. Way back in 2005, there was the idea of filesystem watches. The 
syntax for them was

-w path-to-file -p permissions -k keyname

The initial implementation was found to have some limits and it was rewritten 
around 2006 around a new syscall API. The old syscall API was deprecated, 
too. This new syscall API was capable of handling pathes. So, that means the 
following is equivalent to the above

-a always,exit -F path=path-to-file -F perm=permissions -F key=keyname

But to preserve backwards compatibility, auditctl translates the first form 
into the second under the covers. You cannot mix the two notations in the 
same rule or auditctl will reject it.

> Are their some 'rule' types where '-k' is appropriate, whereas '-F key=" is
> not, thus they are not truly 100% interchangeable?

Hopefully above makes this clear.

> -  If both methods ARE equivalent
> throughout ALL of the audit.rules content, would it be reasonable to
> standardize on one method in v3.0.x of your rules going forward?

It appears that all rules have been standardized around the syscall method 
except for the nispom and stig rules which are no longer preferred. I suppose 
at some point I should just drop nispom since no one has asked about meeting 
it in 12 or 13 years. At this point, the ospp rules are the recommended rule 
set.

 
> 3.  For a RHEL 7.x (and even 8.x) system where the hardware is x86_64 and
> there is no reasonable expectation to install or operate 'ANY' 32bit
> software, is there any value, or system performance penalty, to totally
> eliminating all 'b32' rules?

You could. But then I'd add  "21-no32bit.rules"  to detect if something tries 
to use it to evade detection. The 32 bit ABI is available even on 64 bit 
systems.


> 4.  On the grub/kernel commandline, I can add:  'audit=1' -and-
> 'audit_backlog_limit=####'.  I looked for solutions to address the issue I
> was having, and found one here: 
> https://access.redhat.com/solutions/19327; I found another somewhat
> helpful reference here: 
> https://blog.siphos.be/2015/05/audit-buffering-and-rate-limiting; though
> it doesn't make good recommendations for the kernel parameter sizing (if
> that is a good thing to do in RHEL 7/RHEL 8). -  Is there good relevance
> in RHEL 7, or RHEL 8 to adding this option to the grub/kernel
> commandline?-  Is there an upper-limit in setting the number? -  What is
> the correlation of this grub/kernel item, to the '-b ####' rule in
> /etc/audit/rules.d/audit.rules?  Are they (or should they be treated as)
> mutually exclusive? -  In the 2nd reference, what process do you suggest
> for me to determine optimal values for 'kernel.printk_ratelimit'  -and - 
> 'kernel.printk_ratelimit_burst', as well as for grub/kernel
> 'audit_backlog_limit=####' and audit.rules '-b ####'? -  This link also
> seems relevant to the sysctl param's valuations: 
> https://topic.alibabacloud.com/a/linux-system-log-__ratelimitn-callbacks-s
> uppressed_1_16_30164105.html-  Does values for 'kernel.printk_ratelimit =
> 1';   -and-   'kernel.printk_ratelimit_burst = 1024' seem reasonable?

I covered this topic here:

http://security-plus-data-science.blogspot.com/2017/05/a-suggested-change-for-rhel-7-disa-stig.html

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

