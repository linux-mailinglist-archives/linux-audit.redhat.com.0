Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CF63113422
	for <lists+linux-audit@lfdr.de>; Fri,  3 May 2019 21:46:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D0C23079B65;
	Fri,  3 May 2019 19:46:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27FF119C59;
	Fri,  3 May 2019 19:46:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE27941F3C;
	Fri,  3 May 2019 19:46:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x43Ji0xJ006828 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 May 2019 15:44:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E11DB1798E; Fri,  3 May 2019 19:44:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-124-120.rdu2.redhat.com [10.10.124.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A69A1898A;
	Fri,  3 May 2019 19:43:56 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: auid = unset
Date: Fri, 03 May 2019 15:43:49 -0400
Message-ID: <1792452.mJhBpEhCa1@x2>
Organization: Red Hat
In-Reply-To: <MWHP100MB022241AAEC6251F1F37A6B34F2350@MWHP100MB0222.NAMP100.PROD.OUTLOOK.COM>
References: <MWHP100MB022241AAEC6251F1F37A6B34F2350@MWHP100MB0222.NAMP100.PROD.OUTLOOK.COM>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Fri, 03 May 2019 19:46:27 +0000 (UTC)

On Friday, May 3, 2019 3:31:39 PM EDT Joshua Ammons wrote:
> Hello, I just wanted to see if anyone has had much success with configuring
> redhat systems to reduce and/or eliminate the occurrence of auid = unset
> in the audit events?

auid = unset is a natural thing. Typically it indicates that a daemon has 
tripped over an audit rule. If you are seeing auid = unset by actions that 
you know a user caused, then you really want to find out how they logged in. 
You may have an entry point daemon that is not audit friendly. For example, 
login, sshd, gdm, kdm have all be modified to call the audit_setloginuid90 
function.


> I found the following redhat article that provides a
> fix by updating a grub setting for auditd but this doesn't seem to have
> much of an effect, as I still see large number of unset values in the
> logs.

It does. But maybe not how you think it would. You need to boot with audit=1 
and audit_backlog_limit=8192 (or some number). The first setting makes sure 
that every process that gets launched is auditable. If this is not set, then 
there can be processes that would cause audit events but will never ever be 
detected. So, this is important. The second setting ensures that backlog is 
big enough to hold events until the audit daemon starts. Otherwise you can 
lose some events during boot.

> https://access.redhat.com/solutions/971883
> 
> Thank you in advance for any information you may have on this.

Check you events and see what process is causing them:

ausearch --start today --loginuid unset --raw | aureport -x --summary

See if this is mostly daemons or scripts run on behalf of daemons. The fix 
might be to alter the audit rules to avoid daemon activity. This is what the 
-F auid>=1000 -F auid!=unset does in the shipped sample rules. And this is 
completely expected that daemon activity auid == unset.

If these are from user sessions, check how they get into the system. 
Something seems wrong there. 

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
