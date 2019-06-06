Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9A7375C9
	for <lists+linux-audit@lfdr.de>; Thu,  6 Jun 2019 15:56:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 603C42F8BDA;
	Thu,  6 Jun 2019 13:55:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 495727D67B;
	Thu,  6 Jun 2019 13:55:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 754A11833001;
	Thu,  6 Jun 2019 13:55:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x56DsM7Q019023 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 6 Jun 2019 09:54:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F07B1797F; Thu,  6 Jun 2019 13:54:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-122-18.rdu2.redhat.com [10.10.122.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06C7F6606B;
	Thu,  6 Jun 2019 13:54:19 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Auditd Troubleshooting
Date: Thu, 06 Jun 2019 09:54:19 -0400
Message-ID: <2858763.hD381QzqKc@x2>
Organization: Red Hat
In-Reply-To: <16ca40d7967a4a0198d1d2799c939349@XCGVAG30.northgrum.com>
References: <16ca40d7967a4a0198d1d2799c939349@XCGVAG30.northgrum.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 06 Jun 2019 13:56:27 +0000 (UTC)

On Thursday, June 6, 2019 9:31:41 AM EDT Boyce, Kevin P [US] (AS) wrote:
> Dear List,
> 
> It would be really great if there were an audit rule hit counter like many
> firewalls have when IP traffic passes through a filter rule.
> 
> This would be beneficial for finding rules that might not be working the as
> intended (to fix user implementation problems).
> 
> I'm thinking it would be a switch option on auditctl -l (maybe -h for
> hitcount).  This would list each rule that the kernel has, and how many
> times since auditd started that an event matched the rule.
> 
> Is this within the realm of feasibility?  Does this function exist maybe
> elsewhere in the audit suite (like aureport)?

Assuming that you put a key on each rule, you can get this functionality like 
this:

aureport --start boot --key --summary

And in cases where you have multiple rules with the same key, then add a 
number at the end like: time1, time2, time3, etc. Ausearch by default does 
partial word matching. So you can still run "ausearch -k time" and it will 
find all of them regardless of the number at the end.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
