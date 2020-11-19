Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D54FA2B9BB7
	for <lists+linux-audit@lfdr.de>; Thu, 19 Nov 2020 20:54:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605815688;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DsIucDM6P+LWCBn5QefJQuwtYQGqMrSXxU5yEP+O4t4=;
	b=PtIVRuvChF6kkVeD9mqkOwpxbdR4z/COt6cmagOsPIfcLxhjJAKP+e8Sz0SqAPhujBQ7RZ
	VURY7N/DIk8ibXQq3PK1VY9+BedkL5wGi+hZEtqagaGo5FtaZOKNhsZ1fv8ELXNyR6Rcb7
	wrv08DLsYmUr4z4wtq6XRnzAiRJy/PQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-R6JBOV9YPKSAWRle1AuhYA-1; Thu, 19 Nov 2020 14:54:46 -0500
X-MC-Unique: R6JBOV9YPKSAWRle1AuhYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D357F80ED8E;
	Thu, 19 Nov 2020 19:54:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C686A5C232;
	Thu, 19 Nov 2020 19:54:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 18DF618095C9;
	Thu, 19 Nov 2020 19:54:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AJJsPLY009912 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 19 Nov 2020 14:54:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E603919C71; Thu, 19 Nov 2020 19:54:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-44.rdu2.redhat.com [10.10.116.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 853C119C47;
	Thu, 19 Nov 2020 19:54:22 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux-audit@redhat.com, Andreas Hasenack <andreas@canonical.com>
Subject: Re: -a never,exit still being logged
Date: Thu, 19 Nov 2020 14:54:20 -0500
Message-ID: <7875988.NyiUUSuA9g@x2>
Organization: Red Hat
In-Reply-To: <CANYNYEE1T5y9injWUjx=X300nC_GYRVW6P8WS+DLq3e1W=diLA@mail.gmail.com>
References: <CANYNYEEYUsU8BGj7E+=T=jyrkxVn1x60qipf8rvk1Oi6DPquyg@mail.gmail.com>
	<5560785.MhkbZ0Pkbq@x2>
	<CANYNYEE1T5y9injWUjx=X300nC_GYRVW6P8WS+DLq3e1W=diLA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, November 19, 2020 1:59:58 PM EST Andreas Hasenack wrote:
> Hi,
> 
> On Thu, Nov 19, 2020 at 3:52 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > On Thursday, November 19, 2020 1:43:34 PM EST Andreas Hasenack wrote:
> > > Why is it being logged, given that it matches the second (and last)
> > > rule I
> > > have?
> > 
> > These two events are considered kernel configuration changes. Which means
> > that they do not originate via the SYSCALL rule engine. The -a
> > never,exit technique works only when the event is generated as a result
> > of other SYSCALL rules. Normally you would place that higher up so it
> > matches first.
> > 
> > In this case, what you would want to do is suppress it using the exclude
> > filter:
> > 
> > -a always,exclude -F msgtype=NETFILTER_CFG
> > 
> > That should fix it.
> 
> I see, and I can still add auid=-1 to that one, right? Just not the exe
> filter?

You can add the -F auid=-1 if you want to.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

