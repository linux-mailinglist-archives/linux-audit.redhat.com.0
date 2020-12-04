Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AEDF02CE5F3
	for <lists+linux-audit@lfdr.de>; Fri,  4 Dec 2020 03:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607050197;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9Ym7//Elw49vibG9lP5ltWagdastzhxZQY5ZUAA47Nc=;
	b=M0OiCN9cbJNkfGQIO0e2g/9pz5xNiIU4Q8X4/PLE+62+5oTBg8eztzUtb0JTgPR46QYkXM
	juGiHkdpjXj9T0BHouYJk0bV3ZtnSoh/TM6gjEqxMBtx2hFIoK2TnfUqcpHak4wrASLoLc
	52hWMV8cDKZAywwoXKRN3mGJWQQOBYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-HBK-RfoONwGWIIXM0ohZqQ-1; Thu, 03 Dec 2020 21:49:55 -0500
X-MC-Unique: HBK-RfoONwGWIIXM0ohZqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3197910054FF;
	Fri,  4 Dec 2020 02:49:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98FF35D6AC;
	Fri,  4 Dec 2020 02:49:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70CB54A7C6;
	Fri,  4 Dec 2020 02:49:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B42ln20006941 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 21:47:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7E3BA6085A; Fri,  4 Dec 2020 02:47:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-112-13.rdu2.redhat.com [10.10.112.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 104C360854;
	Fri,  4 Dec 2020 02:47:42 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
Date: Thu, 03 Dec 2020 21:47:40 -0500
Message-ID: <5413598.DvuYhMxLoT@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhQyMD3XiP91u__SwOH-toAa=YBaCrwtvE8dVRVdh-wA0g@mail.gmail.com>
References: <20200701213244.GA1817@linux-kernel-dev> <20883376.EfDdHjke4D@x2>
	<CAHC9VhQyMD3XiP91u__SwOH-toAa=YBaCrwtvE8dVRVdh-wA0g@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, December 3, 2020 9:16:52 PM EST Paul Moore wrote:
> > > > Author:     Richard Guy Briggs <rgb@redhat.com>
> > > > AuthorDate: 2014-11-17 15:51:01 -0500
> > > > Commit:     Paul Moore <pmoore@redhat.com>
> > > > CommitDate: 2014-11-17 16:53:51 -0500
> > > > ("audit: convert status version to a feature bitmap")
> > > > It was introduced specifically to enable distributions to selectively
> > > > backport features.  It was converted away from AUDIT_VERSION.
> > > > 
> > > > There are other ways to detect the presence of
> > > > backlog_wait_time_actual
> > > > as I mentioned above.
> > > 
> > > Let me be blunt - I honestly don't care what Steve's audit userspace
> > > does to detect this.  I've got my own opinion, but Steve's audit
> > > userspace is not my project to manage and I think we've established
> > > over the years that Steve and I have very different views on what
> > > constitutes good design.
> > 
> > And guessing what might be in buffers of different sizes is good design?
> > The FEATURE_BITMAP was introduced to get rid of this ambiguity.
> 
> There is just soo much to unpack in your comment Steve, but let me
> keep it short ...
> 
> - This is an enterprise distro problem, not an upstream problem.  The
> problems you are talking about are not a problem for upstream.

You may look at it that way. I do not. Audit -userspace is also an upstream 
for a lot of distros and I need to make this painless for them. So, while you 
may think of this being a backport problem for Red Hat to solve, I think of 
this as a generic problem that I'd like to solve for Debian, Suse, Ubuntu, 
Arch, Gentoo, anyone using audit. We both are upstream.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

