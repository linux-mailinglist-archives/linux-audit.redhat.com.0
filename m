Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5892B448E
	for <lists+linux-audit@lfdr.de>; Mon, 16 Nov 2020 14:16:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-4EywWUTxNl2_iFqE3z5kSg-1; Mon, 16 Nov 2020 08:16:22 -0500
X-MC-Unique: 4EywWUTxNl2_iFqE3z5kSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52CB3188C12C;
	Mon, 16 Nov 2020 13:16:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A891A1975F;
	Mon, 16 Nov 2020 13:16:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81FFC5811B;
	Mon, 16 Nov 2020 13:16:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AG6kUrf026396 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 01:46:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9CB862156A39; Mon, 16 Nov 2020 06:46:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93C5E2157F5D
	for <linux-audit@redhat.com>; Mon, 16 Nov 2020 06:46:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 392E4185A78B
	for <linux-audit@redhat.com>; Mon, 16 Nov 2020 06:46:28 +0000 (UTC)
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-502-7VOgU_wkN2CDWQ5snv_EWg-1; Mon, 16 Nov 2020 01:46:25 -0500
X-MC-Unique: 7VOgU_wkN2CDWQ5snv_EWg-1
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	0AG6fA2W088600; Sun, 15 Nov 2020 22:41:12 -0800
Message-ID: <5FB21F35.4070309@tlinx.org>
Date: Sun, 15 Nov 2020 22:41:57 -0800
From: "L. A. Walsh" <lkml@tlinx.org>
User-Agent: Thunderbird
MIME-Version: 1.0
To: Lenny Bruzenak <lenny@magitekltd.com>
Subject: Re: Identifying thread/process termination
References: <CAPErmPdDACGemKqTrUk4xKNBwnoj6FEeWbsvmk7jS0TjOyaOqg@mail.gmail.com>
	<5549003.MhkbZ0Pkbq@x2>
	<CAHC9VhThN4R7jsukKrmjVG=6Rm07jWwjcNQ5CS4v6JzMh+NQbg@mail.gmail.com>
	<1c3736b4-c72e-fc87-90af-3d336a8a6c64@magitekltd.com>
In-Reply-To: <1c3736b4-c72e-fc87-90af-3d336a8a6c64@magitekltd.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 16 Nov 2020 08:16:00 -0500
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 2020/10/08 08:33, Lenny Bruzenak wrote:
> On 10/7/20 7:27 PM, Paul Moore wrote:
>
>   
>> Almost everywhere in the kernel we record the TGID for the "pid="
>> values and not the actual task/thread ID.  That decision was made
>> before my heavy involvement with audit, but my guess is that most
>> audit users are focused more on security relevant events at the
>> process level, not the thread level.  After all, there isn't really
>> much in the way of significant boundaries between threads.
>>     
>
> That's right, Paul. The process (exe/comm) is the discriminator from a 
> security perspective.
>   
----
  So, when different threads perform / execute different functionality
as loaded by a runtime loadable libraries, how is that discriminated
from the initially started program?

  Often, programs with many threads will rename the threads so they
show up differently, though some of those may be processes, on linux
there really aren't any threads as being separate from processes -- i.e.
threads, at the linux kernel level are built on processes AFAIK.  Either
way, there can be a separation of what is executed based on what threads
are assigned what purposes.  I'd be hesitant to label the exe/comm as
the only discriminator in an "arbitrary target environment".  Certainly
it can be in some, but that doesn't mean it has to be sole discriminator
when different threads can be mapped to different functions in
1 starting binary.

  In a similar way, coreutils, can be used as 1 library/binary where
functionality is determined by the invoking name.  While coreutils uses
separate names for each function, there's nothing stopping creating
1 binary with all functions launched in separate threads launched out of
  some shell performing diverse functions based on a thread ID or name.
Certainly it isn't the common case, but it would be a way for a hacker
to make their actions more opaque given current limitations.  At the
same time, it might be the way to create some type of 'all-in-one' shell
that could be configured by runtime presence of loadable objects.

  An audit system supporting appending of arbitrary data types could
support appending new data items/types as needed for extension.  Such
was the Irix audit system that was ported to sgi's linux before the
project was cancelled. It had similar benefits to the various layers and
protocols that have been added on top of IPv4 networking, with wrappers
around the low-level IP layer being added as new protocols demanded.

  Just saying, a case can be made for needed additions not originally
planned -- something that is almost always needed in time.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

