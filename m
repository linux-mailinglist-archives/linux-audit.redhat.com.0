Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EE7151D1B89
	for <lists+linux-audit@lfdr.de>; Wed, 13 May 2020 18:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589388469;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qvTAlMAygNe2D8LaiCTpT0GSO6LfXBtKrfYfIQw0ayk=;
	b=Vzsuwcd1QNcBr/jvsYHnPXAoIUvwfaDgB5Xo+xmHbcmGZjof7b2ny3fLBghKph0AeYuOjk
	0+2vxtrFEgBZhXXsz59mUkbMpX7QioIp0FaCwpytuaOMahwZRKzn4jL7juzQd4tl3q1bJp
	LFGRRN2D18DnQlEWmxo7YP1EH4Cdz/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-ASsyx3OJNC-RMfK91L8WQw-1; Wed, 13 May 2020 12:47:47 -0400
X-MC-Unique: ASsyx3OJNC-RMfK91L8WQw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 328C4835B43;
	Wed, 13 May 2020 16:47:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8265260FB9;
	Wed, 13 May 2020 16:47:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 44F6F4E561;
	Wed, 13 May 2020 16:47:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DGlK70009202 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 12:47:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C58B32156A4F; Wed, 13 May 2020 16:47:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AB3F2166BA3
	for <linux-audit@redhat.com>; Wed, 13 May 2020 16:47:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED4BB8008A3
	for <linux-audit@redhat.com>; Wed, 13 May 2020 16:47:16 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
	[209.85.219.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-69-kwiOm2BFOj2f2mA5tHDzwA-1; Wed, 13 May 2020 12:47:10 -0400
X-MC-Unique: kwiOm2BFOj2f2mA5tHDzwA-1
Received: by mail-qv1-f45.google.com with SMTP id ep1so237463qvb.0;
	Wed, 13 May 2020 09:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:mime-version:subject:from:in-reply-to
	:date:cc:content-transfer-encoding:message-id:references:to;
	bh=NXYOXm5CtPrTq4iIUYUL4A6hKQLmS/YdnnN8pd/4NsE=;
	b=seKLDsSLKtwukaVFn66OTMyLGriwgRBJHY1YzVgShtUv7NteiN2a4tcuLyXuUS/JqU
	ObzvTl3EgkUsMyn7qPy0s2qUt6ubRcSKX1grHiwcpR8IZmwfABlBsuE3SlQfbIo2+58U
	e7Mi0ADvtvOgqgyRoflQixp81pLhoaqJUWcKZbKGxa8PIo3nifJKl6dbaMTK08nyM3tq
	zzXINDR33IlsQQfIbBBr7HvjEF2FOxXunyRxshN1gXqrZyMTkgLYqWj9H8BqyoWfLxhD
	dE7ZzYRN7qbgABlRAUJJcfHCuy4TB4jOHs+k+rLxxsOwtKVLkyavDOP9QvcSGc4Qf+eA
	gVzQ==
X-Gm-Message-State: AOAM530an7FmrFNjn9hZ6J9CLlELCVQ9WE4Hq/rhT/wo1P/ZKqIUy7GU
	8Uxg0Cabtpk06keCSD3qUsJgpMC5QBs=
X-Google-Smtp-Source: ABdhPJxsgwoP9IG4s4tEoXWx1q/a6x2EB0GgjsTBJXfgUo0CbYVT6wUHXlce3GtMvvWvvUEbD1cqZQ==
X-Received: by 2002:a0c:eb49:: with SMTP id c9mr532878qvq.123.1589388429179;
	Wed, 13 May 2020 09:47:09 -0700 (PDT)
Received: from [192.168.20.239] ([136.49.78.73])
	by smtp.gmail.com with ESMTPSA id
	a194sm302368qkb.21.2020.05.13.09.47.07
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2020 09:47:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: reactive audit proposal
From: Joe Nall <joe@nall.com>
In-Reply-To: <1718624.Kgxutyrx4h@x2>
Date: Wed, 13 May 2020 11:47:07 -0500
Message-Id: <F2185CAB-D941-43EF-B04B-C9BE6D203C5E@nall.com>
References: <6360160.ZmnOHIC0Qm@x2>
	<DBCA4F02-8F41-4585-89B7-EB2E2AE481D6@nall.com> <1718624.Kgxutyrx4h@x2>
To: Steve Grubb <sgrubb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04DGlK70009202
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On May 12, 2020, at 7:36 PM, Steve Grubb <sgrubb@redhat.com> wrote:
> 
> On Tuesday, May 12, 2020 8:31:45 PM EDT Joe Nall wrote:
>>> On May 12, 2020, at 7:22 PM, Steve Grubb <sgrubb@redhat.com> wrote:
>>> 
>>> Hello,
>>> 
>>> I wanted to run this by the crowd to see what people's reaction might be.
>>> 
>>> The audit system sometimes needs to have rules applied when something
>>> happens. For example, if someone plugs in a USB flash drive, the system
>>> creates the device in /dev and then automatically mounts it under some
>>> circumstances.
>>> 
>>> I would propose 2 new additions to the audit rule syntax: on-mount and
>>> on-login.These rules would be in a separate file from the main audit
>>> rules. When a file system is mounted, /proc/mounts changes and the mount
>>> table can be scanned to see if something new is there. In this way we
>>> can reliably detect newly mounted filesystems. We can then match against
>>> a specifier to see if this is a file system in which we want to apply
>>> new rules. If so, we send the new rules to the kernel. When the device
>>> is unmounted, the kernel drops all watches on that file system. So, we
>>> only need to worry about when a device is mounted.
>>> 
>>> This works good for anything that gets mounted. But it is also possible
>>> for a USB flash drive to be accessed as a block device, such as the dd
>>> utility. If we had to detect device discovery, there is a netlink group,
>>> NETLINK_KOBJECT_UEVENT which we could monitor for events. The only thing
>>> is that we could only detect open/read/write/close/ioctl/lseek. And we
>>> probably do not want to monitor anything except block devices.
>>> 
>>> It may also be possible to poll /sys/block to watch for changes. This
>>> might be easier as the names are more friendly. This would take some
>>> research to see if its even possible.
>>> 
>>> The rule syntax could look something like:
>>> on=mount mount=/run/user/1000 : -a exit,always ...
>>> on=device device=/dev/sdd : -a exit,always ...
>>> 
>>> The on-login event would simply watch the audit trail for any AUDIT_LOGIN
>>> events. That event can be parsed to get the new auid. If the auid matches
>>> any rules, then it will load them into the kernel. To remove the rules,
>>> we
>>> could watch for the AUDIT_USER_END event. The only issue is that we would
>>> need to track how many sessions the user has open and remove the rules
>>> only when the last session closes out.
>>> 
>>> The rules for this might look something like this:
>>> on=login auid=1000 : -a exit,always ...
>>> 
>>> The question is whether or not this should be done as part of the audit
>>> daemon or as a plugin for the audit daemon. One advantage of doing this
>>> as
>>> a plugin is that it will keep the audit daemon focused on getting events
>>> and distributing them. Any programming mistake in the plugin will crash
>>> it
>>> and not the daemon. The tradeoff is that it will get the event slightly
>>> after auditd sees it. This only matters for the on-login functionality.
>>> The device and mount events come from an entirely different source. And
>>> I'm sure that in every case, the program will react faster than a user
>>> possibily can winning the race evry time.
>>> 
>>> Thoughts?
>> 
>> Would bind mounts trigger these rules? I'm sitting next to a box with 10k
>> polyinstantiated bind mounts right now.
> 
> If you do cat /proc/mounts do you see 10k entries?
No. This is over many users and applications launched with different contexts.

This morning, on a machine with one user, as a permissive root/sysadm_t:
cat /proc/*/mounts | grep inst | wc -l
2046
and from a user terminal session:
cat /proc/mounts | wc -l
218

> And do you want them or do you think they are harmful?

I thought they were all intentional when I started typing, but you have sent me down a rabbit hole looking into this :(

I like this idea, I just want to make sure that our atypical use case does not break it or vice versa.

cheers,
joe

> 
> -Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

