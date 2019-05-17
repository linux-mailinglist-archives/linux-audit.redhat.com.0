Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CD821898
	for <lists+linux-audit@lfdr.de>; Fri, 17 May 2019 14:46:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 608DC3078AB6;
	Fri, 17 May 2019 12:46:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BBE0348CE;
	Fri, 17 May 2019 12:45:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A7B424AFA;
	Fri, 17 May 2019 12:45:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HCi8GD017502 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 08:44:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6026810027B8; Fri, 17 May 2019 12:44:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-122-145.rdu2.redhat.com [10.10.122.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BBF710027B7;
	Fri, 17 May 2019 12:44:05 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: useradd question
Date: Fri, 17 May 2019 08:44:04 -0400
Message-ID: <1666978.mmmlVrCjaM@x2>
Organization: Red Hat
In-Reply-To: <d3d7fc57-c368-9d01-aae5-cb5469cd2334@magitekltd.com>
References: <d3d7fc57-c368-9d01-aae5-cb5469cd2334@magitekltd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: "Linux-audit@redhat.com" <Linux-audit@redhat.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 17 May 2019 12:46:39 +0000 (UTC)

On Thursday, May 16, 2019 7:00:38 PM EDT Lenny Bruzenak wrote:
> If I add a new user with the "useradd" utility, it submits a ADD_USER
> event, but the event itself has no interpretation for the new UID.

What exactly was typed in at the command line? This is caused by this line of 
code:

https://github.com/linux-audit/audit-userspace/blob/master/lib/
audit_logging.c#L480

The idea is that we want to rely on the number rather than the name. However, 
the log event is supposed to be created after passwd and shadow have been 
updated. So, the audit daemon should be able to resolve the event. 

Maybe useradd needs to be straced to see if it does everything in one shot or 
if it sends multiple events as it builds the user.
 
> IOW, the "id" field is numeric and the translated data at the end of the
> raw record has "ID=unknown(number)".
> 
> I'm guessing it is because until the user data has been successfully
> entered, there is no translation. Perhaps the event submission should
> wait until that happens?

I'd say strace useradd will have the answer.

> I may be able to dig out the name from other related generated events,
> but that is kind of a pain.

Right. Let's see what the root cause is and then what we can do about it.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
