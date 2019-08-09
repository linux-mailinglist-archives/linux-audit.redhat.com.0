Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CC388187
	for <lists+linux-audit@lfdr.de>; Fri,  9 Aug 2019 19:47:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A20E830031F3;
	Fri,  9 Aug 2019 17:47:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D732D5D6A0;
	Fri,  9 Aug 2019 17:47:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2EA97206CD;
	Fri,  9 Aug 2019 17:47:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x79HjXxV019586 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 13:45:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7F66F6012C; Fri,  9 Aug 2019 17:45:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-12.phx2.redhat.com [10.3.117.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00133600D1;
	Fri,  9 Aug 2019 17:45:22 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: [RFC] audit support for BPF notification
Date: Fri, 09 Aug 2019 13:45:21 -0400
Message-ID: <2985228.9kGasGrDWd@x2>
Organization: Red Hat
In-Reply-To: <20190809141831.GB9377@krava>
References: <20190809141831.GB9377@krava>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Stanislav Kozina <skozina@redhat.com>,
	Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
	Toke =?ISO-8859-1?Q?H=F8iland=2DJ=F8rgensen?= <toke@redhat.com>,
	Jiri Benc <jbenc@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>, Jiri Olsa <jolsa@redhat.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 09 Aug 2019 17:47:16 +0000 (UTC)

Hello,

On Friday, August 9, 2019 10:18:31 AM EDT Jiri Olsa wrote:
> I posted initial change that allows auditd to log BPF program
> load/unload events, it's in here:
>   https://github.com/linux-audit/audit-userspace/pull/104

Thanks for the patch...but we probably should have talked a bit more before 
undertaking this effort. We normally do not audit from user space what happens 
in the kernel. Doing this can be racy and it keeps auditd from doing the one 
job it has - which is to grab events and record them to disk and send them 
out the realtime interface.


> We tried to push pure AUDIT interface for BPF program notification,
> but it was denied, the discussion is in here:
>   https://marc.info/?t=153866123200003&r=1&w=2

Hmm. The email I remember was here:
https://www.redhat.com/archives/linux-audit/2018-October/msg00053.html

and was only 2 emails long with no answer to my question. :-)

> The outcome of the discussion was to use perf event interface
> for BPF notification and use it in some deamon.. audit was our
> first choice.
> 
> thoughts?

I'd like to understand what the basic problem is that needs to be solved.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
