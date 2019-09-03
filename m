Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4DA7620
	for <lists+linux-audit@lfdr.de>; Tue,  3 Sep 2019 23:25:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF3C48AC6FD;
	Tue,  3 Sep 2019 21:24:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E2095C219;
	Tue,  3 Sep 2019 21:24:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 915201802216;
	Tue,  3 Sep 2019 21:24:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83LOiIv027715 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 17:24:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92A7F5D6C8; Tue,  3 Sep 2019 21:24:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-151.phx2.redhat.com [10.3.117.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AA965D6B2;
	Tue,  3 Sep 2019 21:24:42 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Help with audit syscall event output
Date: Tue, 03 Sep 2019 17:24:39 -0400
Message-ID: <12155994.AWt580abvh@x2>
Organization: Red Hat
In-Reply-To: <CAG-5c_G5ULcbh_TEZEefm0VM8XeDW=OJoLBVRq+1=VO-BtMczA@mail.gmail.com>
References: <CAG-5c_G5ULcbh_TEZEefm0VM8XeDW=OJoLBVRq+1=VO-BtMczA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Tue, 03 Sep 2019 21:24:49 +0000 (UTC)

On Tuesday, September 3, 2019 5:15:29 PM EDT Ankitha Kundhuru wrote:
> Any help is greatly appreciated.
> 
> My piece of code can read audit.log file and process it.But when I enable
> good number of syscalls, disk gets filled really quick (15GB for half a day
> usage)
> I wanted to know if there is a way to directly get the events from
> userspace audit daemon instead of writing it to a file. Plan is that my
> application should process the events as soon as they are created.

Yes, there is a presentation that describes the architecture of the audit 
system including the realtime event interface:

http://people.redhat.com/sgrubb/audit/audit_ids_2011.pdf

And there is sample code for a plugin here:

https://github.com/linux-audit/audit-userspace/tree/master/contrib/plugin

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
