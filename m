Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D370D2BB5B7
	for <lists+linux-audit@lfdr.de>; Fri, 20 Nov 2020 20:46:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-RU8u7SwSMi-jQ30GHBM_lQ-1; Fri, 20 Nov 2020 14:46:52 -0500
X-MC-Unique: RU8u7SwSMi-jQ30GHBM_lQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D89A4DB41;
	Fri, 20 Nov 2020 19:46:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF7655D6AD;
	Fri, 20 Nov 2020 19:46:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C41CF180954D;
	Fri, 20 Nov 2020 19:46:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKJkgkc024399 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 14:46:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 19A852026D47; Fri, 20 Nov 2020 19:46:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1519D2026D49
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 19:46:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B50ED10580C0
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 19:46:39 +0000 (UTC)
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-515--DJQNNW8PPK-z0e6EVzEEg-1; Fri, 20 Nov 2020 14:46:37 -0500
X-MC-Unique: -DJQNNW8PPK-z0e6EVzEEg-1
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	0AKJgqA2068285
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 11:42:54 -0800
Message-ID: <5FB81C79.9090103@tlinx.org>
Date: Fri, 20 Nov 2020 11:43:53 -0800
From: "L. A. Walsh" <linux-audit@tlinx.org>
User-Agent: Thunderbird
MIME-Version: 1.0
To: linux-audit@redhat.com
Subject: Identifying thread/process termination
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Repost from right address.
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

