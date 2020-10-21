Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AA0652951DE
	for <lists+linux-audit@lfdr.de>; Wed, 21 Oct 2020 19:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603302929;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=39EAkQc0oXLoUX/iCChix6uuCycEXmbnI/Eyg3fvYqg=;
	b=cr7RZZI+SlUfqwvr6X2KP2GGsXVSXTFg7dN8tWTe0He1sF/pcaidyHH3aU6dcELLMubPmc
	VgMLDSW82O/Th9yJ1G2AZk3plBeYm+O5julTyPGSKUMFkmOU/IFF3wliP0DELBBmYMBKwc
	c1EqtoCiO4UKn/BNNUE8yUSLucTe3Ck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-j7H7L3-nMqms-R0IhxMbOw-1; Wed, 21 Oct 2020 13:55:27 -0400
X-MC-Unique: j7H7L3-nMqms-R0IhxMbOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 695AB18A0764;
	Wed, 21 Oct 2020 17:55:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20E936EF42;
	Wed, 21 Oct 2020 17:55:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F871181A71F;
	Wed, 21 Oct 2020 17:55:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09LHrKMR014490 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 21 Oct 2020 13:53:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 564135D9F1; Wed, 21 Oct 2020 17:53:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E934B5D9EF;
	Wed, 21 Oct 2020 17:53:06 +0000 (UTC)
Date: Wed, 21 Oct 2020 13:53:03 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH ghak90 V9 05/13] audit: log container info of syscalls
Message-ID: <20201021175303.GH2882171@madcap2.tricolour.ca>
References: <cover.1593198710.git.rgb@redhat.com>
	<20201002195231.GH2882171@madcap2.tricolour.ca>
	<20201021163926.GA3929765@madcap2.tricolour.ca>
	<2174083.ElGaqSPkdT@x2>
MIME-Version: 1.0
In-Reply-To: <2174083.ElGaqSPkdT@x2>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	ebiederm@xmission.com, simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-10-21 12:49, Steve Grubb wrote:
> On Wednesday, October 21, 2020 12:39:26 PM EDT Richard Guy Briggs wrote:
> > > I think I have a way to generate a signal to multiple targets in one
> > > syscall...  The added challenge is to also give those targets different
> > > audit container identifiers.
> > 
> > Here is an exmple I was able to generate after updating the testsuite
> > script to include a signalling example of a nested audit container
> > identifier:
> > 
> > ----
> > type=PROCTITLE msg=audit(2020-10-21 10:31:16.655:6731) :
> > proctitle=/usr/bin/perl -w containerid/test type=CONTAINER_ID
> > msg=audit(2020-10-21 10:31:16.655:6731) :
> > contid=7129731255799087104^3333941723245477888 type=OBJ_PID
> > msg=audit(2020-10-21 10:31:16.655:6731) : opid=115583 oauid=root ouid=root
> > oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> > ocomm=perl type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) :
> > contid=3333941723245477888 type=OBJ_PID msg=audit(2020-10-21
> > 10:31:16.655:6731) : opid=115580 oauid=root ouid=root oses=1
> > obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
> > type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) :
> > contid=8098399240850112512^3333941723245477888 type=OBJ_PID
> > msg=audit(2020-10-21 10:31:16.655:6731) : opid=115582 oauid=root ouid=root
> > oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> > ocomm=perl type=SYSCALL msg=audit(2020-10-21 10:31:16.655:6731) :
> > arch=x86_64 syscall=kill success=yes exit=0 a0=0xfffe3c84 a1=SIGTERM
> > a2=0x4d524554 a3=0x0 items=0 ppid=115564 pid=115567 auid=root uid=root
> > gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root
> > tty=ttyS0 ses=1 comm=perl exe=/usr/bin/perl
> > subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> > key=testsuite-1603290671-AcLtUulY ----
> > 
> > There are three CONTAINER_ID records which need some way of associating
> > with OBJ_PID records.  An additional CONTAINER_ID record would be present
> > if the killing process itself had an audit container identifier.  I think
> > the most obvious way to connect them is with a pid= field in the
> > CONTAINER_ID record.
> 
> pid is the process sending the signal, opid is the process receiving the 
> signal. I think you mean opid?

If the process sending the signal (it has a pid= field) has an audit
container identifier, it will generate a CONTAINER_ID record.  Each
process being signalled (each has an opid= field) that has an audit
container identifier will also generate a CONTAINER_ID record.  The
former will be much more common.  Which do we use in the CONTAINER_ID
record?  Having swinging fields, pid vs opid does not seem like a
reasonable solution.  Do we go back to "ref=pid=..." vs "ref=opid=..."?

> -Steve

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

