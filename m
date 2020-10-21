Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA4229511B
	for <lists+linux-audit@lfdr.de>; Wed, 21 Oct 2020 18:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603298996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vh4Kq0+NI3jS5+EJfbBZsPV8SpXu8y5dxW7zEgczjSs=;
	b=W720/Lmby4f/Sy6X/ODpqpafaT3M45+81GUwV3NkcmCmoCamPHhp+hl7dy2titnNKXsXTU
	PfTJ3WXyMD4NoJ6xQVaJQIvb+FcV4gvouzXRa5vp/E3foGt5Mfe4lcNUraKwbYQxrX1760
	4hvlkizLHGIYcnJvmCAFBv9rM1SOu5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-oBROgdijNVGdvFEwkIi6Ug-1; Wed, 21 Oct 2020 12:49:50 -0400
X-MC-Unique: oBROgdijNVGdvFEwkIi6Ug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BB0A804B66;
	Wed, 21 Oct 2020 16:49:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD23A5D9F1;
	Wed, 21 Oct 2020 16:49:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DDEA28C7DF;
	Wed, 21 Oct 2020 16:49:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09LGnbZc008413 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 21 Oct 2020 12:49:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 088EB27CC3; Wed, 21 Oct 2020 16:49:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-184.rdu2.redhat.com [10.10.117.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 406B6389;
	Wed, 21 Oct 2020 16:49:26 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>, linux-audit@redhat.com
Subject: Re: [PATCH ghak90 V9 05/13] audit: log container info of syscalls
Date: Wed, 21 Oct 2020 12:49:25 -0400
Message-ID: <2174083.ElGaqSPkdT@x2>
Organization: Red Hat
In-Reply-To: <20201021163926.GA3929765@madcap2.tricolour.ca>
References: <cover.1593198710.git.rgb@redhat.com>
	<20201002195231.GH2882171@madcap2.tricolour.ca>
	<20201021163926.GA3929765@madcap2.tricolour.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, October 21, 2020 12:39:26 PM EDT Richard Guy Briggs wrote:
> > I think I have a way to generate a signal to multiple targets in one
> > syscall...  The added challenge is to also give those targets different
> > audit container identifiers.
> 
> Here is an exmple I was able to generate after updating the testsuite
> script to include a signalling example of a nested audit container
> identifier:
> 
> ----
> type=PROCTITLE msg=audit(2020-10-21 10:31:16.655:6731) :
> proctitle=/usr/bin/perl -w containerid/test type=CONTAINER_ID
> msg=audit(2020-10-21 10:31:16.655:6731) :
> contid=7129731255799087104^3333941723245477888 type=OBJ_PID
> msg=audit(2020-10-21 10:31:16.655:6731) : opid=115583 oauid=root ouid=root
> oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> ocomm=perl type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) :
> contid=3333941723245477888 type=OBJ_PID msg=audit(2020-10-21
> 10:31:16.655:6731) : opid=115580 oauid=root ouid=root oses=1
> obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
> type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) :
> contid=8098399240850112512^3333941723245477888 type=OBJ_PID
> msg=audit(2020-10-21 10:31:16.655:6731) : opid=115582 oauid=root ouid=root
> oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> ocomm=perl type=SYSCALL msg=audit(2020-10-21 10:31:16.655:6731) :
> arch=x86_64 syscall=kill success=yes exit=0 a0=0xfffe3c84 a1=SIGTERM
> a2=0x4d524554 a3=0x0 items=0 ppid=115564 pid=115567 auid=root uid=root
> gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root
> tty=ttyS0 ses=1 comm=perl exe=/usr/bin/perl
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> key=testsuite-1603290671-AcLtUulY ----
> 
> There are three CONTAINER_ID records which need some way of associating
> with OBJ_PID records.  An additional CONTAINER_ID record would be present
> if the killing process itself had an audit container identifier.  I think
> the most obvious way to connect them is with a pid= field in the
> CONTAINER_ID record.

pid is the process sending the signal, opid is the process receiving the 
signal. I think you mean opid?

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

