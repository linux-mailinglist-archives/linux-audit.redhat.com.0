Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C04AF3195AC
	for <lists+linux-audit@lfdr.de>; Thu, 11 Feb 2021 23:15:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613081750;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JHb2PjZa5GOeXj2NhFtXWJ57fS3o3hyjkVUaq9rPRW4=;
	b=ika9aQWRxJECu76vn6/bbbuFTkPMem1Xwb5+dqFows1VB7Gpmcj/HPWvsQ0n4WzKTvdIgs
	W+dqVbnVzVaxkgF8uPGq32+tn65KaQkp4qbfBYyB+UW14jsBwCZw/7lQcjSEnXnRGO1XXa
	zhm/UCfjvw0ylCcWu7k/unMW05SpfDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-nOUJ7pjQPkyTDPR2fCFmww-1; Thu, 11 Feb 2021 17:15:48 -0500
X-MC-Unique: nOUJ7pjQPkyTDPR2fCFmww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B60AD107ACE3;
	Thu, 11 Feb 2021 22:15:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E5EA6F99D;
	Thu, 11 Feb 2021 22:15:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A9594E58D;
	Thu, 11 Feb 2021 22:15:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11BMEo3I001619 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 11 Feb 2021 17:14:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 263A95D764; Thu, 11 Feb 2021 22:14:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-118-15.rdu2.redhat.com [10.10.118.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC7CA5D76F;
	Thu, 11 Feb 2021 22:14:46 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Alan Evangelista <alan.vitor@gmail.com>
Subject: Re: Samba and AuditD
Date: Thu, 11 Feb 2021 17:14:44 -0500
Message-ID: <1818319.taCxCBeP46@x2>
Organization: Red Hat
In-Reply-To: <CAKz+TUt3ECMNcbbUziVfeCuhy42R19Z+bi8R+Pj38Lee=pZhUA@mail.gmail.com>
References: <CAKz+TUvuOh849j=CaM=OjH1dwbr0bocM6_gdGO-i-wA2-bkr5g@mail.gmail.com>
	<2316118.jE0xQCEvom@x2>
	<CAKz+TUt3ECMNcbbUziVfeCuhy42R19Z+bi8R+Pj38Lee=pZhUA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

Moderating System still messed up today...

On Wednesday, February 10, 2021 6:57:28 PM EST Alan Evangelista wrote:
> SG>  The Linux kernel has no idea who the user is in the
> Windows machine since they're not really logged in. This applies to all
> remote files systems.
> 
> I thought that any filesystem operation requested by a user in Windows
> would necessarily be executed by some user in Linux in the end (either a
> generic user such as samba or, in my specific case, the Linux user which is
> mapped to the MS Active Directory user by Centrify). After all, the
> filesystem is managed by Linux. Is that assumption incorrect?

Maybe. It depends on the implementation. If its all in the kernel, then 
probably not. This is the case with several file systems such as NFS. If the 
file system is served from user space then you may get events. I have heard of 
some file system servers opening the device and using it directly.

Basically, if you can strace the daemon and see it accessing the file system 
with the sycalls you expect, then the kernel's audit engine can capture the 
access but won't know who to attribute it to.

-Steve

> On Wed, Feb 10, 2021 at 6:26 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > Hello,
> > 
> > Moderator system is acting up. But it'll go through eventually.
> > 
> > On Wednesday, February 10, 2021 3:41:45 PM EST Alan Evangelista wrote:
> > > I have installed audit 2.8.5 on a CentOS 7 and set up the following
> > > rule
> > 
> > in
> > 
> > > /etc/audit/rules.d/audit.rules:
> > > 
> > > -w /data
> > > 
> > > /data is shared via Samba to a Windows Server 2016 system. If I write
> > > to
> > > /data in the CentOS7 system, I get the open syscall event in the auditd
> > > log. If I write to the same directory in the Windows Server 2016, I see
> > 
> > the
> > 
> > > file in the /data directory in the CentOS7 system, but the event is not
> > > logged by audit. Is that the expected behavior?
> > 
> > Unfortunately, yes. The Linux kernel has no idea who the user is in the
> > Windows machine since they're not really logged in. This applies to all
> > remote files systems. They may yield a few events, but that is more by
> > accident than design.
> > 
> > -Steve




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

