Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 387C7995F9
	for <lists+linux-audit@lfdr.de>; Thu, 22 Aug 2019 16:10:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F97D3058DAA;
	Thu, 22 Aug 2019 14:10:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC8E51001B33;
	Thu, 22 Aug 2019 14:10:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D83CD1802217;
	Thu, 22 Aug 2019 14:10:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7M7MD9h009917 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 22 Aug 2019 03:22:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 010981001B20; Thu, 22 Aug 2019 07:22:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B842F100195F;
	Thu, 22 Aug 2019 07:22:10 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C058308123B;
	Thu, 22 Aug 2019 07:22:09 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id CE148C189EDC0E632B6D;
	Thu, 22 Aug 2019 15:22:06 +0800 (CST)
Received: from [127.0.0.1] (10.119.195.53) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Thu, 22 Aug 2019
	15:21:58 +0800
Subject: Re: [Question] audit_names use after delete in audit_filter_inodes
To: Paul Moore <paul@paul-moore.com>
References: <4997df37-4a80-5cf5-effc-0a6f040c4528@huawei.com>
	<CAHC9VhS_DCBRX6kkmiSYBzq+ELN2AYRypRN6vR_J1+JOi2FDvw@mail.gmail.com>
From: Chen Wandun <chenwandun@huawei.com>
Message-ID: <ce8efa9d-f2b6-5adc-0442-c73e632c6903@huawei.com>
Date: Thu, 22 Aug 2019 15:22:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAHC9VhS_DCBRX6kkmiSYBzq+ELN2AYRypRN6vR_J1+JOi2FDvw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.119.195.53]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Thu, 22 Aug 2019 07:22:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Thu, 22 Aug 2019 07:22:10 +0000 (UTC) for IP:'45.249.212.190'
	DOMAIN:'szxga04-in.huawei.com' HELO:'huawei.com'
	FROM:'chenwandun@huawei.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.190 szxga04-in.huawei.com
	45.249.212.190 szxga04-in.huawei.com <chenwandun@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 22 Aug 2019 10:10:14 -0400
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 22 Aug 2019 14:10:39 +0000 (UTC)



On 2019/8/21 23:36, Paul Moore wrote:
> On Wed, Aug 21, 2019 at 5:31 AM Chen Wandun <chenwandun@huawei.com> wrote:
>>
>> Hi,
>> Recently, I hit a use after delete in audit_filter_inodes,
> 
> ...
> 
>> the call stack is below:
>> [321315.077117] CPU: 6 PID: 8944 Comm: DefSch0100 Tainted: G           OE  ----V-------   3.10.0-327.62.59.83.w75.x86_64 #1
>> [321315.077117] Hardware name: OpenStack Foundation OpenStack Nova, BIOS rel-1.8.1-0-g4adadbd-20170107_142945-9_64_246_229 04/01/2014
> 
> It looks like this is a vendor kernel and not an upstream kernel, yes?

I analysed the upstream kernel about audit, and found there is no significant change
in audit_names add/read/delete since v3.10.

audit_names could be delete in __audit_syscall_exit, do_exit, copy_process
on upstream kernel(same as v3.10).

if we are reading audit_names, such as
	__audit_syscall_exit
		audit_filter_inodes
			read each audit_names ...
			

is there any situation could delete audit_names at the same time?

>   Assuming that is the case I would suggest you contact your distro for
> help/debugging/support; we simply don't know enough about your kernel
> (what patches are included, how was it built/configured/etc.) to
> comment with any certainty.
> 
> Linux Kernels based on v3.10.0 are extremely old from an upstream
> perspective, with a number of fixes and changes to the audit subsystem
> since v3.10.0 was released.  If you see the same problem on a modern
> upstream kernel please let us know, we'll be happy to help.
> 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
