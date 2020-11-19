Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 44F902B9AED
	for <lists+linux-audit@lfdr.de>; Thu, 19 Nov 2020 19:53:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605811989;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lrdNCglCIUbSNT/MaOGC7HuqFTfnrMCwqrX5ZeAK9KM=;
	b=LRGiig6fm8bxoHkOsyrkKlr8qdDLydL6fGs93gzJFCQhG5sXcecE1XJ2RLzKABP1TSfGH0
	ZPr93rNkZIDNdPLhkG6y40eyasjODlIGKbv/rznkTUY+ZjPEOMiGtBk8+6efWVUJAebNuX
	DggWK3ENKcFiMJGodmBQD8NYKqKbSok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-k2xJAgXMPbKkwCcNVt40JQ-1; Thu, 19 Nov 2020 13:53:05 -0500
X-MC-Unique: k2xJAgXMPbKkwCcNVt40JQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BDE5E75C;
	Thu, 19 Nov 2020 18:52:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6EFF60843;
	Thu, 19 Nov 2020 18:52:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 68BA0180954D;
	Thu, 19 Nov 2020 18:52:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AJIqqjB029754 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 19 Nov 2020 13:52:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D01785C1D5; Thu, 19 Nov 2020 18:52:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-44.rdu2.redhat.com [10.10.116.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 560BB5C1D1;
	Thu, 19 Nov 2020 18:52:49 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux-audit@redhat.com, Andreas Hasenack <andreas@canonical.com>
Subject: Re: -a never,exit still being logged
Date: Thu, 19 Nov 2020 13:52:47 -0500
Message-ID: <5560785.MhkbZ0Pkbq@x2>
Organization: Red Hat
In-Reply-To: <CANYNYEEYUsU8BGj7E+=T=jyrkxVn1x60qipf8rvk1Oi6DPquyg@mail.gmail.com>
References: <CANYNYEEYUsU8BGj7E+=T=jyrkxVn1x60qipf8rvk1Oi6DPquyg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, November 19, 2020 1:43:34 PM EST Andreas Hasenack wrote:
> Hi,
> 
> continuing my experiments in trying to reduce the auditd noise, I have
> these two rules:
> 
> # auditctl -l
> -a never,exit -F arch=b64 -S setsockopt -F a2=0x40 -F
> exe=/sbin/iptables -F auid=-1
> -a never,exit -F arch=b64 -S setsockopt -F a2=0x40 -F
> exe=/sbin/xtables-multi -F auid=-1
> 
> I did use -F auid=4294967295 in the rules file, and auditd seems to
> have understood that correctly as it's showing -1 in the rules list.
> 
> But this event is still being logged:
> type=NETFILTER_CFG msg=audit(1605810940.198:1089): table=filter
> family=2 entries=281
> type=SYSCALL msg=audit(1605810940.198:1089): arch=c00000b7 syscall=208
> success=yes exit=0 a0=4 a1=0 a2=40 a3=aaaaf478e680 items=0 ppid=7950
> pid=31235 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0
> sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="iptables-restor"
> exe="/sbin/xtables-multi" key=(null)
> type=PROCTITLE msg=audit(1605810940.198:1089):
> proctitle=69707461626C65732D726573746F7265002D2D6E6F666C757368002D2D7665726
> 26F7365002D2D77616974003130002D2D776169742D696E74657276616C003530303030
> 
> Same event, decoded with ausearch -i:
> ----
> type=PROCTITLE msg=audit(11/19/20 18:35:40.198:1089) :
> proctitle=iptables-restore --noflush --verbose --wait 10
> --wait-interval 50000
> type=SYSCALL msg=audit(11/19/20 18:35:40.198:1089) : arch=aarch64
> syscall=setsockopt success=yes exit=0 a0=0x4 a1=ip
> a2=IPT_SO_SET_REPLACE a3=0xaaaaf478e680 items=0 ppid=7950 pid=31235
> auid=unset uid=root gid=root euid=root suid=root fsuid=root egid=root
> sgid=root fsgid=root tty=(none) ses=unset comm=iptables-restor
> exe=/sbin/xtables-multi key=(null)
> type=NETFILTER_CFG msg=audit(11/19/20 18:35:40.198:1089) :
> table=filter family=ipv4 entries=281
> ----
> 
> Why is it being logged, given that it matches the second (and last) rule I
> have?

These two events are considered kernel configuration changes. Which means that 
they do not originate via the SYSCALL rule engine. The -a never,exit 
technique works only when the event is generated as a result of other SYSCALL 
rules. Normally you would place that higher up so it matches first.

In this case, what you would want to do is suppress it using the exclude 
filter:

-a always,exclude -F msgtype=NETFILTER_CFG

That should fix it.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

