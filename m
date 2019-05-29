Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D27F32E1C8
	for <lists+linux-audit@lfdr.de>; Wed, 29 May 2019 18:00:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB613F0D15;
	Wed, 29 May 2019 16:00:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 887AA379F;
	Wed, 29 May 2019 16:00:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DFD0206D2;
	Wed, 29 May 2019 15:59:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TFvthB002439 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 11:57:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA91C4A2; Wed, 29 May 2019 15:57:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-123-185.rdu2.redhat.com [10.10.123.185])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5776E5E1A2;
	Wed, 29 May 2019 15:57:51 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Segmentation fault in aureport's safe_print_string()
Date: Wed, 29 May 2019 11:57:48 -0400
Message-ID: <6902384.1OgFZbhT2i@x2>
Organization: Red Hat
In-Reply-To: <CAAYCcGAJax3OQ7s3pLpN-WEdiGv_9OfmGhztA0AJz8i=CRn2eQ@mail.gmail.com>
References: <CAAYCcGAJax3OQ7s3pLpN-WEdiGv_9OfmGhztA0AJz8i=CRn2eQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: Zephyr Pellerin <zephyr.pellerin@polyswarm.io>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 29 May 2019 16:00:41 +0000 (UTC)

Hello,

On Wednesday, May 22, 2019 4:08:06 PM EDT Zephyr Pellerin wrote:
> While running `aureport -tm', I recieved a segmentation fault, I won't be
> able to attach the core dump but I've tried include rudimentary information
> about the crash.

Out of curiosity, which version of the audit package is doing this? And what 
C library is aureport linked with? 

It looks like we have an unterminated string somewhere. IOW, it's picked this 
up somewhere and you're seeing the effect on output which isn't helpful. If 
this is reproducible, can you narrow down the event that is causing this by 
altering the start and end times to see if you can get it down to a couple 
events? That would be helpful if you can.

Thanks,
-Steve

> - Backtrace
> 
> 
>     #0  0x00007ff3d7bbf8a1 in __strlen_avx2 () from /lib64/libc.so.6
>     #1  0x000055b44a62f304 in safe_print_string ()
>     #2  0x000055b44a62dbd6 in print_per_event_item ()
>     #3  0x000055b44a62c709 in per_event_processing ()
>     #4  0x000055b44a62184c in process_log_fd ()
>     #5  0x000055b44a621c78 in process_logs ()
>     #6  0x000055b44a621597 in main ()




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
