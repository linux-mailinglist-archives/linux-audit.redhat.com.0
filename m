Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2023297D33
	for <lists+linux-audit@lfdr.de>; Wed, 21 Aug 2019 16:38:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4CF13058DAA;
	Wed, 21 Aug 2019 14:38:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 007126CE48;
	Wed, 21 Aug 2019 14:38:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0959E24F30;
	Wed, 21 Aug 2019 14:38:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7L9W0fQ031323 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 21 Aug 2019 05:32:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4805D5B0A1; Wed, 21 Aug 2019 09:32:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A5175B091;
	Wed, 21 Aug 2019 09:31:50 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4255710F23E1;
	Wed, 21 Aug 2019 09:31:48 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id B9D67FB12728DFC5AF07;
	Wed, 21 Aug 2019 17:31:45 +0800 (CST)
Received: from [127.0.0.1] (10.119.195.53) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Wed, 21 Aug 2019
	17:31:35 +0800
To: <linux-kernel@vger.kernel.org>, <linux-audit@redhat.com>,
	<paul@paul-moore.com>, <eparis@redhat.com>
From: Chen Wandun <chenwandun@huawei.com>
Subject: [Question] audit_names use after delete in audit_filter_inodes
Message-ID: <4997df37-4a80-5cf5-effc-0a6f040c4528@huawei.com>
Date: Wed, 21 Aug 2019 17:32:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.119.195.53]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.66]); Wed, 21 Aug 2019 09:31:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Wed, 21 Aug 2019 09:31:49 +0000 (UTC) for IP:'45.249.212.35'
	DOMAIN:'szxga07-in.huawei.com' HELO:'huawei.com'
	FROM:'chenwandun@huawei.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.35 szxga07-in.huawei.com
	45.249.212.35 szxga07-in.huawei.com <chenwandun@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 21 Aug 2019 10:37:57 -0400
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 21 Aug 2019 14:38:18 +0000 (UTC)

Hi,
Recently, I hit a use after delete in audit_filter_inodes,

In this case, I found audit_names->list->next is dead000000000100, when enumerate each
audit_names on list context->names_list.

void audit_filter_inodes(struct task_struct *tsk, struct audit_context *ctx)
{
         struct audit_names *n;

         if (audit_pid && tsk->tgid == audit_pid)
                 return;

         rcu_read_lock();

         list_for_each_entry(n, &ctx->names_list, list) {
                 if (audit_filter_inode_name(tsk, n, ctx))
                         break;
         }
         rcu_read_unlock();
}

it seem like the audit_names was already delete from context->names_list.

In source code, there is no any protection on context->names_list when read and write,
is there any race in read and write?

Unfortunately, there is no way to reproduce it.

the call stack is below:
[321315.077117] CPU: 6 PID: 8944 Comm: DefSch0100 Tainted: G           OE  ----V-------   3.10.0-327.62.59.83.w75.x86_64 #1
[321315.077117] Hardware name: OpenStack Foundation OpenStack Nova, BIOS rel-1.8.1-0-g4adadbd-20170107_142945-9_64_246_229 04/01/2014
[321315.113772] task: ffff8804061c4500 ti: ffff8804021d8000 task.ti: ffff8804021d8000
[321315.113772] RIP: 0010:[<ffffffff8110f038>]  [<ffffffff8110f038>] audit_filter_inodes+0x68/0x130
[321315.113772] RSP: 0018:ffff8804021dbef0  EFLAGS: 00010297
[321315.113772] RAX: ffff88040632aa48 RBX: ffff88040632a800 RCX: 000000000000000a
[321315.113772] RDX: 00000000000000c0 RSI: ffff88040632a800 RDI: ffff8804061c4500
[321315.132068] RBP: ffff8804021dbf40 R08: 0000000000000000 R09: 0000000000000000
[321315.132068] R10: 00007fd38197ac00 R11: 0000000000000206 R12: dead000000000100
[321315.132068] R13: ffff8804061c4500 R14: 00000000ffffffff R15: ffff88040632a800
[321315.132068] FS:  00007fd38197b700(0000) GS:ffff88053c380000(0000) knlGS:0000000000000000
[321315.132068] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[321315.132068] CR2: 00007fe48936d156 CR3: 0000000098b50000 CR4: 00000000001407e0
[321315.149373] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[321315.149373] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
[321315.149373] Stack:
[321315.149373]  ffff88040632aa48 ffff8804061c4500 ffff8804021dbf78 ffffffff819a6260
[321315.149373]  00000000aefb5477 ffff88040632a800 00007fd3d6e80690 ffff8804061c4500
[321315.149373]  00007fd38197ac70 00007fd3f218d008 ffff8804021dbf78 ffffffff8110f7d5
[321315.149373] Call Trace:
[321315.149373]  [<ffffffff8110f7d5>] __audit_syscall_exit+0x245/0x280
[321315.149373]  [<ffffffff8165316b>] sysret_audit+0x17/0x21
[321315.149373] Code: 84 be 00 00 00 4d 8b a7 48 02 00 00 49 8d 87 48 02 00 00 48 89 45 b0 49 39 c4 0f 84 a3 00 00 00 41 be ff ff ff ff 0f 1f 44 00 00 <49> 8b 44 24 20 83 e0 1f 48 c1 e0 04 4c 8d a8 e0 5e df 81 48 8b
[321315.149373] RIP  [<ffffffff8110f038>] audit_filter_inodes+0x68/0x130
[321315.149373]  RSP <ffff8804021dbef0>
[321315.196242] ---[ end trace e1b43c8e59447f0a ]---

I am unfamiliar with audit. I will be appreciated if you could give me some suggestion.

Thanks
ChenWandun

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
