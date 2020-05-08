Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AFF1A1CB70E
	for <lists+linux-audit@lfdr.de>; Fri,  8 May 2020 20:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588962237;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aDB8fWNopuP0ryt7zmJQP2GW2tSqtw1NRc4tdDVGUtM=;
	b=Te87erOMUolbCImbQL+AnJ4d/gdUGYvmlbxuc4pdC82rUfSw68MNA4J2RKpZXD5DIlmFQl
	hgGyctui6rd/pIa106FwziWFjDXbrwMLacldMbHSCXHaUhYVqsAA9wgv6FkvGHh62Z2V4C
	AM9Ly/y1G6U6ESMJPPhKml73lFfPZKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-5A_0W27ZPcycKcTypvOOkQ-1; Fri, 08 May 2020 14:23:55 -0400
X-MC-Unique: 5A_0W27ZPcycKcTypvOOkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CF571005510;
	Fri,  8 May 2020 18:23:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B08362A50;
	Fri,  8 May 2020 18:23:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0B2E4CAA0;
	Fri,  8 May 2020 18:23:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048INPEV007027 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 14:23:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C89BE62A50; Fri,  8 May 2020 18:23:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-49.phx2.redhat.com [10.3.113.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57FFA6AD1B;
	Fri,  8 May 2020 18:23:18 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak25 v4 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
Date: Fri, 08 May 2020 14:23:17 -0400
Message-ID: <1894903.vQEQaK82eK@x2>
Organization: Red Hat
In-Reply-To: <20200506224233.najv6ltb5gzcicqb@madcap2.tricolour.ca>
References: <cover.1587500467.git.rgb@redhat.com> <3250272.v6NOfJhyum@x2>
	<20200506224233.najv6ltb5gzcicqb@madcap2.tricolour.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, May 6, 2020 6:42:33 PM EDT Richard Guy Briggs wrote:
> > > > We can't be adding deleting fields based on how its triggered. If
> > > > they are unset, that is fine. The main issue is they have to behave
> > > > the same.
> > > 
> > > I don't think the intent was to have fields swing in and out depending
> > > on trigger.  The idea is to potentially permanently not include them in
> > > this record type only.  The justification is that where they aren't
> > > needed for the kernel trigger situation it made sense to delete them
> > > because if it is a user context event it will be accompanied by a
> > > syscall record that already has that information and there would be no
> > > sense in duplicating it.
> > 
> > We should not be adding syscall records to anything that does not result
> > from a syscall rule triggering the event. Its very wasteful. More
> > wasteful than just adding the necessary fields.
> 
> So what you are saying is you want all the fields that are being
> proposed to be added to this record?

Yes.

> If the records are all from one event, they all should all have the same
> timestamp/serial number so that the records are kept together and not
> mistaken for multiple events.

But NETFILTER_CFG is a simple event known to have only 1 record.

> One reason for having information in seperate records is to be able to
> filter them either in kernel or in userspace if you don't need certain
> records.

We can't filter out SYSCALL.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

